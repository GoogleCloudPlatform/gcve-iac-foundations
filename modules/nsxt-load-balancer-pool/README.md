# VMWare NSX-T Load Balancer Pool Module
This Terraform module configures NSX-T load balancer pools with with members or member pools. These pools can then be later referenced by load balancer virtual server rules using the [nsxt-load-balancer-virtual-server](../nsxt-load-balancer-virtual-server/README.md) module.

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
	 display_name  = 

	 # Optional variables
	 active_monitor_path  = null
	 algorithm  = "ROUND_ROBIN"
	 member_group  = null
	 members  = {}
	 min_active_members  = null
	 passive_monitor_path  = null
	 resource_description  = "Terraform provisioned"
	 snat  = null
	 tags  = {}
	 tcp_multiplexing_enabled  = false
	 tcp_multiplexing_number  = null
}
```

## Resources

| Name | Type |
|------|------|
| [nsxt_policy_lb_pool.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_lb_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_monitor_path"></a> [active\_monitor\_path](#input\_active\_monitor\_path) | NSX Path to for the active monitor for this pool | `string` | `null` | no |
| <a name="input_algorithm"></a> [algorithm](#input\_algorithm) | Load balancing algorithm to use for this pool | `string` | `"ROUND_ROBIN"` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The name of the LB pool | `string` | n/a | yes |
| <a name="input_member_group"></a> [member\_group](#input\_member\_group) | an object to configure the member group in the LB Pool. If member\_group and members is set, member\_group is ignored. | <pre>object({<br>    group_path       = string<br>    allow_ipv4       = optional(bool)<br>    allow_ipv6       = optional(bool)<br>    max_ip_list_size = optional(number)<br>    port             = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_members"></a> [members](#input\_members) | a map of objects for configuring the members of the LB Pool. If member\_group and members is set, member\_group is ignored. | <pre>map(object({<br>    ip_address                 = string<br>    admin_state                = optional(string)<br>    backup_member              = optional(bool)<br>    max_concurrent_connections = optional(number)<br>    port                       = optional(string)<br>    weight                     = optional(number)<br>  }))</pre> | `{}` | no |
| <a name="input_min_active_members"></a> [min\_active\_members](#input\_min\_active\_members) | Minimum number of active members to consider this pool active | `number` | `null` | no |
| <a name="input_passive_monitor_path"></a> [passive\_monitor\_path](#input\_passive\_monitor\_path) | NSX Path to passive monitor for this pool | `string` | `null` | no |
| <a name="input_resource_description"></a> [resource\_description](#input\_resource\_description) | A string added to the description field of all created resources | `string` | `"Terraform provisioned"` | no |
| <a name="input_snat"></a> [snat](#input\_snat) | defines how SNAT is configured for the pool | <pre>object({<br>    type = string<br>    # Only pass ip_pool_addresses if type is 'IPPOOL'<br>    ip_pool_addresses = optional(list(string))<br>  })</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of NSX-T tag:scope pairs | `map(string)` | `{}` | no |
| <a name="input_tcp_multiplexing_enabled"></a> [tcp\_multiplexing\_enabled](#input\_tcp\_multiplexing\_enabled) | Should TCP multiplexing be enabled in the pool | `bool` | `false` | no |
| <a name="input_tcp_multiplexing_number"></a> [tcp\_multiplexing\_number](#input\_tcp\_multiplexing\_number) | The maximum number of TCP connections per pool that are idly kept alive for sending future client requests. | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The NSX resource ID for the created load balancer pool. |
| <a name="output_nsxt_lb_pool"></a> [nsxt\_lb\_pool](#output\_nsxt\_lb\_pool) | The NSX resource object of the created load balancer pool. |
| <a name="output_path"></a> [path](#output\_path) | The NSX resource path for the created load balancer pool. |
| <a name="output_revision"></a> [revision](#output\_revision) | The NSX object revision path for the load balancer pool. |

<!-- END_AUTOMATED_TF_DOCS_BLOCK -->
