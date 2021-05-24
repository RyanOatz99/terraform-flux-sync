variable "name" {
  description = "Name of the sync"
  default     = "default"
  type        = string
}

variable "namespace" {
  description = "Namespace to install in, and create(if enabled)"
  default     = "flux-system"
  type        = string
}

variable "url" {
  description = "URL of the source git repository"
  type        = string
}

variable "branch" {
  description = "Git repository source branch"
  default     = "main"
  type        = string
}

variable "paths" {
  description = "Git repository paths to the sync manifests"
  default     = [""]
  type        = list(string)
}

variable "path_prefix" {
  description = "Prefix to prepend to each path"
  default     = ""
  type        = string
}

variable "known_hosts" {
  description = "Known hosts for flux SSH"
  default     = []
  type        = list(string)
}

variable "git_implementation" {
  description = "Git implementation for flux to use"
  default     = "libgit2"
  type        = string
}

variable "interval" {
  description = "How often to check for changes in the git repository"
  default     = 1
  type        = number
}

variable "create_key" {
  description = "Whether or not to create the SSH key"
  default     = true
  type        = bool
}

variable "create_secret" {
  description = "Whether or not to create the Kubernetes secret for flux SSH"
  default     = true
  type        = bool
}

variable "private_key" {
  description = "SSH private key to use, will set `create_key` to false"
  default     = ""
  type        = string
}

variable "public_key" {
  description = "SSH public key to use, will set `create_key` to false"
  default     = ""
  type        = string
}
