# vCenter Stage

## Use Cases

In this stage vCenter will be configured with a folder hierarchy, resource pools and permissions.

Use the `terraform.tfvar.example` file as a template to populate the variables to deploy a folder and resource pool hierarchy.

If a nested hierarchy of folders should be deployed, deploy the folder module for each hierarchy sequentially with the `depends_on` meta-argument.

## Prerequisites

 * Private Cloud is already deployed and accessible
 * Roles and identities which are assigned to resource pools and folders need to exist before executing this stage. See example
 `vcenter-role` for sample code on how to create roles in vCenter.

## Instructions

To deploy this stage from a local UNIX shell, follow the steps:
 * Rename (or copy) the file `terraform.tfvars.example` to `terraform.tfvars` and fill in suitable variables for your environment.
 * Supply variables related to your GCVE vSphere environment:
   * `export TF_VAR_vsphere_server=vcsa-123456.abcdef01.asia-southeast1.gve.goog`
   * `export TF_VAR_vsphere_user=CloudOwner@gve.local`
   * `export TF_VAR_vsphere_password=.......`
 * Initialize Terraform: `terraform init`
 * Validate the resources created by Terraform: `terraform plan`
 * Apply Terraform configurations: `terraform apply`

## Dependencies

 * modules/vcenter-resource-pool
 * modules/vcenter-folder
 