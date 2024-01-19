terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.10.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    prefect = {
      source  = "PrefectHQ/prefect"
      version = "0.1.1"
    }
  }
  backend "gcs" {
    bucket = "terraform-state-pb"
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

provider "prefect" {
  api_key    = var.prefect_api_key
  account_id = var.prefect_account_id
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "azurerm" {
  features {}

  client_id       = var.azurerm_client_id
  client_secret   = var.azurerm_client_secret
  tenant_id       = var.azurerm_tenant_id
  subscription_id = var.azurerm_subscription_id
}