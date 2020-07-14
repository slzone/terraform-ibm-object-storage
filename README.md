# Object Storage terraform module

Terraform module to provision Object Storage in the IBM Cloud account

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v12
- kubectl

### Terraform providers

- IBM Cloud provider >= 1.5.3

## Module dependencies

This module makes use of the output from other modules:

- Cluster - github.com/ibm-garage-cloud/terraform-ibm-container-platform.git

## Example usage

```hcl-terraform
module "dev_object_storage" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-object-storage.git?ref=v1.0.0"

  resource_group_name = module.dev_cluster.resource_group_name
  resource_location   = module.dev_cluster.region
  cluster_id          = module.dev_cluster.id
  namespaces          = module.dev_tools_namespace.name
  namespace_count     = var.release_namespace_count
  name_prefix         = var.name_prefix
}
```
