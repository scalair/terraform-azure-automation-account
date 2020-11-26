# terraform-azure-automation-account

Terraform module to manage an `Automation Account`.

![Terraform Version](https://img.shields.io/badge/Terraform-0.13.x-green.svg)

It is based on our existing terraform modules related to `Automation Account` :

- [Azure Automation Certificate](https://github.com/scalair/terraform-azure-automation-certificate/)
- [Azure Automation Connection](https://github.com/scalair/terraform-azure-automation-connection/)

## Features

- manage an `Automation Account`
- create connections within this `Automation Account`
- create certificates within this `Automation Account`

## Usage

```hcl
module "automation_account"
  location              = "francecentral"
  resource_group_name   = "rg-project1-francecentral"
  name                  = "aa-testjds-1337"

  connections = [
  {
    name                    = "AzureRunAsConnection"
    application_id          = "xxx"
    tenant_id               = "xxx"
    subscription_id         = "xxx"
    certificate_thumbprint  = "xxx"
  }
  ]

  certificates = [
  {
    name    = "AzureRunAsCertificate"
    base64  = "/home/scalair/cert_nopwd.pfx"
  }
  ]

  tags = {
    environment = "dev"
    client      = "scalair"
    terraform   = "true"
  }
```
