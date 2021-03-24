module "dev_object-storage" {
  source = "./module"

  provision = true
  resource_group_name = var.resource_group_name
}
