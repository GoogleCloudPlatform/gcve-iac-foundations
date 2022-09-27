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

resource "nsxt_policy_lb_pool" "this" {
  active_monitor_path      = var.active_monitor_path
  algorithm                = var.algorithm
  description              = var.resource_description
  display_name             = var.display_name
  min_active_members       = var.min_active_members
  passive_monitor_path     = var.passive_monitor_path
  tcp_multiplexing_enabled = var.tcp_multiplexing_enabled
  tcp_multiplexing_number  = var.tcp_multiplexing_number

  dynamic "member_group" {
    #for_each = var.member_group[*]
    for_each = coalesce(var.members, {}) == {} ? var.member_group[*] : []
    content {
      allow_ipv4       = try(member_group.value.allow_ipv4, null)
      allow_ipv6       = try(member_group.value.allow_ipv6, null)
      group_path       = member_group.value.group_path
      max_ip_list_size = try(member_group.value.max_ip_list_size, null)
      port             = try(member_group.value.port, null)
    }
  }

  dynamic "member" {
    for_each = coalesce(var.members, {})
    content {
      admin_state                = try(member.value.admin_state, null)
      backup_member              = try(member.value.backup_member, null)
      display_name               = try(member.key, null)
      ip_address                 = member.value.ip_address
      max_concurrent_connections = try(member.value.max_concurrent_connections, null)
      port                       = try(member.value.port, null)
      weight                     = try(member.value.weight, null)
    }
  }

  dynamic "snat" {
    for_each = var.snat[*]
    content {
      type              = snat.value.type
      ip_pool_addresses = try(snat.value.ip_pool_addresses, null)
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
