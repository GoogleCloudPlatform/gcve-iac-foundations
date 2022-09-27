# VMWare NSX-T Load Balancer Service
This Terraform module configures an NSX-T load balancer service. This service can then have a number of [nsxt-load-balancer-virtual-server](../nsxt-load-balancer-virtual-server/README.md) attached to it.

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
	 connectivity_path  = null
	 enabled  = true
	 error_log_level  = "INFO"
	 resource_description  = "Terraform provisioned"
	 size  = "SMALL"
	 tags  = {}
}
```

## Resources

| Name | Type |
|------|------|
| [nsxt_policy_lb_service.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_lb_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connectivity_path"></a> [connectivity\_path](#input\_connectivity\_path) | The resource path to the tier1 gateway the Loadbalancer will be connected to | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The name of the LB service | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Should the service be enabled or not? | `bool` | `true` | no |
| <a name="input_error_log_level"></a> [error\_log\_level](#input\_error\_log\_level) | Logging level for the service | `string` | `"INFO"` | no |
| <a name="input_resource_description"></a> [resource\_description](#input\_resource\_description) | Description field of all created resources | `string` | `"Terraform provisioned"` | no |
| <a name="input_size"></a> [size](#input\_size) | Load balancer service size | `string` | `"SMALL"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of NSX-T tag:scope pairs | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The NSX resource ID for the created load balancer service. |
| <a name="output_nsxt_lb_service"></a> [nsxt\_lb\_service](#output\_nsxt\_lb\_service) | The NSX resource object of the created load balancer service. |
| <a name="output_path"></a> [path](#output\_path) | The NSX resource path for the created load balancer service. |
| <a name="output_revision"></a> [revision](#output\_revision) | The NSX object revision path for the load balancer service. |

<!-- END_AUTOMATED_TF_DOCS_BLOCK --> 
