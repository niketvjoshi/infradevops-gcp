# infrastructure-live/org-level/policies/terragrunt.hcl

inputs = {
  policy_type = "resourceUsageRestriction"
  organization_id = "825630681207"
  # Strictly allow only Mumbai and Delhi
  allowed_values = [
    "under:locations/asia-south1"
  ]
}