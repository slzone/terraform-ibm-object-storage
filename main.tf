provider "ibm" {
  version = ">= 1.2.1"
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

locals {
  role        = "Manager"
  name_prefix = var.name_prefix != "" ? var.name_prefix : var.resource_group_name
  name        = var.name != "" ? var.name : "${replace(local.name_prefix, "/[^a-zA-Z0-9_\\-\\.]/", "")}-cos"
  module_path = substr(path.module, 0, 1) == "/" ? path.module : "./${path.module}"
}

// COS Cloud Object Storage
resource "ibm_resource_instance" "cos_instance" {
  count             = var.provision ? 1 : 0

  name              = local.name
  service           = "cloud-object-storage"
  plan              = var.plan
  location          = var.resource_location
  resource_group_id = data.ibm_resource_group.resource_group.id
  tags              = var.tags

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

resource "ibm_resource_key" "cos_credentials" {
  count             = var.provision ? 1 : 0

  name                 = "${local.name}-key"
  resource_instance_id = ibm_resource_instance.cos_instance[0].id
  role                 = local.role

  //User can increase timeouts
  timeouts {
    create = "15m"
    delete = "15m"
  }
}
