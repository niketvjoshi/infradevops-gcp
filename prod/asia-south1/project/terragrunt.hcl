include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "tfr:///terraform-google-modules/project-factory/google?version=15.0.1"
}

inputs = {
  name            = "id-prod-mumbai-net"
  project_id      = "id-prod-mumbai-net"
  org_id          = "825630681207"      # Get this from 'gcloud organizations list'
  billing_account = "013A94-D79694-DDA8F0"  # Get this from 'gcloud billing accounts list'
  
  # This enables the Networking API automatically
  activate_apis = [
    "compute.googleapis.com",
    "servicenetworking.googleapis.com"
  ]
}