module "create_vm" {
  source  = "./source_vm_module"
  vm-name = "my-vm-fi"
  vpc-name = google_compute_network.vpc_network.name
  env = "prd"
}