Three-tier-architecture
Infrastructure provisioning using Terraform & Azure

Structure as follows:

main.tf
variables.tf
terraform.tfvars (this file should not be exported to repositories as it contains sensitive data. But, for demo purpose its been commented out from .gitignore file)

Respective modules:
resourcegroup
vnet_compute
nsgroup
vm_compute
backend_db

Please check the sample plan output visual (terraform_plan_output_visual.png): Generated using the help tool - https://hieven.github.io/terraform-visual/

