output "id" {
  description = "The Automation Account ID."
  value       = azurerm_automation_account.auto_account.id
}

output "name" {
  description = "The Automation Account name."
  value       = var.name
}

output "resource_group_name" {
  description = "The Automation Account resource group name."
  value       = var.resource_group_name
}

output "endpoint" {
  description = "The DSC Server Endpoint associated with this Automation Account."
  value       = azurerm_automation_account.auto_account.dsc_server_endpoint
}

output "primary_access_key" {
  description = "The Primary Access Key for the DSC Endpoint associated with this Automation Account."
  value       = azurerm_automation_account.auto_account.dsc_primary_access_key
  sensitive   = true
}

output "secondary_access_key" {
  description = "The Secondary Access Key for the DSC Endpoint associated with this Automation Account."
  value       = azurerm_automation_account.auto_account.dsc_secondary_access_key
  sensitive   = true
}
