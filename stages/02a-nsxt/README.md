# NSX-T Stage

## Use Cases

In this stage you configure NSX-T with segments and gateway firewall policies.

Use the `terraform.tfvars.example` file as a template to populate the variables to deploy segements and firewalls.

## Prerequisites

 * Private Cloud is already deployed and accessible

## Instructions

To deploy this stage from a local UNIX shell, follow the steps:
 * Rename (or copy) the file `terraform.tfvars.example` to `terraform.tfvars` and fill in suitable variables for your environment.
 * Supply variables related to your GCVE NSX-T environment:
   * `export TF_VAR_nsxt_url=nsx-123456.abcdef01.asia-southeast1.gve.goog`
   * `export TF_VAR_nsxt_user=admin`
   * `export TF_VAR_nsxt_password="......."` # keep the quotations around the password
 * Initialize Terraform: `terraform init`
 * Validate the resources created by Terraform: `terraform plan`
 * Apply Terraform configurations: `terraform apply`

## Dependencies

 * modules/nsxt-segment
 * modules/nsxt-gateway-firewall
