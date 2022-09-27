# VMWare NSX-T Segment Terraform Module
This Terraform configures a VM network segement in VMware NSX-T with optional DHCP configuration. For GCVE, a new tier1 gateway is required if DHCP is wanted.

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
	 connectivity_path  = 
	 segment_cidr  = 
	 transport_zone_path  = 

	 # Optional variables
	 dhcp  = {
  "dhcp_generic_options": [],
  "dns_servers": null,
  "enable": false,
  "ranges": null
}
	 display_name  = "vm-segment"
	 resource_description  = "Terraform provisioned"
	 tags  = {}
}
```

## Resources

| Name | Type |
|------|------|
| [nsxt_policy_segment.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_segment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connectivity_path"></a> [connectivity\_path](#input\_connectivity\_path) | The path for the already existing NSX-T Tier-1 gateway | `string` | n/a | yes |
| <a name="input_dhcp"></a> [dhcp](#input\_dhcp) | A configuration object for dhcp options on the segment | <pre>object({<br>    enable      = bool<br>    ranges      = list(string)<br>    dns_servers = list(string)<br>    dhcp_generic_options = list(object({<br>      code   = string<br>      values = any<br>    }))<br>  })</pre> | <pre>{<br>  "dhcp_generic_options": [],<br>  "dns_servers": null,<br>  "enable": false,<br>  "ranges": null<br>}</pre> | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The name assigned to the VM network segment created with this module | `string` | `"vm-segment"` | no |
| <a name="input_resource_description"></a> [resource\_description](#input\_resource\_description) | Description field of all created resources | `string` | `"Terraform provisioned"` | no |
| <a name="input_segment_cidr"></a> [segment\_cidr](#input\_segment\_cidr) | The CIDR to assign to the VM segment. Technically this needs to start with the first address in the range. Eg `10.50.0.1/24` | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tag:scope pairs to be assigned to created resources | `map(string)` | `{}` | no |
| <a name="input_transport_zone_path"></a> [transport\_zone\_path](#input\_transport\_zone\_path) | The path for the already existing NSX-T Overlay Transport | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The NSX resource ID for the created segment. |
| <a name="output_nsxt_segment"></a> [nsxt\_segment](#output\_nsxt\_segment) | The NSX resource object of the created segment. |
| <a name="output_path"></a> [path](#output\_path) | The NSX resource path for the created segment. |
| <a name="output_revision"></a> [revision](#output\_revision) | The NSX object revision path for the created segment. |

<!-- END_AUTOMATED_TF_DOCS_BLOCK --> 