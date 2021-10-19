# terraform-flux-sync

## terraform-docs usage

`sed -i '' '/^<!--- start terraform-docs --->/q' README.md && terraform-docs md . >> README.md`

<!--- start terraform-docs --->

## Requirements

| Name                                                                        | Version |
| --------------------------------------------------------------------------- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | >= 0.15 |
| <a name="requirement_flux"></a> [flux](#requirement_flux)                   | 0.1.3   |
| <a name="requirement_kubectl"></a> [kubectl](#requirement_kubectl)          | 1.10.0  |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement_kubernetes) | 2.1.0   |
| <a name="requirement_tls"></a> [tls](#requirement_tls)                      | 3.1.0   |

## Providers

| Name                                                                  | Version |
| --------------------------------------------------------------------- | ------- |
| <a name="provider_flux"></a> [flux](#provider_flux)                   | 0.1.3   |
| <a name="provider_kubectl"></a> [kubectl](#provider_kubectl)          | 1.10.0  |
| <a name="provider_kubernetes"></a> [kubernetes](#provider_kubernetes) | 2.1.0   |
| <a name="provider_tls"></a> [tls](#provider_tls)                      | 3.1.0   |

## Modules

No modules.

## Resources

| Name                                                                                                                               | Type        |
| ---------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [kubectl_manifest.this](https://registry.terraform.io/providers/gavinbunney/kubectl/1.10.0/docs/resources/manifest)                | resource    |
| [kubernetes_secret.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.1.0/docs/resources/secret)                 | resource    |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/3.1.0/docs/resources/private_key)                     | resource    |
| [flux_sync.this](https://registry.terraform.io/providers/fluxcd/flux/0.1.3/docs/data-sources/sync)                                 | data source |
| [kubectl_file_documents.this](https://registry.terraform.io/providers/gavinbunney/kubectl/1.10.0/docs/data-sources/file_documents) | data source |

## Inputs

| Name                                                                                    | Description                                                 | Type           | Default                  | Required |
| --------------------------------------------------------------------------------------- | ----------------------------------------------------------- | -------------- | ------------------------ | :------: |
| <a name="input_branch"></a> [branch](#input_branch)                                     | Git repository source branch                                | `string`       | `"main"`                 |    no    |
| <a name="input_create_key"></a> [create_key](#input_create_key)                         | Whether or not to create the SSH key                        | `bool`         | `true`                   |    no    |
| <a name="input_create_secret"></a> [create_secret](#input_create_secret)                | Whether or not to create the Kubernetes secret for flux SSH | `bool`         | `true`                   |    no    |
| <a name="input_git_implementation"></a> [git_implementation](#input_git_implementation) | Git implementation for flux to use                          | `string`       | `"libgit2"`              |    no    |
| <a name="input_interval"></a> [interval](#input_interval)                               | How often to check for changes in the git repository        | `number`       | `1`                      |    no    |
| <a name="input_known_hosts"></a> [known_hosts](#input_known_hosts)                      | Known hosts for flux SSH                                    | `list(string)` | `[]`                     |    no    |
| <a name="input_name"></a> [name](#input_name)                                           | Name of the sync                                            | `string`       | `"default"`              |    no    |
| <a name="input_namespace"></a> [namespace](#input_namespace)                            | Namespace to install in, and create(if enabled)             | `string`       | `"flux-system"`          |    no    |
| <a name="input_path_prefix"></a> [path_prefix](#input_path_prefix)                      | Prefix to prepend to each path                              | `string`       | `""`                     |    no    |
| <a name="input_paths"></a> [paths](#input_paths)                                        | Git repository paths to the sync manifests                  | `list(string)` | <pre>[<br> ""<br>]</pre> |    no    |
| <a name="input_private_key"></a> [private_key](#input_private_key)                      | SSH private key to use, will set `create_key` to false      | `string`       | `""`                     |    no    |
| <a name="input_public_key"></a> [public_key](#input_public_key)                         | SSH public key to use, will set `create_key` to false       | `string`       | `""`                     |    no    |
| <a name="input_url"></a> [url](#input_url)                                              | URL of the source git repository                            | `string`       | n/a                      |   yes    |

## Outputs

| Name                                                              | Description                         |
| ----------------------------------------------------------------- | ----------------------------------- |
| <a name="output_namespace"></a> [namespace](#output_namespace)    | The namespace flux was installed to |
| <a name="output_public_key"></a> [public_key](#output_public_key) | n/a                                 |
