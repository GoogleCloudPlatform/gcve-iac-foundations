<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_nsxt"></a> [nsxt](#requirement\_nsxt) | >= 3.2.7 |

## Usage
Basic usage of this module is as follows:

```hcl
module "example" {
	 source  = "<module-path>"

	 # Optional variables
	 criteria  = []
	 description  = "Managed by Terraform"
	 display_name  = "My Policy Group"
}
```

## Resources

| Name | Type |
|------|------|
| [nsxt_policy_group.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_criteria"></a> [criteria](#input\_criteria) | Membership criteria for security group. | <pre>list(object({<br>    key         = optional(string)<br>    member_type = optional(string)<br>    operator    = optional(string)<br>    value       = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of NSX-T Policy Group | `string` | `"Managed by Terraform"` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display Name of NSX-T Policy Group | `string` | `"My Policy Group"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsxt_policy_group"></a> [nsxt\_policy\_group](#output\_nsxt\_policy\_group) | The nsxt policy group object |

<!-- END_AUTOMATED_TF_DOCS_BLOCK -->
