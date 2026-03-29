# root terragrunt.hcl
remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    project  = "infradevops-seed-mumbai"
    location = "asia-south1"
    bucket   = "infradevops-tf-state-mumbai"
    prefix   = "${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  region = "asia-south1"
  impersonate_service_account = "terraform-admin@infradevops-seed-mumbai.iam.gserviceaccount.com"
}
EOF
}