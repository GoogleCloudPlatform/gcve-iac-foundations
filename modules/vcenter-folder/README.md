# VMWare vCenter Folder Terraform Module
This Terraform module creates folders in the vCenter

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
	 datacenter  = 
	 folder_path  = 
	 folder_type  = 

	 # Optional variables
	 custom_attributes  = {}
	 role_assignments  = {}
	 tags  = {}
	 vsphere_folder_object_type  = "Folder"
}
```

## Resources

| Name | Type |
|------|------|
| [vsphere_entity_permissions.vsphere_entity_permissions](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/entity_permissions) | resource |
| [vsphere_folder.vsphere_folder](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/folder) | resource |
| [vsphere_custom_attribute.attribute](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/custom_attribute) | data source |
| [vsphere_datacenter.vsphere_datacenter](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datacenter) | data source |
| [vsphere_role.vsphere_role](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/role) | data source |
| [vsphere_tag.tag](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/tag) | data source |
| [vsphere_tag_category.category](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/tag_category) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_attributes"></a> [custom\_attributes](#input\_custom\_attributes) | The map of custom attributes to be attached to folder entity | `map(string)` | `{}` | no |
| <a name="input_datacenter"></a> [datacenter](#input\_datacenter) | Provide the datacenter name | `string` | n/a | yes |
| <a name="input_folder_path"></a> [folder\_path](#input\_folder\_path) | Provide the folders path | `string` | n/a | yes |
| <a name="input_folder_type"></a> [folder\_type](#input\_folder\_type) | Provide the folders type | `string` | n/a | yes |
| <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments) | The map of role assignments to be attached to folder entity | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The list of tags IDs to attached to folder entity | `map(any)` | `{}` | no |
| <a name="input_vsphere_folder_object_type"></a> [vsphere\_folder\_object\_type](#input\_vsphere\_folder\_object\_type) | Provide the associable folders object type | `string` | `"Folder"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vcenter_folder"></a> [vcenter\_folder](#output\_vcenter\_folder) | The vCenter resource object of the created vcenter folder. |
| <a name="output_vcenter_folder_id"></a> [vcenter\_folder\_id](#output\_vcenter\_folder\_id) | The vCenter resource ID for the created vcenter folder. |

<!-- END_AUTOMATED_TF_DOCS_BLOCK --> 