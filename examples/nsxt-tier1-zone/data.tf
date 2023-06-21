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



data "nsxt_policy_tier1_gateway" "t1_gateway" {
  display_name = "Tier1"
}

data "nsxt_policy_transport_zone" "overlay_tz" {
  display_name = "TZ-OVERLAY"
}

data "nsxt_policy_edge_cluster" "edge-cluster" {
  display_name = "edge-cluster"
}

data "nsxt_policy_tier0_gateway" "tier0_gw_gateway" {
  display_name = "Provider-LR"
}
