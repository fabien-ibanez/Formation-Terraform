resource "google_compute_network" "vpc_network" {
    name = "terraform-network-fi"
}

resource "google_compute_firewall" "terraform-network" {  
    name	= "terraform-firewall-fi"
    network = google_compute_network.vpc_network.name
    target_tags = [ "firewall-test" ]  
    source_ranges = ["0.0.0.0/0"]
    
    dynamic "allow" {
        for_each = var.allow
        iterator = item   #optional
        content {
            protocol           = item.value.protocol
            ports              = item.value.ports
        }
    }
}


