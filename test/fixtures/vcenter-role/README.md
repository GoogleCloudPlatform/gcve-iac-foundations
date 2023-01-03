# VMWare vSphere Roles Terraform Module
This Terraform module can be used to create and manage Roles in the vSphere

# Execution environment

The vCenter user must have administrator privileges, in GCVE will require to use the [elevate privileges feature](https://cloud.google.com/vmware-engine/docs/private-clouds/howto-elevate-privilege).

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_vsphere"></a> [vsphere](#requirement\_vsphere) | >= 2.0.2 |

## Usage
Basic usage of this module is as follows:

```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 vsphere_role_name  = 
	 vsphere_role_privileges  = 
}
```

## Resources

| Name | Type |
|------|------|
| [vsphere_role.vsphere_role](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vsphere_role_name"></a> [vsphere\_role\_name](#input\_vsphere\_role\_name) | The name of the role | `string` | n/a | yes |
| <a name="input_vsphere_role_privileges"></a> [vsphere\_role\_privileges](#input\_vsphere\_role\_privileges) | The privileges to be associated with the role | `list(string)` | n/a | yes |

## Outputs

No outputs.

<!-- END_AUTOMATED_TF_DOCS_BLOCK --> 