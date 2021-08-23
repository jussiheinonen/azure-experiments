# Azure API Management demo
# Based on https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_backend

# Terraform environment
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}


# Azure resources
resource "azurerm_resource_group" "apim_demo_rg" {
  name                = "apim-demo-resources"
  location            = "uksouth"
  tags                = {
    environment       = "SEF Sandbox"
    syste_code        = "api management"
    team_dl           = "jussi.heinonen.external@atos.net"
                        }
}

resource "azurerm_api_management" "apim_demo_r" {
  name                = "jussi-apim"
  location            = azurerm_resource_group.apim_demo_rg.location
  resource_group_name = azurerm_resource_group.apim_demo_rg.name
  publisher_name      = "SEF Platform"
  publisher_email     = "jussi.heinonen.external@atos.net"
  sku_name            = "Developer_1"
}

# Takes veeeery long  time to create API resource 
# https://social.msdn.microsoft.com/Forums/azure/en-US/454d64c5-4e30-48dc-b205-2e51bf72b56c/why-api-management-service-take-too-long-to-get-activated?forum=azureapimgmt
resource "azurerm_api_management_backend" "apim_demo_backend_publish" {
  name                = "publish-api"
  resource_group_name = azurerm_resource_group.apim_demo_rg.name
  api_management_name = azurerm_api_management.apim_demo_r.name
  protocol            = "http"
  url                 = "https://tm7do0vu9j.execute-api.eu-west-1.amazonaws.com"
}