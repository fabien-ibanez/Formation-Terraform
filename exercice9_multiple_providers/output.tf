output "ip_vm" {
  value = module.create_vm.ip_vm
}
output "vpc_name" {
  value = module.network.network_name
}
output "project" {
  value = data.google_client_config.current.project
}
output "type_machine" {
  value = module.create_vm.vm_type_machine
}