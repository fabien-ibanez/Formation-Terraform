module "create_vm" {
  source  = "./source_vm_module"
  vm-name = "my-vm-fi"
  vpc-name = module.network.network_name
}