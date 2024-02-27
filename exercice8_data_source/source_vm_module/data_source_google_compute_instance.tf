data "google_compute_instance" "data_vm_module" {
    name = .vm_instance.name
}