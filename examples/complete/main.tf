module "flux-sync-basic" {
  source = "../../"

  url = "ssh://git@github.com/l2solutions/terraform-flux-sync.git"
}

module "flux-sync-complete" {
  source = "../../"

  name      = "test-name-1"
  namespace = "test-ns-1"
  url       = "ssh://git@github.com/l2solutions/terraform-flux-sync.git"
  branch    = "examples"
  paths     = ["examples/complete/flux-1"]
}

module "flux-sync-multi-path" {
  source = "../../"

  name      = "test-name-2"
  namespace = "test-ns-3"
  url       = "ssh://git@github.com/l2solutions/terraform-flux-sync.git"
  branch    = "examples"
  paths     = ["examples/complete/flux-2", "examples/complete/flux-3"]
}

module "flux-sync-multi-path-prefixed" {
  source = "../../"

  name        = "test-name-3"
  namespace   = "test-ns-3"
  url         = "ssh://git@github.com/l2solutions/terraform-flux-sync.git"
  branch      = "examples"
  paths       = ["flux-4", "flux-5"]
  path_prefix = "examples/complete"
}
