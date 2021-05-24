output "namespace" {
  description = "The namespace flux was installed to"
  value       = local.namespace
}

output "public_key" {
  value = local.key_provided ? local.public_key : tls_private_key.this[0].public_key_openssh
}
