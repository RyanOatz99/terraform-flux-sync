module "flux-sync-basic" {
  source = "../../"

  url = "ssh://git@github.com/l2solutions/terraform-flux-sync.git"
}

module "flux-sync-complete" {
  source = "../../"

  name        = "test-name-1"
  namespace   = "test-ns-1"
  url         = "ssh://git@github.com/l2solutions/terraform-flux-sync.git"
  branch      = "examples"
  paths       = ["examples/complete/flux-1"]
  known_hosts = ["github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ=="]
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
