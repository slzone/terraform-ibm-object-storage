# COS instance Module

This module is used to create a COS instance.

## Example Usage
```
module "ibm-cos-instance" {
  source = "../../modules/ibm-cos-instance"
  name              = var.name
  service           = var.service
  plan              = var.plan
  location          = var.resource_location
  resource_group_id = data.ibm_resource_group.resource_group.id
  tags              = var.tags
}


```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name           | Description                                                      | Type   |Default  |Required |
|----------------|------------------------------------------------------------------|--------|---------|---------|
| name           | A descriptive name used to identify the resource instance        | string | n/a     | yes     |
| plan           | The name of the plan type supported by service.                  | string | n/a     | yes     |
| location       | Target location or environment to create the resource instance.  | string | n/a     | yes     |
| resource_group | Name of the resource group                                       | string | n/a     | yes     |

## Outputs
| Name         | Description                     |
|--------------|---------------------------------|
| cos_instance | The details of the cos Instance.|


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan 
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.

 ## Note:
 All optional fields are given value `null` in varaible.tf file. User can configure the same by overwriting with appropriate values.
