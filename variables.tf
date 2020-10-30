variable "resource_group_name" {
  type        = string
  description = "Resource group where the cluster has been provisioned."
}

variable "resource_location" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
  default     = "global"
}

variable "cluster_id" {
  type        = string
  description = "Id of the cluster"
  default     = ""
}

variable "namespace_count" {
  type        = number
  description = "The number of namespaces"
  default     = 0
}

variable "namespaces" {
  type        = list(string)
  description = "Namespaces"
  default     = []
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = []
}

variable "name_prefix" {
  type        = string
  description = "The prefix name for the service. If not provided it will default to the resource group name"
  default     = ""
}

variable "plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite or standard)"
  default     = "standard"
}

variable "provision" {
  type        = bool
  description = "Flag indicating that key-protect instance should be provisioned"
}

variable "name" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = ""
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster"
  default     = ""
}
