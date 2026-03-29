include "root" {
  path = find_in_parent_folders()
}

# This creates the "Zero Intervention" link
dependency "project" {
  path = "../project"
}

terraform {
  source = "tfr:///terraform-google-modules/network/google//modules/vpc?version=9.1.0"
}

inputs = {
  # Use the ID directly from the dependency above
  project_id   = dependency.project.outputs.project_id
  network_name = "infradevops-vpc-prod"
  routing_mode = "REGIONAL"

  subnets = [
    {
      subnet_name           = "mumbai-production-subnet"
      subnet_ip             = "10.0.1.0/24"
      subnet_region         = "asia-south1"
      private_ip_google_access = true
    }
  ]
}