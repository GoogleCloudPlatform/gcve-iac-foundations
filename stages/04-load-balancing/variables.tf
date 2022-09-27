/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "nsxt_url" {
  type        = string
  description = "The NSX-T endpoint URL."
}

variable "nsxt_user" {
  type        = string
  description = "The NSX-T administrative user to use for Terraform executions."
}

variable "nsxt_password" {
  type        = string
  description = "The password for the NSX-T administrative user."
  sensitive   = true
}

variable "lb_pools" {
  description = "Configuration object used to create the load balancer server pools."
  type = map(object({
    algorithm    = string
    display_name = string
    members = map(object({
      ip_address = string
      port       = string
    }))
    tags = map(string)
  }))
}

variable "lb_service" {
  description = "Configuration object used to create the load balancer service."
  type = object({
    display_name = string
    size         = string
    tags         = map(string)
  })
}

variable "lb_virtual_servers" {
  description = "Configuration object used to create the load balancer servers."
  type = map(object({
    application_profile_path = string
    ip_address               = string
    ports                    = list(string)
    tags                     = map(string)
    rules = optional(map(object({
      match_strategy = optional(string)
      phase          = optional(string)
      actions = list(object({
        http_redirect = optional(object({
          redirect_status = string
          redirect_url    = string
        }))
        http_reject = optional(object({
          reply_status  = string
          reply_message = optional(string)
        }))
        select_pool = optional(object({
          pool_id = string
        }))
        variable_persistence_on = optional(object({
          variable_name            = string
          variable_hash_enabled    = optional(bool)
          persistence_profile_path = optional(string)
        }))
        http_response_header_rewrite = optional(object({
          header_name  = string
          header_value = string
        }))
        http_response_header_delete = optional(object({
          header_name = string
        }))
        variable_persistence_learn = optional(object({
          variable_name            = string
          variable_hash_enabled    = optional(bool)
          persistence_profile_path = optional(string)
        }))
        http_request_uri_rewrite = optional(object({
          uri           = string
          uri_arguments = optional(string)
        }))
        http_request_header_rewrite = optional(object({
          header_name  = string
          header_value = string
        }))
        http_request_header_delete = optional(object({
          header_name = string
        }))
        variable_assignment = optional(object({
          variable_name  = string
          variable_value = string
        }))
        jwt_auth = optional(object({
          key = object({
            certificate_path   = optional(string)
            public_key_content = optional(string)

          })
          pass_jwt_to_pool = optional(bool)
          realm            = optional(string)
          tokens           = optional(list(string))
        }))
        ssl_mode_selection = optional(object({
          ssl_mode = string
        }))
        connection_drop = optional(object({
          drop = bool
        }))
      }))
      conditions = optional(list(object({
        http_request_method = optional(object({
          method  = string
          inverse = optional(bool)
        }))
        http_request_version = optional(object({
          version = string
          inverse = optional(bool)
        }))
        ip_header = optional(object({
          source_address = string
          group_path     = optional(string)
          inverse        = optional(bool)
        }))
        tcp_header = optional(object({
          source_port = string
          inverse     = optional(bool)
        }))
        http_request_header = optional(object({
          header_name    = optional(string)
          header_value   = string
          match_type     = optional(string)
          case_sensitive = optional(bool)
          inverse        = optional(bool)
        }))
        http_respone_header = optional(object({
          header_name    = string
          header_value   = string
          match_type     = optional(string)
          case_sensitive = optional(bool)
          inverse        = optional(bool)
        }))
        variable = optional(object({
          variable_name  = string
          variable_value = string
          match_type     = optional(string)
          case_sensitive = optional(bool)
          inverse        = optional(bool)
        }))
        http_request_cookie = optional(object({
          cookie_name    = string
          cookie_value   = string
          match_type     = optional(string)
          case_sensitive = optional(bool)
          inverse        = optional(bool)
        }))
        http_request_body = optional(object({
          body_value     = string
          match_type     = optional(string)
          case_sensitive = optional(bool)
          inverse        = optional(bool)
        }))
        ssl_sni = optional(object({
          sni            = string
          match_type     = optional(string)
          case_sensitive = optional(bool)
          inverse        = optional(bool)
        }))
        http_ssl = optional(object({
          client_certificate_issuer_dn = optional(object({
            issuer_dn      = string
            match_type     = optional(string)
            case_sensitive = optional(bool)
          }))
          client_certificate_subject_dn = optional(object({
            subject_dn     = string
            match_type     = optional(string)
            case_sensitive = optional(bool)
          }))
          client_supported_ssl_ciphers = optional(list(string))
          session_reused               = optional(string)
          used_protocol                = optional(string)
          used_ssl_cipher              = optional(string)
          inverse                      = optional(bool)
        }))
        http_request_uri = optional(object({
          uri            = string
          match_type     = optional(string)
          case_sensitive = optional(bool)
          inverse        = optional(bool)
        }))
        http_request_uri_arguments = optional(object({
          uri_arguments  = string
          match_type     = optional(string)
          case_sensitive = optional(bool)
          inverse        = optional(bool)
        }))
      })))
    })))
  }))
  default = {}
}

# variable "lb_virtual_servers" {
#   description = "Configuration object used to create the load balancer servers."
#   type = map(object({
#     application_profile_path = string
#     ip_address               = string
#     ports                    = list(string)
#     tags                     = map(string)
#     rules = list(map(any))
#   }))
#   default = {}
# }

# variable "lb_virtual_servers" {
#   description = "Configuration object used to create the load balancer servers."
#   type = any
#   default = {}
# }


# variable "lb_virtual_servers" {
#   description = "Configuration object used to create the load balancer servers."
#   type = list(object({
#     application_profile_path = string
#     ip_address               = string
#     ports                    = list(string)
#     tags                     = map(string)
#     rules                    = optional(list(any))
#     # rules                    = optional(map(any))
#   }))
# }

variable "tier1_gateway_name" {
  description = "The name of the NSX-T tier1 gateway."
  type        = string
  default     = "Tier1" # < This is the GCVE default
}
