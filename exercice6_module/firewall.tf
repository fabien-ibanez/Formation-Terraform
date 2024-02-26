resource "google_compute_firewall" "terraform-network" {  
    name    = "terraform-firewall-fi"
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