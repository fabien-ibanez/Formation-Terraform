data "google_client_config" "current" {
    provider = google.gcp
}

data "azure_client_config" "current" {
    provider = azurerm.azure
}