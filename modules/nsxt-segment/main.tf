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

resource "nsxt_policy_segment" "this" {
  display_name        = var.display_name
  description         = var.resource_description
  connectivity_path   = var.connectivity_path
  transport_zone_path = var.transport_zone_path

  subnet {
    cidr        = var.segment_cidr
    dhcp_ranges = var.dhcp.enable ? var.dhcp.ranges : null
    dynamic "dhcp_v4_config" {
      for_each = var.dhcp.enable ? [true] : []
      content {
        dns_servers = var.dhcp.dns_servers
        dynamic "dhcp_generic_option" {
          for_each = var.dhcp.dhcp_generic_options
          content {
            code   = dhcp_generic_option.value.code
            values = dhcp_generic_option.value.values
          }
        }
      }
    }
  }

  dynamic "tag" {
    for_each = coalesce(var.tags, {})
    content {
      tag   = tag.key
      scope = tag.value
    }
  }
}
