# NSX-T Load Balancing Stage

## Use Cases

In this stage you configure NSX-T with Load Balancers for application servers from the prior VM stage.

Use the `terraform.tfvars.example` file as a template to populate the variables to deploy segements and firewalls.

## Prerequisites

 * Private Cloud is already deployed and accessible
 * NSX-T Segments are configured (stage 02a-nsxt)
 * vCenter is configured and VMs are deployed (stages 02b-vcenter and 03-vms)

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

 * modules/nsxt-load-balancer-pool
 * modules/nsxt-load-balancer-service
 * modules/nsxt-load-balancer-virtual-server
 