# COS Bucket Module

This module is used to create a COS bucket.

## Example Usage
```
module "ibm-cos-bucket" {
  source = "../../modules/ibm-cos-bucket"
  bucket_name             = var.bucket_name
  resource_instance_id    = data.ibm_resource_instance.cos_instance.id
  cross_region_location   = var.region
  storage_class           = var.storage_class
  }

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name           | Description                                                      | Type   |Default  |Required |
|----------------|------------------------------------------------------------------|--------|---------|---------|
| bucket_name    | Name of the bucket                                               | string | n/a     | yes     |
| plan           | The name of the plan type supported by service.                  | string | n/a     | yes     |
| location       | Target location or environment to create the bucket.             | string | n/a     | yes     |
| resource_group | Name of the resource group                                       | string | n/a     | yes     |
| region         | Target location or environment to create the resource instance.  |	string | n/a     | yes     |
| storage_class	 | Storage class to use for the bucket	                            | string | n/a	   | yes     |


## Outputs
| Name         | Description                     |
|--------------|---------------------------------|
| cos_instance | The details of the cos bucket.  |


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
