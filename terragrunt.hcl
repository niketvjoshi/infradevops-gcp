# root terragrunt.hcl1
remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    project  = "id-seed-project"
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
}
EOF
}