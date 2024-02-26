terraform {
    backend "local" {
    }

required_providers {
        google = {
        source = "google"
        version = "~> 4.81"
        }
    }
}

provider "google" {
    project = "oa-bta-learning-dv"
    region = "us-central1"
    zone = "us-central1-c"
    credentials = "oa-bta-learning-dv-ce1357df1875.json"
}

resource "google_compute_network" "vpc_network" {
    name = "terraform-network-FI"
}
resource "google_compute_address" "static_ip" {
    name = "terraform-static-ip-FI"
}

resource "google_compute_instance" "vm_instance" {  
    name    = "terraform-instance"
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
 
resource "google_compute_firewall" "terraform-network" {  
    name    = "terraform-firewall"
    network = google_compute_network.vpc_network.name
    target_tags = [ "firewall-test" ]  
    source_ranges = ["0.0.0.0/0"]
   
    allow {
        protocol = "icmp"
    }
    allow {
        protocol = "tcp"
        ports   = ["3000", "8080",  "9091", "2375", "9411", "9090", "7979", "22"]
    }
}
 
output "ip" {
    value = google_compute_address.static_ip.address
}