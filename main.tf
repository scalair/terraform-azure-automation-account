terraform {
  required_version = ">= 0.12.0"
}

resource "azurerm_automation_account" "auto_account" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name

  tags                = var.tags
}

module "aa_connection" {
  source    = "github.com/scalair/terraform-azure-automation-connection"

  count     = length(var.connections)

  name                      = var.connections[count.index].name
  resource_group_name       = var.resource_group_name
  automation_account_name   = azurerm_automation_account.auto_account.name

  application_id            = var.connections[count.index].application_id
  tenant_id                 = var.connections[count.index].tenant_id
  subscription_id           = var.connections[count.index].subscription_id
  certificate_thumbprint    = var.connections[count.index].certificate_thumbprint
}

module "aa_certificate" {
  source    = "github.com/scalair/terraform-azure-automation-certificate"

  count     = length(var.certificates)

  name                      = var.certificates[count.index].name
  resource_group_name       = var.resource_group_name
  automation_account_name   = azurerm_automation_account.auto_account.name
  base64                    = var.certificates[count.index].base64
}

