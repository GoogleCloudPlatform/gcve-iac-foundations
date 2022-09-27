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

variable "connectivity_path" {
  description = "The resource path to the tier1 gateway the Loadbalancer will be connected to"
  type        = string
  default     = null
}

variable "resource_description" {
  description = "Description field of all created resources"
  type        = string
  default     = "Terraform provisioned"
}

variable "display_name" {
  description = "The name of the LB service"
  type        = string
}

variable "enabled" {
  description = "Should the service be enabled or not?"
  type        = bool
  default     = true
}

variable "error_log_level" {
  description = "Logging level for the service"
  type        = string
  default     = "INFO"

  validation {
    condition     = contains(["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL", "ALERT", "EMERGENCY"], var.error_log_level)
    error_message = "`error_log_level` must be any of 'DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL', 'ALERT', 'EMERGENCY'."
  }
}

variable "size" {
  description = "Load balancer service size"
  type        = string
  default     = "SMALL"

  validation {
    condition     = contains(["SMALL", "MEDIUM", "LARGE", "XLARGE", "DLB"], var.size)
    error_message = "`size` must be any of 'SMALL', 'MEDIUM', 'LARGE', 'XLARGE', 'DLB'."
  }
}

variable "tags" {
  description = "A map of NSX-T tag:scope pairs"
  type        = map(string)
  default     = {}
}
