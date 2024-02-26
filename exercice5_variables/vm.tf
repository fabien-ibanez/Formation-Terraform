resource "google_compute_instance" "vm_instance" {  
    name    = var.vm-name
    machine_type = "f1-micro"  
 
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }
 
    network_interface {
        network = google_compute_network.vpc_network.name  
        access_config {
            nat_ip = google_compute_address.static_ip.address
        }
    }
    tags = [ "firewall-test" ]
}

output "ip" {
    value = google_compute_address.static_ip.address
}