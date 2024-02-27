module "vm" {
  source = "./vm"

  vm-name = "vm-instance-fi"
  vpc-name = google_compute_network.vpc_network.name
}
