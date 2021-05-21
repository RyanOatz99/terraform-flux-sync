locals {
  name               = var.name
  namespace          = var.namespace
  url                = var.url
  branch             = var.branch
  path_prefix        = var.path_prefix
  git_implementation = var.git_implementation
  interval           = var.interval
  create_secret      = var.create_secret
  private_key        = var.private_key
  public_key         = var.public_key
}

locals {
  key_provided = length(var.private_key) > 0 || length(var.public_key) > 0
}

locals {
  create_key = var.create_key && !local.key_provided
  # Add path prefix to all paths if exists.
  paths = length(local.path_prefix) == 0 ? var.paths : formatlist("%s/%s", local.path_prefix, var.paths)
}

locals {
  paths_string       = join("\\,", local.paths)
  known_hosts_string = join("\n", var.known_hosts)
}
