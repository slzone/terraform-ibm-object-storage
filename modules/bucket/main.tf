locals {
  prefix_name       = var.name_prefix != "" ? var.name_prefix : var.resource_group_name
  bucket_name       = lower(replace(var.name != "" ? var.name : "${var.resource_group_name}-cos-bucket", "_", "-"))
}

resource "ibm_cos_bucket" "bucket_instance" {

  count                   = (var.provision ? 1 : 0)
  bucket_name             = local.bucket_name
  resource_instance_id    = data.ibm_resource_instance.cos_instance.id
  cross_region_location   = var.region
  storage_class           = var.storage_class
}
