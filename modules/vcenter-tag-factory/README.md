# VMWare vSphere Tag Factory Terraform Module
This Terraform module creates tags and tag category in the vCenter

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
	 tag_category_cardinality  = 
	 tag_category_description  = 
	 tag_category_name  = 

	 # Optional variables
	 tag_category_associable_types  = []
	 tags  = {}
}
```

## Resources

| Name | Type |
|------|------|
| [vsphere_tag.tag](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/tag) | resource |
| [vsphere_tag_category.category](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/tag_category) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tag_category_associable_types"></a> [tag\_category\_associable\_types](#input\_tag\_category\_associable\_types) | The associable types for Tag Category | `list(string)` | `[]` | no |
| <a name="input_tag_category_cardinality"></a> [tag\_category\_cardinality](#input\_tag\_category\_cardinality) | The Tag Category Cardinality | `string` | n/a | yes |
| <a name="input_tag_category_description"></a> [tag\_category\_description](#input\_tag\_category\_description) | The Tag Category Description | `string` | n/a | yes |
| <a name="input_tag_category_name"></a> [tag\_category\_name](#input\_tag\_category\_name) | The Tag Category Name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be created in Tag Category | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tag_category"></a> [tag\_category](#output\_tag\_category) | The resource object of the created vcenter tag category |
| <a name="output_tags"></a> [tags](#output\_tags) | The resource object of the created vcenter tags |

<!-- END_AUTOMATED_TF_DOCS_BLOCK --> 