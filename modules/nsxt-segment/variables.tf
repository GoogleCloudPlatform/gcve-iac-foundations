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
  description = "Description field of all created resources"
  type        = string
  default     = "Terraform provisioned"
}

variable "display_name" {
  description = "The name assigned to the VM network segment created with this module"
  type        = string
  default     = "vm-segment"
}

variable "transport_zone_path" {
  description = "The path for the already existing NSX-T Overlay Transport"
  type        = string
}

variable "connectivity_path" {
  description = "The path for the already existing NSX-T Tier-1 gateway"
  type        = string
}

variable "segment_cidr" {
  description = "The CIDR to assign to the VM segment. Technically this needs to start with the first address in the range. Eg `10.50.0.1/24`"
  type        = string
}

variable "dhcp" {
  description = "A configuration object for dhcp options on the segment"
  type = object({
    enable      = bool
    ranges      = list(string)
    dns_servers = list(string)
    dhcp_generic_options = list(object({
      code   = string
      values = any
    }))
  })
  default = {
    enable               = false
    ranges               = null
    dns_servers          = null
    dhcp_generic_options = []
  }
}

variable "tags" {
  description = "A map of tag:scope pairs to be assigned to created resources"
  type        = map(string)
  default     = {}
}
