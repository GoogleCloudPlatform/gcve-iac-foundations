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

variable "access_log_enabled" {
  description = "Should the access log be enabled for the virtual server?"
  type        = bool
  default     = true
}

variable "application_profile_path" {
  description = "Application profile path for this virtual server. Note that this also differentiates between Layer 4 TCP/UDP and Layer 7 HTTP virtual servers."
  type        = string
}

variable "default_pool_member_ports" {
  description = "The default members ports to use when members do not specify their listening ports"
  type        = list(string)
  default     = []
}

variable "resource_description" {
  description = "Description field of all created resources"
  type        = string
  default     = "Terraform provisioned"
}

variable "display_name" {
  description = "The name of the LB Virtual Server"
  type        = string
}

variable "enabled" {
  description = "Should the virtual server be enabled"
  type        = bool
  default     = true
}

variable "ip_address" {
  description = "IP Address for the virtual server."
  type        = string
}

variable "log_significant_event_only" {
  description = "Should only signficant events be logged to the access log. Requires `access_log_enabled` be true"
  type        = bool
  default     = null
}

variable "max_concurrent_connections" {
  description = "Maximum concurrent connections for the virtual server"
  type        = number
  default     = null
}

variable "max_new_connection_rate" {
  description = "New connection rate limit for the virtual server. Serves as a rate limiter."
  type        = number
  default     = null
}

variable "persistence_profile_path" {
  description = "NSX resource path to a persistence profile which defines connection persistence for this virtual server"
  type        = string
  default     = null
}

variable "pool_path" {
  description = "NSX resource path to the load balancer pool which will service requests"
  type        = string
  default     = null
}

variable "ports" {
  description = "Ports the virtual server will listen on."
  type        = list(string)
}

variable "rules" {
  description = "Defines load balancer behavior and routing to backend pool members."
  type = map(object({
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
  }))
  default = {}
}

variable "client_ssl" {
  description = "ssl binding for connections to the virtual server from clients."
  type = object({
    default_certificate_path = string
    client_auth              = optional(string)
    certificate_chain_depth  = optional(number)
    ca_paths                 = optional(list(string))
    crl_paths                = optional(list(string))
    sni_paths                = optional(list(string))
    ssl_profile_path         = optional(string)
  })
  default = null
}

variable "server_ssl" {
  description = "ssl binding for connections from the virtual server to pool members."
  type = object({
    certificate_chain_depth = optional(number)
    client_certificate_path = optional(string)
    server_auth             = optional(string)
    ca_paths                = optional(list(string))
    crl_paths               = optional(list(string))
    ssl_profile_path        = optional(string)
  })
  default = null
}

variable "access_list_control" {
  description = "Defines IP access lists used to control client connections"
  type = object({
    enabled    = optional(bool)
    action     = string
    group_path = string
  })
  default = null
}

variable "service_path" {
  description = "The load balancer service to associate this virtual server with"
  type        = string
  default     = null
}

variable "sorry_pool_path" {
  description = "The NSX resource path to a load balancer pool to service requests when the main pool is unavailable"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of NSX-T tag:scope pairs"
  type        = map(string)
  default     = {}
}
