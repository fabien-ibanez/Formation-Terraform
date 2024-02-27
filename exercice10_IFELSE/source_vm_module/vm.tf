resource "google_compute_address" "static_ip" {
    name = "terraform-static-ip-fi"
}

resource "google_compute_instance" "vm_instance" {  
    name    = var.vm-name
    machine_type = var.env == "prd" ? "f1-micro"  : "f1-nano" 
 
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }
 
    network_interface {
        network = var.vpc-name 
        access_config {
            nat_ip = google_compute_address.static_ip.address
        }
    }
    tags = [ "firewall-test" ]
}