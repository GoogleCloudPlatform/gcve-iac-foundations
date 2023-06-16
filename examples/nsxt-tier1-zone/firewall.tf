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



module "gwf_policies" {

  source     = "../modules/nsxt-gateway-firewall/"
  for_each   = { for k, v in var.gwf_policies : v.display_name => v }

  display_name = each.value.display_name
  rules        = each.value.rules
  scope_path   = data.nsxt_policy_tier1_gateway.t1_gateway.path
}

module "dfw_policies" {

  source     = "../modules/nsxt-distributed-firewall-policy/"
  for_each   = { for k, v in var.dfw_policies : v.display_name => v }

  display_name    = each.value.display_name
  sequence_number = each.value.sequence_number
  rules           = each.value.rules
  scope           = []
}
