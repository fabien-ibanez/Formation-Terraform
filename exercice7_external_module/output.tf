output "ip_vm" {
  value = module.create_vm.ip_vm
}
output "vpc_name" {
  value = module.network.network_name
}