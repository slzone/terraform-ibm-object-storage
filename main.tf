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
  bind        = (var.provision || (!var.provision && var.name != "")) && var.cluster_name != ""
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

data "ibm_resource_instance" "cos_instance" {
  count             = local.bind ? 1 : 0
  depends_on        = [ibm_resource_instance.cos_instance]

  name              = local.name
  resource_group_id = data.ibm_resource_group.resource_group.id
  location          = var.resource_location
  service           = "cloud-object-storage"
}

resource "ibm_resource_key" "cos_credentials" {
  count = local.bind ? 1 : 0

  name                 = "${local.name}-key"
  resource_instance_id = data.ibm_resource_instance.cos_instance[0].id
  role                 = local.role

  //User can increase timeouts
  timeouts {
    create = "15m"
    delete = "15m"
  }
}

resource "ibm_container_bind_service" "cos_binding" {
  count      = local.bind ? var.namespace_count : 0

  cluster_name_id             = var.cluster_id
  service_instance_name       = local.name
  namespace_id                = var.namespaces[count.index]
  resource_group_id           = data.ibm_resource_group.resource_group.id
  key                         = ibm_resource_key.cos_credentials.name

  // The provider (v16.1) is incorrectly registering that these values change each time,
  // this may be removed in the future if this is fixed.
  lifecycle {
    ignore_changes = [id, namespace_id, service_instance_name]
  }
}
