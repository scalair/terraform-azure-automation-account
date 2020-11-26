variable "name" {
  type          = string
  description   = "(Required) Specifies the name of the Automation Account. Changing this forces a new resource to be created."
}

variable "location" {
  type          = string
  description   = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type          = string
  description   = "(Required) The name of the resource group in which the Automation Account is created. Changing this forces a new resource to be created."
}

variable "sku_name" {
  type          = string
  description   = "(Optional) The SKU name of the account - only Basic is supported at this time."
  default       = "Basic"
}

variable "connections" {
  type          = list(object({
    name                    = string
    application_id          = string
    tenant_id               = string
    subscription_id         = string
    certificate_thumbprint  = string
  }))
  description   = "(Optional) List of maps of Automation Connection to create a this Automation Account."
  default       = []
}

variable "certificates" {
  type          = list(object({
    name        = string
    base64      = string
  }))
  description   = "(Optional) List of maps of Automation Certificate to create a this Automation Account."
  default       = []
}

variable "tags" {
  type          = map(string)
  description   = "(Optional) A mapping of tags to assign to the resource."
  default       = {}
}
