variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group."
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created."
  default     = "East US"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account. Must be globally unique and lowercase alphanumeric (3-24 characters)."
}

variable "storage_account_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account."
  default     = "Standard"
  validation {
    condition     = contains(["Standard", "Premium"], var.storage_account_tier)
    error_message = "Storage account tier must be either 'Standard' or 'Premium'."
  }
}

variable "storage_replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account."
  default     = "LRS"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
  default = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}