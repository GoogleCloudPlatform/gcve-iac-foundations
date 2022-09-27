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

data "nsxt_firewall_section" "insert_before_section" {
  display_name = var.nsxt_dfw_insert_before_section
}

resource "nsxt_ip_set" "ip_sets" {
  for_each     = var.nsxt_dfw_ip_sets
  description  = "IP Set ${each.key}"
  display_name = each.key

  /* TO DO: make this a variable
  tag {
    scope = "color"
    tag   = "blue"
  }
  */

  ip_addresses = each.value
}

resource "nsxt_firewall_section" "firewall_sect" {
  description  = var.nsxt_dfw_section_description
  display_name = var.nsxt_dfw_section_display_name

  dynamic "tag" {
    for_each = coalesce(var.nsxt_dfw_section_tags, {})
    content {
      tag   = tag.key
      scope = tag.value
    }
  }

  # Leave input var.nsxt_dfw_section_applied_to empty to apply the section to the DFW
  dynamic "applied_to" {
    for_each = coalesce(var.nsxt_dfw_section_applied_to, {})
    content {
      target_type = applied_to.key
      target_id   = applied_to.value
    }
  }

  section_type  = var.nsxt_dfw_section_type
  stateful      = true
  insert_before = data.nsxt_firewall_section.insert_before_section.id

  dynamic "rule" {
    for_each = var.nsxt_dfw_rules[*]
    content {
      display_name          = rule.value.display_name
      description           = rule.value.description
      disabled              = rule.value.disabled
      action                = upper(rule.value.action)
      direction             = upper(rule.value.direction)
      logged                = rule.value.logged
      ip_protocol           = rule.value.ip_protocol
      destinations_excluded = rule.value.destinations_excluded

      dynamic "source" {
        for_each = coalesce(rule.value.source_ip_set_names, [])
        content {
          target_type = "IPSet"
          target_id   = nsxt_ip_set.ip_sets[source.value].id
        }
      }

      dynamic "destination" {
        for_each = coalesce(rule.value.destination_ip_set_names, [])
        content {
          target_type = "IPSet"
          target_id   = nsxt_ip_set.ip_sets[destination.value].id
        }
      }

      dynamic "service" {
        for_each = rule.value.services
        content {
          target_type = "NSService"
          target_id   = nsxt_l4_port_set_ns_service.ns_service_l4[service.value].id
        }
      }

    }
  }
}

resource "nsxt_l4_port_set_ns_service" "ns_service_l4" {
  for_each          = try(var.nsxt_dfw_custom_l4_services, {})
  description       = var.nsxt_dfw_resource_description
  display_name      = each.key
  protocol          = "TCP"
  source_ports      = try(each.value.source_ports, null)
  destination_ports = each.value.destination_ports

  dynamic "tag" {
    for_each = coalesce(each.value.tags, {})
    content {
      scope = tag.key
      tag   = tag.value
    }
  }
}
