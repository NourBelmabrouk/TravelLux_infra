terraform {
    required_version = ">1.1.7"
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~>3.31.0"
        }
        
        helm = {
        source  = "hashicorp/helm"
        version = "~>2.8.0"
        }
    }
    backend "azurerm" {
    resource_group_name  = "devops-project"
    storage_account_name = "devopsprojectbackend"
    container_name       = "backend"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
}