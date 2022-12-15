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
  description = "A string added to the description field of all created resources"
  type        = string
  default     = "Terraform provisioned"
}

variable "scope_path" {
  description = "The NSX resource path for the already existing NSX-T Tier-0 or Tier-1 gateway"
  type        = string
}

variable "display_name" {
  description = "The name for the new firewall policy"
  type        = string
  default     = "vm_firewall"
}

variable "stateful" {
  description = "Should the firewall policy do stateful inspection. VMware default is `true`"
  type        = bool
  default     = true
}

variable "tcp_strict" {
  description = "Enable NSX-T feature which enforces the TCP 3 way handshake and disables mid-session pick-up. VMware default is `true`"
  type        = bool
  default     = true
}

variable "locked" {
  description = "Prevents multiple concurrent users from editing a firewall policy at the same time"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of NSX-T tag:scope pairs"
  type        = map(string)
  default     = {}
}

variable "sequence_number" {
  description = "An int value used to resolve conflicts between security policies across domains. If you do not intend to use multiple domains keep the default parameter."
  type        = number
  default     = null
}

variable "comments" {
  description = "Comments for this firewall policy"
  type        = string
  default     = null
}

variable "domain" {
  description = "The global manager domain id for the firewall policy"
  type        = string
  default     = null
}

variable "rules" {
  description = "A list of objects which describe firewall rules. Rule objects allow all properties in the Terraform nsxt_policy_gateway_policy rule object."
  type = list(object({
    display_name          = string
    description           = optional(string)
    disabled              = optional(bool)
    action                = optional(string)
    direction             = optional(string)
    logged                = optional(bool)
    services              = optional(list(string))
    destination_groups    = optional(list(string))
    destinations_excluded = optional(bool)
    source_groups         = optional(list(string))
    sources_excluded      = optional(bool)
    tags                  = optional(map(string))
  }))
  default = []
}

variable "custom_l4_services" {
  description = <<EOT
A map of objects which is used to define custom TCP/UDP services which can be
added to firewall rules. Service objects allow all properties in the Terraform
[nsxt_policy_service l4_port_set_entry object]
(https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_service#l4_port_set_entry)
EOT
  type = map(object({
    description       = string
    protocol          = optional(string)
    destination_ports = optional(list(number))
    source_ports      = optional(list(number))
    tags              = optional(map(string))
  }))
  default = {}
}
