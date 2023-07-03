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

variable "t1_name" {
  description = "Value for the T1 LR name"
  type        = string

}

variable "edge_cluster_path" {
  description = "Path to the existing edger cluster"
  type        = string
}

variable "t0_path" {
  description = "Path to the existing T0 LR"
  type        = string
}

variable "t1_description" {
  description = "Value for the T1 LR decription"
  type        = string
  default     = "T1 LR provisionned with terraform"
}

variable "t1_failover_mode" {
  description = "Value for the T1 LR failover_mode"
  type        = string
  default     = "PREEMPTIVE"
}

variable "t1_default_rule_logging" {
  description = "Value for the T1 LR default_rule_logging"
  type        = string
  default     = "false"
}


variable "t1_enable_firewall" {
  description = "Value for the T1 LR enable_firewall"
  type        = string
  default     = "true"
}

variable "t1_enable_standby_relocation" {
  description = "Value for the T1 LR enable_standby_relocation"
  type        = string
  default     = "false"
}

variable "t1_route_advertisement_types" {
  description = "Value for the t1 LR route_advertisement_types"
  type        = list(string)
  default     = ["TIER1_CONNECTED"]
}

variable "t1_pool_allocation" {
  description = "Value for the t1 pool_allocation"
  type        = string
  default     = "ROUTING"
}

variable "default_gcve_dns_forwarder" {
  description = "Path to the Global NSXT level DNS service"
  type        = string
  default     = null
}

variable "overlay_tz_path" {
  description = "Path to the Overlay Transport zone (used for segments)"
  type        = string

}



variable "segments" {
  description = "list of segments to create under the T1 LR"
  type        = map(any)
  default     = null
}


variable "gwf_policies" {
  description = "A list of firewall configuration objects used to add firewall rules to the Tier1 Gateway."
  type = list(object({
    display_name    = string
    sequence_number = number
    rules = list(object({
      display_name       = string
      action             = string
      direction          = string
      logged             = bool
      services           = list(string)
      destination_groups = list(string)
      source_groups      = list(string)
    }))
  }))
  default = []
}