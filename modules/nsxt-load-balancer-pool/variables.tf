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

variable "active_monitor_path" {
  description = "NSX Path to for the active monitor for this pool"
  type        = string
  default     = null
}

variable "algorithm" {
  description = "Load balancing algorithm to use for this pool"
  type        = string
  default     = "ROUND_ROBIN"

  validation {
    condition     = contains(["ROUND_ROBIN", "WEIGHTED_ROUND_ROBIN", "LEAST_CONNECTION", "WEIGHTED_LEAST_CONNECTION", "IP_HASH"], var.algorithm)
    error_message = "`algorithm` must be any of 'ROUND_ROBIN', 'WEIGHTED_ROUND_ROBIN', 'LEAST_CONNECTION', 'WEIGHTED_LEAST_CONNECTION', 'IP_HASH'."
  }
}

variable "resource_description" {
  type        = string
  description = "A string added to the description field of all created resources"
  default     = "Terraform provisioned"
}

variable "display_name" {
  description = "The name of the LB pool"
  type        = string
}

variable "min_active_members" {
  description = "Minimum number of active members to consider this pool active"
  type        = number
  default     = null
}

variable "passive_monitor_path" {
  description = "NSX Path to passive monitor for this pool"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of NSX-T tag:scope pairs"
  type        = map(string)
  default     = {}
}

variable "members" {
  description = "a map of objects for configuring the members of the LB Pool. If member_group and members is set, member_group is ignored."
  type = map(object({
    ip_address                 = string
    admin_state                = optional(string)
    backup_member              = optional(bool)
    max_concurrent_connections = optional(number)
    port                       = optional(string)
    weight                     = optional(number)
  }))
  default = {}
}

variable "member_group" {
  description = "an object to configure the member group in the LB Pool. If member_group and members is set, member_group is ignored."
  type = object({
    group_path       = string
    allow_ipv4       = optional(bool)
    allow_ipv6       = optional(bool)
    max_ip_list_size = optional(number)
    port             = optional(string)
  })
  default = null
}

variable "snat" {
  description = "defines how SNAT is configured for the pool"
  type = object({
    type = string
    # Only pass ip_pool_addresses if type is 'IPPOOL'
    ip_pool_addresses = optional(list(string))
  })
  default = null
}

variable "tcp_multiplexing_enabled" {
  description = "Should TCP multiplexing be enabled in the pool"
  type        = bool
  default     = false
}

variable "tcp_multiplexing_number" {
  description = "The maximum number of TCP connections per pool that are idly kept alive for sending future client requests."
  type        = number
  default     = null
}
