## Self Hosted Runners on Managed Instance Group

This terraform code handles the opinionated creation of infrastructure necessary to deploy Github Self Hosted Runners on MIG in order to run GCVE IaC Foundation Terraform Code.

This includes:

- Enabling necessary APIs
- VPC
- NAT & Cloud Router
- Service Account for MIG
- MIG Instance Template
- MIG Instance Manager
- FW Rules
- Secret Manager Secret


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_network | When set to true, VPC,router and NAT will be auto created | `bool` | `false` | no |
| create\_subnetwork | Whether to create subnetwork or use the one provided via subnet\_name | `bool` | `false` | no |
| gh\_token | Github token that is used for generating Self Hosted Runner Token | `string` | n/a | yes |
| instance\_name | The gce instance name | `string` | `"gh-runner"` | no |
| machine\_type | The GCP machine type to deploy | `string` | `"n1-standard-1"` | no |
| max\_replicas | Maximum number of runner instances | `number` | `3` | no |
| min\_replicas | Minimum number of runner instances | `number` | `1` | no |
| network\_name | Name for the VPC network | `string` | n/a | yes |
| project\_id | The project id to deploy Github Runner | `string` | n/a | yes |
| region | The GCP region to deploy instances into | `string` | n/a | yes |
| repo\_name | Name of the repo for the Github Action | `string` | n/a | yes |
| repo\_owner | Owner of the repo for the Github Action | `string` | n/a | yes |
| service\_account | Service account email address | `string` | `""` | no |
| subnet\_name | Name for the subnet | `string` | n/a | yes |
| zone | The GCP zone to deploy instances into | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| mig\_instance\_group | The instance group url of the created MIG |
| mig\_instance\_template | The name of the MIG Instance Template |
| mig\_name | The name of the MIG |
| network\_name | Name of VPC |
| service\_account | Service account email for GCE |
| subnet\_name | Name of VPC |

 <!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

Before this module can be used on a project, you must ensure that the following pre-requisites are fulfilled:

1. Required APIs are activated

    ```
    "iam.googleapis.com",
    "compute.googleapis.com",
    "storage-component.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "secretmanager.googleapis.com",
    ```
