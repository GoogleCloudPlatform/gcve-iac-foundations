# VMWare NSX-T Tier1 Gateway Terraform Module
This Terraform configures a Tier1 gateway.

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

	 # Required variables
	 edge_cluster_path  = 
	 tier0_gateway_path  = 

	 # Optional variables
	 default_rule_logging  = false
	 dhcp_config_path  = null
	 display_name  = "tier1-gw"
	 enable_firewall  = false
	 enable_standby_relocation  = false
	 failover_mode  = "NON_PREEMPTIVE"
	 pool_allocation  = "ROUTING"
	 resource_description  = "Terraform provisioned"
	 route_advertisement_types  = [
  "TIER1_CONNECTED"
]
	 tags  = {}
}
```

## Resources

| Name | Type |
|------|------|
| [nsxt_policy_tier1_gateway.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier1_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_rule_logging"></a> [default\_rule\_logging](#input\_default\_rule\_logging) | Whether the built-in default firewall rule on the gateway logs. | `bool` | `false` | no |
| <a name="input_dhcp_config_path"></a> [dhcp\_config\_path](#input\_dhcp\_config\_path) | The path for the NSXT dhcp server resource. Null means disabled | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The name assigned to the Tier1 gateway created with this module | `string` | `"tier1-gw"` | no |
| <a name="input_edge_cluster_path"></a> [edge\_cluster\_path](#input\_edge\_cluster\_path) | The path to the edge cluster where the new Tier1 gateway will be placed. | `string` | n/a | yes |
| <a name="input_enable_firewall"></a> [enable\_firewall](#input\_enable\_firewall) | Should the firewall be enabled on this gateway? | `bool` | `false` | no |
| <a name="input_enable_standby_relocation"></a> [enable\_standby\_relocation](#input\_enable\_standby\_relocation) | Should standy relocation be enabled on this gateway? | `bool` | `false` | no |
| <a name="input_failover_mode"></a> [failover\_mode](#input\_failover\_mode) | The NSX-T failover mode for the gateway. | `string` | `"NON_PREEMPTIVE"` | no |
| <a name="input_pool_allocation"></a> [pool\_allocation](#input\_pool\_allocation) | The NSX-T pool allocation mode. | `string` | `"ROUTING"` | no |
| <a name="input_resource_description"></a> [resource\_description](#input\_resource\_description) | A string added to the description field of all created resources | `string` | `"Terraform provisioned"` | no |
| <a name="input_route_advertisement_types"></a> [route\_advertisement\_types](#input\_route\_advertisement\_types) | The NSX-T route advertisement type. | `list(string)` | <pre>[<br>  "TIER1_CONNECTED"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of NSX-T tag:scope pairs | `map(string)` | `{}` | no |
| <a name="input_tier0_gateway_path"></a> [tier0\_gateway\_path](#input\_tier0\_gateway\_path) | The path of the connected Tier0 Gateway | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The NSX resource ID for the created Tier1 gateway. |
| <a name="output_nsxt_tier1_gateway"></a> [nsxt\_tier1\_gateway](#output\_nsxt\_tier1\_gateway) | The NSX resource object of the created Tier1 gateway. |
| <a name="output_path"></a> [path](#output\_path) | The NSX resource path for the created Tier1 gateway. |
| <a name="output_revision"></a> [revision](#output\_revision) | The NSX object revision path for the created segment. |

<!-- END_AUTOMATED_TF_DOCS_BLOCK --> 