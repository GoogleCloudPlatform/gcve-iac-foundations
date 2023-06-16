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


variable "team_count" {
  type        = number
  description = "Count of teams to duplicate the resources for"
}


## NSX section

variable "edge_cluster_name" {
  description = "The name of the NSX-T Edge Cluster."
  type        = string
  default     = "edge-cluster" # < This is the GCVE default
}

variable "nsxt_url" {
  type        = string
  description = "The NSX-T endpoint URL."
}

variable "nsxt_user" {
  type        = string
  description = "The NSX-T administrative user to use for Terraform executions."
}

variable "nsxt_password" {
  type        = string
  description = "The password for the NSX-T administrative user."
  sensitive   = true
}

variable "segments" {
  description = "An list of segment configuration objects used to create segments."
  type = list(object({
    description  = string
    display_name = string
    cidr         = string
    tags         = map(string)
  }))
}

variable "transport_zone_name" {
  description = "The name of the NSX-T Transport Zone."
  type        = string
  default     = "TZ-OVERLAY" # < This is the GCVE default
}

variable "tier0_gateway_name" {
  description = "The name of the NSX-T tier0 gateway."
  type        = string
  default     = "Provider-LR" # < This is the GCVE default
}

variable "tier1_gateway_name" {
  description = "The name of the NSX-T tier1 gateway."
  type        = string
  default     = "Tier1" # < This is the GCVE default
}

variable "gwf_policies" {
  description = "A list of firewall configuration objects used to add firewall rules to the Tier1 Gateway."
  type = list(object({
    display_name = string
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

variable "dfw_policies" {
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


## Vcenter version

variable "vsphere_server" {
  type        = string
  description = "The FQDN of the vSphere vCenter server"
}

variable "vsphere_user" {
  type        = string
  description = "The username used to connect to the vCenter server. Must be an admin user"
}

variable "vsphere_password" {
  type        = string
  description = "The password for the vCenter admin user"
  sensitive   = true
}

variable "vsphere_folder_config_l1" {
  description = "All toplevel Vsphere Folder Configs"

  type = map(object({
    datacenter        = string,
    type              = string,
    custom_attributes = any,
    tags              = any,
    role_assignments  = any,
  }))
  default = {}
}

variable "vsphere_folder_config_l2" {
  description = "All level 2 Vsphere Folder Configs"

  type = map(object({
    datacenter        = string,
    type              = string,
    custom_attributes = any,
    tags              = any,
    role_assignments  = any,
  }))
  default = {}
}

variable "vsphere_resource_pool_config" {
  description = "All Vsphere Resource Pool Configs"
  type = map(object({
    datacenter       = string,
    location         = string,
    role_assignments = any,
  }))
}