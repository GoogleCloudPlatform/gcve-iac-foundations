# VMWare NSX-T Gateway Firewall Terraform Module
This Terraform configures a gateway firewall policy and rules for a NSX-T Tier 0 or Tier 1 North/South Firewall


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
	 scope_path  = 

	 # Optional variables
	 comments  = null
	 custom_l4_services  = {}
	 display_name  = "vm_firewall"
	 domain  = null
	 locked  = true
	 resource_description  = "Terraform provisioned"
	 rules  = []
	 sequence_number  = null
	 stateful  = true
	 tags  = {}
	 tcp_strict  = true
}
```

## Resources

| Name | Type |
|------|------|
| [nsxt_policy_gateway_policy.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_gateway_policy) | resource |
| [nsxt_policy_service.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_service) | resource |
| [nsxt_policy_group.policy_groups](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/data-sources/policy_group) | data source |
| [nsxt_policy_service.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/data-sources/policy_service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comments"></a> [comments](#input\_comments) | Comments for this firewall policy | `string` | `null` | no |
| <a name="input_custom_l4_services"></a> [custom\_l4\_services](#input\_custom\_l4\_services) | A map of objects which is used to define custom TCP/UDP services which can be<br>added to firewall rules. Service objects allow all properties in the Terraform<br>[nsxt\_policy\_service l4\_port\_set\_entry object]<br>(https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_service#l4_port_set_entry) | <pre>map(object({<br>    description       = string<br>    protocol          = optional(string)<br>    destination_ports = optional(list(number))<br>    source_ports      = optional(list(number))<br>    tags              = optional(map(string))<br>  }))</pre> | `{}` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The name for the new firewall policy | `string` | `"vm_firewall"` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The global manager domain id for the firewall policy | `string` | `null` | no |
| <a name="input_locked"></a> [locked](#input\_locked) | Prevents multiple concurrent users from editing a firewall policy at the same time | `bool` | `true` | no |
| <a name="input_resource_description"></a> [resource\_description](#input\_resource\_description) | A string added to the description field of all created resources | `string` | `"Terraform provisioned"` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | A list of objects which describe firewall rules. Rule objects allow all properties in the Terraform nsxt\_policy\_gateway\_policy rule object. | <pre>list(object({<br>    display_name          = string<br>    description           = optional(string)<br>    disabled              = optional(bool)<br>    action                = optional(string)<br>    direction             = optional(string)<br>    logged                = optional(bool)<br>    services              = optional(list(string))<br>    destination_groups    = optional(list(string))<br>    destinations_excluded = optional(bool)<br>    source_groups         = optional(list(string))<br>    sources_excluded      = optional(bool)<br>    tags                  = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_scope_path"></a> [scope\_path](#input\_scope\_path) | The NSX resource path for the already existing NSX-T Tier-0 or Tier-1 gateway | `string` | n/a | yes |
| <a name="input_sequence_number"></a> [sequence\_number](#input\_sequence\_number) | An int value used to resolve conflicts between security policies across domains. If you do not intend to use multiple domains keep the default parameter. | `number` | `null` | no |
| <a name="input_stateful"></a> [stateful](#input\_stateful) | Should the firewall policy do stateful inspection. VMware default is `true` | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of NSX-T tag:scope pairs | `map(string)` | `{}` | no |
| <a name="input_tcp_strict"></a> [tcp\_strict](#input\_tcp\_strict) | Enable NSX-T feature which enforces the TCP 3 way handshake and disables mid-session pick-up. VMware default is `true` | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The NSX resource ID for the created policy. |
| <a name="output_path"></a> [path](#output\_path) | The NSX resource path for the created policy. |
| <a name="output_revision"></a> [revision](#output\_revision) | The NSX object revision path for the policy. |
| <a name="output_rule"></a> [rule](#output\_rule) | The NSX object revision path for the load balancer pool. |

<!-- END_AUTOMATED_TF_DOCS_BLOCK --> 