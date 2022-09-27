# Private Cloud

## Monitoring

Once the private cloud is created, a GCE VM instance will be created where the observability agent is installed to retrieve VMWare metrics and logs into GCP. 
The monitoring setup approach will include:
- enable monitoring API on the project
- creating a new GCE VM instance
- creating a new service account with monitoring & logging permissions
- installing the GCVE observability agent in the GCE VM
- ability to create new GCVE dashboards

Reference guide: [GCVE - Setting up Cloud Monitoring with a standalone agent](https://cloud.google.com/vmware-engine/docs/environment/howto-cloud-monitoring-standalone)

## Prerequisites

 * Private Cloud is already deployed and accessible
 * Secrets created in Secret Manager containing the values for vsphere_server (fqdn), vsphere_user (must be admin) and vsphere_password

## Instructions

To deploy this stage from a local UNIX shell, follow the steps:
 * Rename (or copy) the file `terraform.tfvars.example` to `terraform.tfvars` and fill in suitable variables for your environment.
 * Initialize Terraform: `terraform init`
 * Validate the resources created by Terraform: `terraform plan`
 * Apply Terraform configurations: `terraform apply`
