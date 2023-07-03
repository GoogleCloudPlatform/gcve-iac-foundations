# VMWare vCenter Folder Terraform Module
This Terraform module creates a T1 with 
- a list of NSXT segments attached to it
- a List of N/S Firewall rules applied to it


## Usage
Basic usage of this module is as follows (values are given here as example):

```hcl

data "nsxt_policy_transport_zone" "overlay_tz" {
  display_name = "TZ-OVERLAY"
}

data "nsxt_policy_edge_cluster" "edge-cluster" {
  display_name = "edge-cluster"
}

data "nsxt_policy_tier0_gateway" "tier0_gw_gateway" {
  display_name = "Provider-LR"
}

module "zone1" {
  source   = "<module-path>"
  t1_name                          = "example-t1"
  edge_cluster_path                = data.nsxt_policy_edge_cluster.edge-cluster.path
  t0_path                          = data.nsxt_policy_tier0_gateway.tier0_gw_gateway.path
  t1_description                   = "T1  Logical Router for Production"
  t1_failover_mode                 = "PREEMPTIVE"
  t1_default_rule_logging          = "false"
  t1_enable_firewall               = "true"
  t1_enable_standby_relocation = "false"
  t1_route_advertisement_types = [ "TIER1_CONNECTED"]
  t1_pool_allocation  = "ROUTING"
  overlay_tz_path = data.nsxt_policy_transport_zone.overlay_tz.path
  segments = {
    zone1-segment1 = {
      display_name = "Zone 1 segment 1 example"
      description  = "Zone 1 segment exmaple description"
      subnet       = {
        cidr           = "10.49.128.1/24"
      }
    },
    zone1-segment2 = {
      display_name = "Zone 1 segment 2 example"
      description  = "test desription"
      subnet       = {
        cidr           = "10.49.129.1/24"
        }
      }
  }
   gwf_policies = [
   
  {
    display_name = "gwf_allow_policy"
    sequence_number = 1000
    rules = [
      {
        action             = "ALLOW"
        destination_groups = ["10.123.1.0/24"]
        source_groups      = ["10.100.0.0-10.100.0.128"]
        direction          = "IN_OUT"
        display_name       = "gwf-allow-ssh"
        logged             = false
        services           = ["SSH"]
      },
      {
        action             = "ALLOW"
        destination_groups = ["10.0.0.0/8"]
        source_groups      = []
        direction          = "IN_OUT"
        display_name       = "gfw-allow-internal"
        logged             = false
        services           = ["DNS","HTTP"]
      },
    ]
  },
  {
    display_name    = "gwf_drop_policy"
    sequence_number = 4000
    rules = [
      {
        action             = "DROP"
        destination_groups = ["10.123.2.0/23"]
        source_groups      = []
        direction          = "IN"
        display_name       = "gfw-drop-all"
        logged             = false
        services           = []
      }
    ]
  },
  ]
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_nsxt"></a> [nsxt](#requirement\_nsxt) | >= 3.2.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nsxt"></a> [nsxt](#provider\_nsxt) | >= 3.2.7 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gwf_policies"></a> [gwf\_policies](#module\_gwf\_policies) | ../nsxt-gateway-firewall/ | n/a |

## Resources

| Name | Type |
|------|------|
| [nsxt_policy_fixed_segment.segments](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_fixed_segment) | resource |
| [nsxt_policy_gateway_dns_forwarder.default_dns_forwarder](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_gateway_dns_forwarder) | resource |
| [nsxt_policy_tier1_gateway.t1_router](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier1_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_dns_forwarding_ip"></a> [default\_dns\_forwarding\_ip](#input\_default\_dns\_forwarding\_ip) | Default DNS IP for non internal resolutions | `string` | `null` | no |
| <a name="input_default_gcve_dns_forwarder"></a> [default\_gcve\_dns\_forwarder](#input\_default\_gcve\_dns\_forwarder) | Path to the Global NSXT level DNS service | `string` | `null` | no |
| <a name="input_dhcp_path"></a> [dhcp\_path](#input\_dhcp\_path) | Path to the Global NSXT DHCP service | `string` | `null` | no |
| <a name="input_edge_cluster_path"></a> [edge\_cluster\_path](#input\_edge\_cluster\_path) | Path to the existing edger cluster | `string` | n/a | yes |
| <a name="input_gwf_policies"></a> [gwf\_policies](#input\_gwf\_policies) | A list of firewall configuration objects used to add firewall rules to the Tier1 Gateway. | <pre>list(object({<br>    display_name = string<br>    sequence_number = number<br>    rules = list(object({<br>      display_name       = string<br>      action             = string<br>      direction          = string<br>      logged             = bool<br>      services           = list(string)<br>      destination_groups = list(string)<br>      source_groups      = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_overlay_tz_path"></a> [overlay\_tz\_path](#input\_overlay\_tz\_path) | Path to the Overlay Transport zone (used for segments) | `string` | n/a | yes |
| <a name="input_segments"></a> [segments](#input\_segments) | list of segments to create under the T1 LR | `map(any)` | `null` | no |
| <a name="input_t0_path"></a> [t0\_path](#input\_t0\_path) | Path to the existing T0 LR | `string` | n/a | yes |
| <a name="input_t1_default_rule_logging"></a> [t1\_default\_rule\_logging](#input\_t1\_default\_rule\_logging) | Value for the T1 LR default\_rule\_logging | `string` | `"false"` | no |
| <a name="input_t1_description"></a> [t1\_description](#input\_t1\_description) | Value for the T1 LR decription | `string` | `"T1 LR provisionned with terraform"` | no |
| <a name="input_t1_enable_firewall"></a> [t1\_enable\_firewall](#input\_t1\_enable\_firewall) | Value for the T1 LR enable\_firewall | `string` | `"true"` | no |
| <a name="input_t1_enable_standby_relocation"></a> [t1\_enable\_standby\_relocation](#input\_t1\_enable\_standby\_relocation) | Value for the T1 LR enable\_standby\_relocation | `string` | `"false"` | no |
| <a name="input_t1_failover_mode"></a> [t1\_failover\_mode](#input\_t1\_failover\_mode) | Value for the T1 LR failover\_mode | `string` | `"PREEMPTIVE"` | no |
| <a name="input_t1_name"></a> [t1\_name](#input\_t1\_name) | Value for the T1 LR name | `string` | n/a | yes |
| <a name="input_t1_pool_allocation"></a> [t1\_pool\_allocation](#input\_t1\_pool\_allocation) | Value for the t1 pool\_allocation | `string` | `"ROUTING"` | no |
| <a name="input_t1_route_advertisement_types"></a> [t1\_route\_advertisement\_types](#input\_t1\_route\_advertisement\_types) | Value for the t1 LR route\_advertisement\_types | `list(string)` | <pre>[<br>  "TIER1_CONNECTED"<br>]</pre> | no |

## Outputs

No outputs.

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
	 overlay_tz_path  = 
	 t0_path  = 
	 t1_name  = 

	 # Optional variables
	 default_gcve_dns_forwarder  = null
	 gwf_policies  = []
	 segments  = null
	 t1_default_rule_logging  = "false"
	 t1_description  = "T1 LR provisionned with terraform"
	 t1_enable_firewall  = "true"
	 t1_enable_standby_relocation  = "false"
	 t1_failover_mode  = "PREEMPTIVE"
	 t1_pool_allocation  = "ROUTING"
	 t1_route_advertisement_types  = [
  "TIER1_CONNECTED"
]
}
```

## Resources

| Name | Type |
|------|------|
| [nsxt_policy_fixed_segment.segments](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_fixed_segment) | resource |
| [nsxt_policy_tier1_gateway.t1_router](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier1_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_gcve_dns_forwarder"></a> [default\_gcve\_dns\_forwarder](#input\_default\_gcve\_dns\_forwarder) | Path to the Global NSXT level DNS service | `string` | `null` | no |
| <a name="input_edge_cluster_path"></a> [edge\_cluster\_path](#input\_edge\_cluster\_path) | Path to the existing edger cluster | `string` | n/a | yes |
| <a name="input_gwf_policies"></a> [gwf\_policies](#input\_gwf\_policies) | A list of firewall configuration objects used to add firewall rules to the Tier1 Gateway. | <pre>list(object({<br>    display_name    = string<br>    sequence_number = number<br>    rules = list(object({<br>      display_name       = string<br>      action             = string<br>      direction          = string<br>      logged             = bool<br>      services           = list(string)<br>      destination_groups = list(string)<br>      source_groups      = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_overlay_tz_path"></a> [overlay\_tz\_path](#input\_overlay\_tz\_path) | Path to the Overlay Transport zone (used for segments) | `string` | n/a | yes |
| <a name="input_segments"></a> [segments](#input\_segments) | list of segments to create under the T1 LR | `map(any)` | `null` | no |
| <a name="input_t0_path"></a> [t0\_path](#input\_t0\_path) | Path to the existing T0 LR | `string` | n/a | yes |
| <a name="input_t1_default_rule_logging"></a> [t1\_default\_rule\_logging](#input\_t1\_default\_rule\_logging) | Value for the T1 LR default\_rule\_logging | `string` | `"false"` | no |
| <a name="input_t1_description"></a> [t1\_description](#input\_t1\_description) | Value for the T1 LR decription | `string` | `"T1 LR provisionned with terraform"` | no |
| <a name="input_t1_enable_firewall"></a> [t1\_enable\_firewall](#input\_t1\_enable\_firewall) | Value for the T1 LR enable\_firewall | `string` | `"true"` | no |
| <a name="input_t1_enable_standby_relocation"></a> [t1\_enable\_standby\_relocation](#input\_t1\_enable\_standby\_relocation) | Value for the T1 LR enable\_standby\_relocation | `string` | `"false"` | no |
| <a name="input_t1_failover_mode"></a> [t1\_failover\_mode](#input\_t1\_failover\_mode) | Value for the T1 LR failover\_mode | `string` | `"PREEMPTIVE"` | no |
| <a name="input_t1_name"></a> [t1\_name](#input\_t1\_name) | Value for the T1 LR name | `string` | n/a | yes |
| <a name="input_t1_pool_allocation"></a> [t1\_pool\_allocation](#input\_t1\_pool\_allocation) | Value for the t1 pool\_allocation | `string` | `"ROUTING"` | no |
| <a name="input_t1_route_advertisement_types"></a> [t1\_route\_advertisement\_types](#input\_t1\_route\_advertisement\_types) | Value for the t1 LR route\_advertisement\_types | `list(string)` | <pre>[<br>  "TIER1_CONNECTED"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gw_firewall_rules"></a> [gw\_firewall\_rules](#output\_gw\_firewall\_rules) | n/a |
| <a name="output_nsxt_tier1_gateway"></a> [nsxt\_tier1\_gateway](#output\_nsxt\_tier1\_gateway) | The NSX resource object of the created Tier1 gateway. |
| <a name="output_segments"></a> [segments](#output\_segments) | n/a |

<!-- END_AUTOMATED_TF_DOCS_BLOCK -->