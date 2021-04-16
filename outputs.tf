output "name" {
  description = "The Object Storage instance name"
  value       = local.name
  depends_on  = [data.ibm_resource_instance.cos_instance]
}

output "id" {
  description = "The Object Storage instance id"
  value       = data.ibm_resource_instance.cos_instance.id
  depends_on  = [data.ibm_resource_instance.cos_instance]
}

output "crn" {
  description = "The crn of the Object Storage instance id"
  value       = data.ibm_resource_instance.cos_instance.guid
  depends_on  = [data.ibm_resource_instance.cos_instance]
}

output "location" {
  description = "The Object Storage instance location"
  value       = var.resource_location
  depends_on  = [data.ibm_resource_instance.cos_instance]
}

output "key_name" {
  description = "The name of the credential provisioned for the Object Storage instance"
  value       = local.key_name
  depends_on  = [ibm_resource_key.cos_credentials]
}

output "key_id" {
  description = "The name of the credential provisioned for the Object Storage instance"
  value       = ibm_resource_key.cos_credentials.id
  depends_on  = [ibm_resource_key.cos_credentials]
}
