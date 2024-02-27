output "ip_vm" {
    value = google_compute_address.static_ip.address
}
output "vm_type_machine" {
  value = data.google_compute_instance.data_vm_module.machine_type
}