
variable "resource_group_name" {
  type        = string
  description = "The name of the IBM Cloud resource group where the VPC instance will be created."
}

variable "provision" {
    description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
    type        = bool
    default = true
}


variable "cos_instance_id" {
    description = "id of the COS instance"
    type        = string
    default     = ""
}

variable "name_prefix" {
  type        = string
  description = "The name of the cos resource"
  default     = ""
}

variable "name" {
    description = "Name of the bucket"
    type        = string
    default     = ""
}


variable "region" {
    description = "Cross-regional bucket location. Supported values are us, eu, and ap.  Default 'us'"
    type        = string
    default     = "us"
}

variable "storage_class" {
    description = "Storage class of the bucket. Supported values are standard, vault, cold, flex, smart."
    type        = string
    default     = "standard"
}


variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud api token"
}
