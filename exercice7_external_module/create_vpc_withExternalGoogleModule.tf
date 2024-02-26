module "network" {
  source  = "terraform-google-modules/network/google"
  version = "9.0.0"
  network_name = "terraform-network-fi"
  project_id = "oa-bta-learning-dv"
  subnets = []
  auto_create_subnetworks = "true"
  ingress_rules = [
    {
      name          = "terraform-firewall-azakowic"
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["firewall-test"]
 
      allow = [
        {
          protocol = "icmp"
        },
        {
          protocol = "tcp",
          ports    = ["3000", "8080", "9091", "2375", "9411", "9090", "7979", "22"]
        }
      ]
    }
  ]
}