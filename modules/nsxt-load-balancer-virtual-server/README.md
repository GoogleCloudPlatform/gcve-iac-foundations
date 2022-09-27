# VMWare NSX-T Load Balancer Virtual Server Module
This Terraform module configures NSX-T load balancer virtual servers.

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
	 application_profile_path  = 
	 display_name  = 
	 ip_address  = 
	 ports  = 

	 # Optional variables
	 access_list_control  = null
	 access_log_enabled  = true
	 client_ssl  = null
	 default_pool_member_ports  = []
	 enabled  = true
	 log_significant_event_only  = null
	 max_concurrent_connections  = null
	 max_new_connection_rate  = null
	 persistence_profile_path  = null
	 pool_path  = null
	 resource_description  = "Terraform provisioned"
	 rules  = {}
	 server_ssl  = null
	 service_path  = null
	 sorry_pool_path  = null
	 tags  = {}
}
```

## Resources

| Name | Type |
|------|------|
| [nsxt_policy_lb_virtual_server.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_lb_virtual_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_list_control"></a> [access\_list\_control](#input\_access\_list\_control) | Defines IP access lists used to control client connections | <pre>object({<br>    enabled    = optional(bool)<br>    action     = string<br>    group_path = string<br>  })</pre> | `null` | no |
| <a name="input_access_log_enabled"></a> [access\_log\_enabled](#input\_access\_log\_enabled) | Should the access log be enabled for the virtual server? | `bool` | `true` | no |
| <a name="input_application_profile_path"></a> [application\_profile\_path](#input\_application\_profile\_path) | Application profile path for this virtual server. Note that this also differentiates between Layer 4 TCP/UDP and Layer 7 HTTP virtual servers. | `string` | n/a | yes |
| <a name="input_client_ssl"></a> [client\_ssl](#input\_client\_ssl) | ssl binding for connections to the virtual server from clients. | <pre>object({<br>    default_certificate_path = string<br>    client_auth              = optional(string)<br>    certificate_chain_depth  = optional(number)<br>    ca_paths                 = optional(list(string))<br>    crl_paths                = optional(list(string))<br>    sni_paths                = optional(list(string))<br>    ssl_profile_path         = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_default_pool_member_ports"></a> [default\_pool\_member\_ports](#input\_default\_pool\_member\_ports) | The default members ports to use when members do not specify their listening ports | `list(string)` | `[]` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The name of the LB Virtual Server | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Should the virtual server be enabled | `bool` | `true` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | IP Address for the virtual server. | `string` | n/a | yes |
| <a name="input_log_significant_event_only"></a> [log\_significant\_event\_only](#input\_log\_significant\_event\_only) | Should only signficant events be logged to the access log. Requires `access_log_enabled` be true | `bool` | `null` | no |
| <a name="input_max_concurrent_connections"></a> [max\_concurrent\_connections](#input\_max\_concurrent\_connections) | Maximum concurrent connections for the virtual server | `number` | `null` | no |
| <a name="input_max_new_connection_rate"></a> [max\_new\_connection\_rate](#input\_max\_new\_connection\_rate) | New connection rate limit for the virtual server. Serves as a rate limiter. | `number` | `null` | no |
| <a name="input_persistence_profile_path"></a> [persistence\_profile\_path](#input\_persistence\_profile\_path) | NSX resource path to a persistence profile which defines connection persistence for this virtual server | `string` | `null` | no |
| <a name="input_pool_path"></a> [pool\_path](#input\_pool\_path) | NSX resource path to the load balancer pool which will service requests | `string` | `null` | no |
| <a name="input_ports"></a> [ports](#input\_ports) | Ports the virtual server will listen on. | `list(string)` | n/a | yes |
| <a name="input_resource_description"></a> [resource\_description](#input\_resource\_description) | Description field of all created resources | `string` | `"Terraform provisioned"` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | Defines load balancer behavior and routing to backend pool members. | <pre>map(object({<br>    match_strategy = optional(string)<br>    phase          = optional(string)<br>    actions = list(object({<br>      http_redirect = optional(object({<br>        redirect_status = string<br>        redirect_url    = string<br>      }))<br>      http_reject = optional(object({<br>        reply_status  = string<br>        reply_message = optional(string)<br>      }))<br>      select_pool = optional(object({<br>        pool_id = string<br>      }))<br>      variable_persistence_on = optional(object({<br>        variable_name            = string<br>        variable_hash_enabled    = optional(bool)<br>        persistence_profile_path = optional(string)<br>      }))<br>      http_response_header_rewrite = optional(object({<br>        header_name  = string<br>        header_value = string<br>      }))<br>      http_response_header_delete = optional(object({<br>        header_name = string<br>      }))<br>      variable_persistence_learn = optional(object({<br>        variable_name            = string<br>        variable_hash_enabled    = optional(bool)<br>        persistence_profile_path = optional(string)<br>      }))<br>      http_request_uri_rewrite = optional(object({<br>        uri           = string<br>        uri_arguments = optional(string)<br>      }))<br>      http_request_header_rewrite = optional(object({<br>        header_name  = string<br>        header_value = string<br>      }))<br>      http_request_header_delete = optional(object({<br>        header_name = string<br>      }))<br>      variable_assignment = optional(object({<br>        variable_name  = string<br>        variable_value = string<br>      }))<br>      jwt_auth = optional(object({<br>        key = object({<br>          certificate_path   = optional(string)<br>          public_key_content = optional(string)<br><br>        })<br>        pass_jwt_to_pool = optional(bool)<br>        realm            = optional(string)<br>        tokens           = optional(list(string))<br>      }))<br>      ssl_mode_selection = optional(object({<br>        ssl_mode = string<br>      }))<br>      connection_drop = optional(object({<br>        drop = bool<br>      }))<br>    }))<br>    conditions = optional(list(object({<br>      http_request_method = optional(object({<br>        method  = string<br>        inverse = optional(bool)<br>      }))<br>      http_request_version = optional(object({<br>        version = string<br>        inverse = optional(bool)<br>      }))<br>      ip_header = optional(object({<br>        source_address = string<br>        group_path     = optional(string)<br>        inverse        = optional(bool)<br>      }))<br>      tcp_header = optional(object({<br>        source_port = string<br>        inverse     = optional(bool)<br>      }))<br>      http_request_header = optional(object({<br>        header_name    = optional(string)<br>        header_value   = string<br>        match_type     = optional(string)<br>        case_sensitive = optional(bool)<br>        inverse        = optional(bool)<br>      }))<br>      http_respone_header = optional(object({<br>        header_name    = string<br>        header_value   = string<br>        match_type     = optional(string)<br>        case_sensitive = optional(bool)<br>        inverse        = optional(bool)<br>      }))<br>      variable = optional(object({<br>        variable_name  = string<br>        variable_value = string<br>        match_type     = optional(string)<br>        case_sensitive = optional(bool)<br>        inverse        = optional(bool)<br>      }))<br>      http_request_cookie = optional(object({<br>        cookie_name    = string<br>        cookie_value   = string<br>        match_type     = optional(string)<br>        case_sensitive = optional(bool)<br>        inverse        = optional(bool)<br>      }))<br>      http_request_body = optional(object({<br>        body_value     = string<br>        match_type     = optional(string)<br>        case_sensitive = optional(bool)<br>        inverse        = optional(bool)<br>      }))<br>      ssl_sni = optional(object({<br>        sni            = string<br>        match_type     = optional(string)<br>        case_sensitive = optional(bool)<br>        inverse        = optional(bool)<br>      }))<br>      http_ssl = optional(object({<br>        client_certificate_issuer_dn = optional(object({<br>          issuer_dn      = string<br>          match_type     = optional(string)<br>          case_sensitive = optional(bool)<br>        }))<br>        client_certificate_subject_dn = optional(object({<br>          subject_dn     = string<br>          match_type     = optional(string)<br>          case_sensitive = optional(bool)<br>        }))<br>        client_supported_ssl_ciphers = optional(list(string))<br>        session_reused               = optional(string)<br>        used_protocol                = optional(string)<br>        used_ssl_cipher              = optional(string)<br>        inverse                      = optional(bool)<br>      }))<br>      http_request_uri = optional(object({<br>        uri            = string<br>        match_type     = optional(string)<br>        case_sensitive = optional(bool)<br>        inverse        = optional(bool)<br>      }))<br>      http_request_uri_arguments = optional(object({<br>        uri_arguments  = string<br>        match_type     = optional(string)<br>        case_sensitive = optional(bool)<br>        inverse        = optional(bool)<br>      }))<br>    })))<br>  }))</pre> | `{}` | no |
| <a name="input_server_ssl"></a> [server\_ssl](#input\_server\_ssl) | ssl binding for connections from the virtual server to pool members. | <pre>object({<br>    certificate_chain_depth = optional(number)<br>    client_certificate_path = optional(string)<br>    server_auth             = optional(string)<br>    ca_paths                = optional(list(string))<br>    crl_paths               = optional(list(string))<br>    ssl_profile_path        = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_service_path"></a> [service\_path](#input\_service\_path) | The load balancer service to associate this virtual server with | `string` | `null` | no |
| <a name="input_sorry_pool_path"></a> [sorry\_pool\_path](#input\_sorry\_pool\_path) | The NSX resource path to a load balancer pool to service requests when the main pool is unavailable | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of NSX-T tag:scope pairs | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The NSX resource ID for the created virtual server. |
| <a name="output_nsxt_lb_virtual_server"></a> [nsxt\_lb\_virtual\_server](#output\_nsxt\_lb\_virtual\_server) | The NSX resource object of the created virtual server. |
| <a name="output_path"></a> [path](#output\_path) | The NSX resource path for the created virtual server. |
| <a name="output_revision"></a> [revision](#output\_revision) | The NSX object revision path for the virtual server. |

<!-- END_AUTOMATED_TF_DOCS_BLOCK --> 