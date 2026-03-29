include "root" {
  path = find_in_parent_folders()
}

terraform {
  # Use a verified Google module for VPCs
  source = "tfr:///terraform-google-modules/network/google//modules/vpc?version=9.1.0"
}

inputs = {
  project_id   = "id-prod-network-mumbai" # The name of the new project to create
  network_name = "infradevops-prod-vpc"
  routing_mode = "REGIONAL"

  # This automatically creates a subnet in Mumbai
  subnets = [
    {
      subnet_name           = "mumbai-app-subnet"
      subnet_ip             = "10.10.10.0/24"
      subnet_region         = "asia-south1"
      private_ip_google_access = true
    }
  ]
}