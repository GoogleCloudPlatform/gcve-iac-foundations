# VMWare NSX-T Distributed Firewall Terraform Module
This Terraform configures a distributed firewall policy section and rules.

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
	 nsxt_dfw_insert_before_section  = 
	 nsxt_dfw_section_description  = 
	 nsxt_dfw_section_display_name  = 

	 # Optional variables
	 nsxt_dfw_custom_l4_services  = {}
	 nsxt_dfw_ip_sets  = {}
	 nsxt_dfw_resource_description  = "Terraform provisioned"
	 nsxt_dfw_rules  = []
	 nsxt_dfw_section_applied_to  = {}
	 nsxt_dfw_section_tags  = {}
	 nsxt_dfw_section_type  = "LAYER3"
}
```

## Resources

| Name | Type |
|------|------|
| [nsxt_firewall_section.firewall_sect](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/firewall_section) | resource |
| [nsxt_ip_set.ip_sets](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/ip_set) | resource |
| [nsxt_l4_port_set_ns_service.ns_service_l4](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/l4_port_set_ns_service) | resource |
| [nsxt_firewall_section.insert_before_section](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/data-sources/firewall_section) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nsxt_dfw_custom_l4_services"></a> [nsxt\_dfw\_custom\_l4\_services](#input\_nsxt\_dfw\_custom\_l4\_services) | A map of objects which is used to define custom TCP/UDP services which can be<br>added to firewall rules. Service objects allow all properties in the Terraform<br>[nsxt\_policy\_service l4\_port\_set\_entry object]<br>(https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_service#l4_port_set_entry) | <pre>map(object({<br>    description       = string<br>    protocol          = optional(string)<br>    destination_ports = optional(list(number))<br>    source_ports      = optional(list(number))<br>    tags              = optional(map(string))<br>  }))</pre> | `{}` | no |
| <a name="input_nsxt_dfw_insert_before_section"></a> [nsxt\_dfw\_insert\_before\_section](#input\_nsxt\_dfw\_insert\_before\_section) | Firewall section name that should come immediately after the one created. | `string` | n/a | yes |
| <a name="input_nsxt_dfw_ip_sets"></a> [nsxt\_dfw\_ip\_sets](#input\_nsxt\_dfw\_ip\_sets) | IP sets as key value pairs. Example:<br>{<br>  "ip\_set\_source\_1" = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"],<br>  "ip\_set\_source\_2" = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"],<br>  "ip\_set\_dest\_1"   = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]<br>} | `map(list(string))` | `{}` | no |
| <a name="input_nsxt_dfw_resource_description"></a> [nsxt\_dfw\_resource\_description](#input\_nsxt\_dfw\_resource\_description) | A string added to the description field of all created resources | `string` | `"Terraform provisioned"` | no |
| <a name="input_nsxt_dfw_rules"></a> [nsxt\_dfw\_rules](#input\_nsxt\_dfw\_rules) | A list of objects which describe firewall rules. Rule objects allow all properties in the Terraform nsxt\_policy\_gateway\_policy rule object. | <pre>list(object({<br>    display_name             = string<br>    description              = optional(string)<br>    disabled                 = optional(bool)<br>    action                   = optional(string)<br>    direction                = optional(string)<br>    logged                   = optional(bool)<br>    ip_protocol              = optional(string)<br>    destinations_excluded    = optional(bool)<br>    source_ip_set_names      = optional(list(string))<br>    destination_ip_set_names = optional(list(string))<br>    services                 = optional(list(string))<br>    tags                     = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_nsxt_dfw_section_applied_to"></a> [nsxt\_dfw\_section\_applied\_to](#input\_nsxt\_dfw\_section\_applied\_to) | A map of NSX-T target\_type:target\_id pairs | `map(string)` | `{}` | no |
| <a name="input_nsxt_dfw_section_description"></a> [nsxt\_dfw\_section\_description](#input\_nsxt\_dfw\_section\_description) | Description of the DFW Section to be created. | `string` | n/a | yes |
| <a name="input_nsxt_dfw_section_display_name"></a> [nsxt\_dfw\_section\_display\_name](#input\_nsxt\_dfw\_section\_display\_name) | Display Name of the DFW Section to be created. | `string` | n/a | yes |
| <a name="input_nsxt_dfw_section_tags"></a> [nsxt\_dfw\_section\_tags](#input\_nsxt\_dfw\_section\_tags) | A map of NSX-T tag:scope pairs | `map(string)` | `{}` | no |
| <a name="input_nsxt_dfw_section_type"></a> [nsxt\_dfw\_section\_type](#input\_nsxt\_dfw\_section\_type) | Firewall section for DFW rules | `string` | `"LAYER3"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsxt_firewall_ipsets"></a> [nsxt\_firewall\_ipsets](#output\_nsxt\_firewall\_ipsets) | The NSX resource ID for created Ip Sets. |
| <a name="output_nsxt_firewall_section"></a> [nsxt\_firewall\_section](#output\_nsxt\_firewall\_section) | The NSX resource ID for the created policy. |
| <a name="output_nsxt_firewall_service"></a> [nsxt\_firewall\_service](#output\_nsxt\_firewall\_service) | The NSX firewall service. |

<!-- END_AUTOMATED_TF_DOCS_BLOCK -->