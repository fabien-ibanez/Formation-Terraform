resource "google_compute_network" "vpc_network" {
    name = "terraform-network-fi"
}
resource "google_compute_address" "static_ip" {
    name = "terraform-static-ip-fi"
}