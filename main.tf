data "flux_sync" "this" {
  target_path        = local.paths_string
  url                = local.url
  branch             = local.branch
  namespace          = local.namespace
  git_implementation = local.git_implementation
  interval           = local.interval
}

# TODO: Syncs should be separate module. Maybe allow flux install module to configure multiple syncs.
data "kubectl_file_documents" "this" {
  content = data.flux_sync.this.content
}

locals {
  documents = [for doc in data.kubectl_file_documents.this.documents :
    {
      data : yamldecode(doc)
      content : doc
    }
  ]
}

resource "kubectl_manifest" "this" {
  for_each = { for yaml in local.documents :
    lower(
      join(
        "/",
        compact([yaml.data.apiVersion, yaml.data.kind, lookup(yaml.data.metadata, "namespace", ""), yaml.data.metadata.name]),
      )
    )
    => yaml.content
  }

  yaml_body = each.value
}

resource "tls_private_key" "this" {
  count = local.create_key ? 1 : 0

  algorithm   = "ECDSA"
  ecdsa_curve = "P521"
}

resource "kubernetes_secret" "this" {
  count = local.create_secret ? 1 : 0

  depends_on = [kubectl_manifest.this]

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
