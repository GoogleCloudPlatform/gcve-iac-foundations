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

resource "nsxt_policy_tier1_gateway" "this" {
  description               = var.resource_description
  display_name              = var.display_name
  edge_cluster_path         = var.edge_cluster_path
  failover_mode             = var.failover_mode
  default_rule_logging      = var.default_rule_logging
  enable_firewall           = var.enable_firewall
  enable_standby_relocation = var.enable_standby_relocation
  tier0_path                = var.tier0_gateway_path
  route_advertisement_types = var.route_advertisement_types
  pool_allocation           = var.pool_allocation
  dhcp_config_path          = var.dhcp_config_path

  dynamic "tag" {
    for_each = coalesce(var.tags, {})
    content {
      tag   = tag.key
      scope = tag.value
    }
  }
}
