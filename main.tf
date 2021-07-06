data "flux_sync" "this" {
  target_path        = local.paths_string
  url                = local.url
  branch             = local.branch
  namespace          = local.namespace
  git_implementation = local.git_implementation
  interval           = local.interval
}

data "kubectl_file_documents" "this" {
  content = data.flux_sync.this.content
}

locals {
  native_docs = [for doc in data.kubectl_file_documents.this.documents : yamldecode(doc)]
}

locals {
  git_repository_documents = [local.native_docs[0]]
  kustomization_documents = [for idx, path in local.paths :
    merge(
      local.native_docs[1],
      {
        metadata = merge(
          local.native_docs[1].metadata,
          { name = format("%s-%s", data.flux_sync.this.name, idx) },
        )
        spec = merge(
          local.native_docs[1].spec,
          { path = format("./%s", path) },
        )
      }
    )
  ]
}

locals {
  documents = concat(local.git_repository_documents, local.kustomization_documents)
}

resource "kubernetes_manifest" "this" {
  provider = kubernetes-alpha

  for_each = local.documents

  manifest = yamldecode(each.value)
}


resource "tls_private_key" "this" {
  count = local.create_key ? 1 : 0

  algorithm   = "ECDSA"
  ecdsa_curve = "P521"
}

resource "kubernetes_secret" "this" {
  count = local.create_secret ? 1 : 0

  depends_on = [kubernetes_manifest.this]

  metadata {
    name      = data.flux_sync.this.secret
    namespace = data.flux_sync.this.namespace
  }

  data = {
    identity       = local.key_provided ? local.private_key : tls_private_key.this[0].private_key_pem
    "identity.pub" = local.key_provided ? local.public_key : tls_private_key.this[0].public_key_pem
    known_hosts    = local.known_hosts_string
  }
}
