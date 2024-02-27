terraform {
  backend "gcs" {
    bucket = "terraform-fibanez"
    prefix = "terraform/state"
  }

  required_providers {
    google = {
      source  = "google"
      version = "~> 4.81"
    }
  }
}

provider "google" {
  project = "oa-bta-learning-dv"
  region  = "us-central1"
  zone    = "us-central1-c"
}