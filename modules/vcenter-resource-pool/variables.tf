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

variable "name" {
  description = "The name of the new resource pool"
  type        = string
}

variable "datacenter" {
  description = "The name of the vSphere datacenter where the resource pool will be created"
  type        = string
}

variable "parent_path" {
  description = <<EOF
The inventory path to the parent of the new resource pool. Can be a cluster, host, or another resource pool.
Examples 'Cluster/cluster-1', 'ResourcePool/foo-resource-pool', 'Host/esxi-123456.abc12345.asia-southeast1.gve.goog'
EOF
  type        = string

  validation {
    # startswith will be in Terraform 1.3.0 soon https://github.com/hashicorp/terraform/pull/31220
    condition     = contains(["ResourcePool", "Host", "Cluster"], split("/", var.parent_path)[0])
    error_message = "`location` must be any parent inventory location starting with 'ResourcePool', 'Host', or 'Cluster'."
  }
}

variable "role_assignments" {
  description = "A map of principals and permissions to attach to the resource pool"
  type = map(object({
    user_or_group = string
    is_group      = bool
    propagate     = bool
    role          = string
  }))
  default = {}

}

variable "cpu_share_level" {
  description = "The CPU allocation level"
  type        = string
  default     = "normal"
}

variable "cpu_shares" {
  description = "The number of shares allocated for CPU. Used to determine resource allocation in case of resource contention. If this is set, cpu_share_level must be custom"
  type        = number
  default     = 4
}

variable "cpu_reservation" {
  description = " Amount of CPU (MHz) that is guaranteed available to the resource pool"
  type        = number
  default     = 0
}

variable "cpu_expandable" {
  description = " Determines if the reservation on a resource pool can grow beyond the specified value if the parent resource pool has unreserved resources."
  type        = bool
  default     = true
}

variable "cpu_limit" {
  description = "The CPU utilization of a resource pool will not exceed this limit, even if there are available resources"
  type        = number
  default     = -1
}

variable "memory_share_level" {
  description = "The memory allocation level."
  type        = string
  default     = "normal"
}

variable "memory_shares" {
  description = "The number of shares allocated for CPU. Used to determine resource allocation in case of resource contention. If this is set, memory_share_level must be custom"
  type        = number
  default     = 500
}

variable "memory_reservation" {
  description = "Amount of CPU (MHz) that is guaranteed available to the resource pool"
  type        = number
  default     = 0
}

variable "memory_expandable" {
  description = "Determines if the reservation on a resource pool can grow beyond the specified value if the parent resource pool has unreserved resources."
  type        = bool
  default     = true
}

variable "memory_limit" {
  description = "The CPU utilization of a resource pool will not exceed this limit, even if there are available resources."
  type        = number
  default     = -1
}

variable "scale_descendants_shares" {
  description = " Determines if the shares of all descendants of the resource pool are scaled up or down when the shares of the resource pool are scaled up or down"
  type        = string
  default     = "disabled"
}

variable "resource_pool_tags" {
  description = "Friendly name for the dataset being provisioned."
  type        = list(string)
  default     = []
}
