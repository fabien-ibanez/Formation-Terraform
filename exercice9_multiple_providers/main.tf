terraform {
    backend "gcs" {
        bucket = "terraform-fibanez"
        prefix = "terraform/state"
        credentials = "oa-bta-learning-dv-ce1357df1875.json"
}

required_providers {
        google = {
        source = "google"
        version = "~> 4.81"
        }
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 3.90"
        }
    }
}

provider "google" {
    project = "oa-bta-learning-dv"
    region = "us-central1"
    zone = "us-central1-c"
    credentials = "oa-bta-learning-dv-ce1357df1875.json"
    alias = "gcp"
}

provider "azurerm" {
features {}
alias = "azure"
skip_provider_registration = true
}