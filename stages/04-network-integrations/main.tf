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

data "nsxt_policy_tier1_gateway" "this" {
  display_name = var.tier1_gateway_name
}

module "lb_service" {
  source = "../../modules/nsxt-load-balancer-service/"

  display_name      = var.lb_service.display_name
  connectivity_path = data.nsxt_policy_tier1_gateway.this.path
  tags              = var.lb_service.tags
}

module "lb_pool" {
  source   = "../../modules/nsxt-load-balancer-pool/"
  for_each = var.lb_pools

  algorithm    = each.value.algorithm
  display_name = each.value.display_name
  members      = try(each.value.members, {})
  tags         = try(each.value.tags, {})
}

module "lb_virtual_server" {
  source   = "../../modules/nsxt-load-balancer-virtual-server"
  for_each = var.lb_virtual_servers

  application_profile_path = each.value.application_profile_path
  display_name             = each.key
  ip_address               = each.value.ip_address
  pool_path                = module.lb_pool[each.key].path
  ports                    = each.value.ports
  rules                    = each.value.rules
  service_path             = module.lb_service.path
  tags                     = each.value.tags
}