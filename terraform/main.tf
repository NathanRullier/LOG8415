# Configure the Azure provider
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
# Generate a random integer to create a globally unique name

# Create the resource group
resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup-final-project"
  location = "eastus"
}
# Create the Linux App Service Plan
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "webapp-asp-final-project"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind = "linux"
  reserved = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}
# Create the web app, pass in the App Service Plan ID, and deploy code from a public GitHub repo
resource "azurerm_app_service" "webapp" {
  name                = "webapp-final-project"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  site_config {                                                            
     linux_fx_version = "PYTHON|3.7"                                        
   }
  source_control {
    repo_url           = "https://github.com/NathanRullier/LOG8415/tree/main/webapp"
    branch             = "main"
    manual_integration = true
    use_mercurial      = false
  }
}

