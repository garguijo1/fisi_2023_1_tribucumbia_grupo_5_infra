variable "app_plan_name" {
  type          = string
  description   = "The app service plan name"
}

variable "app_service_name" {
  type          = string
  description   = "The app service name"
}

variable "resource_group_name" {
  type          = string
  description   = "Name of the resource group"
}

variable "location" {
  type          = string
  description   = "The location for the deployment"
}

variable "version" {
  type          = string
  description   = "version lts"
}