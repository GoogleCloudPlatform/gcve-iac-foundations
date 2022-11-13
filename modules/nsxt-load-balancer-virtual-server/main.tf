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

resource "nsxt_policy_lb_virtual_server" "this" {
  access_log_enabled         = var.access_log_enabled
  application_profile_path   = var.application_profile_path
  display_name               = var.display_name
  default_pool_member_ports  = var.default_pool_member_ports
  description                = var.resource_description
  enabled                    = var.enabled
  ip_address                 = var.ip_address
  log_significant_event_only = var.log_significant_event_only
  max_concurrent_connections = var.max_concurrent_connections
  max_new_connection_rate    = var.max_new_connection_rate
  persistence_profile_path   = var.persistence_profile_path
  pool_path                  = var.pool_path
  ports                      = var.ports
  service_path               = var.service_path
  sorry_pool_path            = var.sorry_pool_path

  dynamic "tag" {
    for_each = coalesce(var.tags, {})
    content {
      tag   = tag.key
      scope = tag.value
    }
  }

  dynamic "access_list_control" {
    for_each = var.access_list_control == null ? [] : [true]
    content {
      action     = var.access_list_control.action
      group_path = var.access_list_control.group_path
      enabled    = try(var.access_list_control.enabled, null)
    }
  }

  dynamic "client_ssl" {
    for_each = var.client_ssl == null ? [] : [true]
    content {
      client_auth              = try(var.client_ssl.client_auth, null)
      default_certificate_path = var.client_ssl.default_certificate_path
      ca_paths                 = try(var.client_ssl.ca_paths, null)
      certificate_chain_depth  = try(var.client_ssl.certificate_chain_depth, null)
      ssl_profile_path         = try(var.client_ssl.ssl_profile_path, null)
      crl_paths                = try(var.client_ssl.crl_paths, null)
      sni_paths                = try(var.client_ssl.sni_paths, null)
    }
  }

  dynamic "server_ssl" {
    for_each = var.server_ssl == null ? [] : [true]
    content {
      server_auth             = try(var.server_ssl.server_auth, null)
      certificate_chain_depth = try(var.server_ssl.certificate_chain_depth, null)
      ca_paths                = try(var.server_ssl.ca_paths, null)
      client_certificate_path = try(var.server_ssl.client_certificate_path, null)
      crl_paths               = try(var.server_ssl.crl_paths, null)
      ssl_profile_path        = try(var.server_ssl.ssl_profile_path, null)
    }
  }

  // Terraform updates don't seem to apply. Seems to be a provider bug
  dynamic "rule" {
    for_each = coalesce(var.rules, {})
    content {
      display_name   = rule.key
      match_strategy = rule.value.match_strategy
      phase          = rule.value.phase
      dynamic "action" {
        for_each = rule.value.actions
        content {
          dynamic "http_redirect" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "http_redirect" && v != null])
            content {
              redirect_status = item.value.redirect_status
              redirect_url    = item.value.redirect_url
            }
          }
          dynamic "http_reject" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "http_reject" && v != null])
            content {
              reply_status  = item.value.reply_status
              reply_message = item.value.reply_message
            }
          }
          dynamic "select_pool" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "select_pool" && v != null])
            content {
              pool_id = item.value.pool_id
            }
          }
          dynamic "connection_drop" {
            for_each = toset([for k, v in action.value : v if k == "connection_drop" && v != null])
            content {
            }
          }
          dynamic "variable_persistence_on" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "variable_persistence_on" && v != null])
            content {
              variable_name            = item.value.variable_name
              variable_hash_enabled    = item.value.variable_hash_enabled
              persistence_profile_path = item.value.persistence_profile_path
            }
          }
          dynamic "http_response_header_rewrite" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "http_response_header_rewrite" && v != null])
            content {
              header_name  = item.value.header_name
              header_value = item.value.header_value
            }
          }
          dynamic "http_response_header_delete" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "http_response_header_delete" && v != null])
            content {
              header_name = item.value.header_name
            }
          }
          dynamic "variable_persistence_learn" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "variable_persistence_learn" && v != null])
            content {
              variable_name            = item.value.variable_name
              persistence_profile_path = item.value.persistence_profile_path
              variable_hash_enabled    = item.value.variable_hash_enabled
            }
          }
          dynamic "http_request_uri_rewrite" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "http_request_uri_rewrite" && v != null])
            content {
              uri           = item.value.uri
              uri_arguments = item.value.uri_arguments
            }
          }
          dynamic "http_request_header_rewrite" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "http_request_header_rewrite" && v != null])
            content {
              header_name  = item.value.header_name
              header_value = item.value.header_value
            }
          }
          dynamic "http_request_header_delete" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "http_request_header_delete" && v != null])
            content {
              header_name = item.value.header_name
            }
          }
          dynamic "variable_assignment" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "variable_assignment" && v != null])
            content {
              variable_name  = item.value.variable_name
              variable_value = item.value.variable_value
            }
          }
          dynamic "ssl_mode_selection" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "ssl_mode_selection" && v != null])
            content {
              ssl_mode = item.value.ssl_mode
            }
          }
          dynamic "jwt_auth" {
            iterator = item
            for_each = toset([for k, v in action.value : v if k == "jwt_auth" && v != null])
            content {
              key {
                certificate_path   = item.value.key.certificate_path
                public_key_content = item.value.key.public_key_content
              }
              pass_jwt_to_pool = item.value.pass_jwt_to_pool
              realm            = item.value.realm
              tokens           = item.value.tokens
            }
          }
        }
      }
      # // This is the api match_conditions
      dynamic "condition" {
        for_each = try(rule.value.conditions, {})
        content {
          dynamic "http_request_method" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "http_request_method" && v != null])
            content {
              method  = item.value.method
              inverse = item.value.inverse
            }
          }
          dynamic "http_request_uri" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "http_request_uri" && v != null])
            content {
              uri            = item.value.uri
              match_type     = item.value.match_type
              case_sensitive = item.value.case_sensitive
              inverse        = item.value.inverse
            }
          }
          dynamic "http_request_uri_arguments" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "http_request_uri_arguments" && v != null])

            content {
              uri_arguments  = item.value.uri_arguments
              match_type     = item.value.match_type
              case_sensitive = item.value.case_sensitive
              inverse        = item.value.inverse
            }
          }
          dynamic "http_request_version" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "http_request_version" && v != null])
            content {
              version = item.value.version
              inverse = item.value.inverse
            }
          }
          dynamic "http_request_header" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "http_request_header" && v != null])
            content {
              header_name    = item.value.header_name
              header_value   = item.value.header_value
              match_type     = item.value.match_type
              case_sensitive = item.value.case_sensitive
              inverse        = item.value.inverse
            }
          }
          dynamic "http_response_header" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "http_response_header" && v != null])
            content {
              header_name    = item.value.header_name
              header_value   = item.value.header_value
              match_type     = item.value.match_type
              case_sensitive = item.value.case_sensitive
              inverse        = item.value.inverse
            }
          }
          dynamic "http_request_body" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "http_request_body" && v != null])
            content {
              body_value     = item.value.body_value
              match_type     = item.value.match_type
              case_sensitive = item.value.case_sensitive
              inverse        = item.value.inverse
            }
          }
          dynamic "http_request_cookie" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "http_request_cookie" && v != null])
            content {
              cookie_name    = item.value.cookie_name
              cookie_value   = item.value.cookie_value
              match_type     = item.value.match_type
              case_sensitive = item.value.case_sensitive
              inverse        = item.value.inverse
            }
          }
          dynamic "tcp_header" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "tcp_header" && v != null])
            content {
              source_port = item.value.source_port
              inverse     = item.value.inverse
            }
          }
          dynamic "ip_header" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "ip_header" && v != null])
            content {
              source_address = item.value.source_address
              group_path     = item.value.group_path
              inverse        = item.value.inverse
            }
          }
          dynamic "variable" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "variable" && v != null])
            content {
              variable_name  = item.value.variable_name
              variable_value = item.value.variable_value
              match_type     = item.value.match_type
              case_sensitive = item.value.case_sensitive
              inverse        = item.value.inverse
            }
          }
          dynamic "http_ssl" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "http_ssl" && v != null])
            content {
              dynamic "client_certificate_issuer_dn" {
                for_each = can(item.value.client_certificate_issuer_dn) ? [item.value.client_certificate_issuer_dn] : []
                content {
                  issuer_dn      = client_certificate_issuer_dn.value.issuer_dn
                  case_sensitive = client_certificate_issuer_dn.value.case_sensitive
                  match_type     = client_certificate_issuer_dn.value.match_type
                }
              }
              dynamic "client_certificate_subject_dn" {
                for_each = can(item.value.client_certificate_subject_dn) ? [item.value.client_certificate_subject_dn] : []
                content {
                  subject_dn     = client_certificate_subject_dn.value.subject_dn
                  case_sensitive = client_certificate_subject_dn.value.case_sensitive
                  match_type     = client_certificate_subject_dn.value.match_type
                }
              }
              client_supported_ssl_ciphers = item.value.client_supported_ssl_ciphers
              used_ssl_cipher              = item.value.used_ssl_cipher
              session_reused               = item.value.session_reused
              used_protocol                = item.value.used_protocol
            }
          }
          dynamic "ssl_sni" {
            iterator = item
            for_each = toset([for k, v in condition.value : v if k == "ssl_sni" && v != null])
            content {
              sni            = item.value.sni
              match_type     = item.value.match_type
              case_sensitive = item.value.case_sensitive
              inverse        = item.value.inverse
            }
          }
        }
      }
    }
  }
}
