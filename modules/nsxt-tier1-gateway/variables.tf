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

variable "resource_description" {
  type        = string
  description = "A string added to the description field of all created resources"
  default     = "Terraform provisioned"
}

variable "edge_cluster_path" {
  description = "The path to the edge cluster where the new Tier1 gateway will be placed."
  type        = string
}

variable "tier0_gateway_path" {
  description = "The path of the connected Tier0 Gateway"
  type        = string
}

variable "display_name" {
  description = "The name assigned to the Tier1 gateway created with this module"
  type        = string
  default     = "tier1-gw"
}

variable "failover_mode" {
  description = "The NSX-T failover mode for the gateway."
  type        = string
  default     = "NON_PREEMPTIVE"
}

variable "default_rule_logging" {
  description = "Whether the built-in default firewall rule on the gateway logs."
  type        = bool
  default     = false
}

variable "enable_firewall" {
  description = "Should the firewall be enabled on this gateway?"
  type        = bool
  default     = false
}

variable "enable_standby_relocation" {
  description = "Should standy relocation be enabled on this gateway?"
  type        = bool
  default     = false
}

variable "route_advertisement_types" {
  description = "The NSX-T route advertisement type."
  type        = list(string)
  default     = ["TIER1_CONNECTED"]
}

variable "pool_allocation" {
  description = "The NSX-T pool allocation mode."
  type        = string
  default     = "ROUTING"
}

variable "dhcp_config_path" {
  description = "The path for the NSXT dhcp server resource. Null means disabled"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of NSX-T tag:scope pairs"
  type        = map(string)
  default     = {}
}
