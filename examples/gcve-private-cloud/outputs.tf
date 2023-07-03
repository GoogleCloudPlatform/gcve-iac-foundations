/**
 * Copyright 2023 Google LLC
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

output "gcve_tf_pc" {
  description = "The private cloud resource"
  value       = module.gcve-private-cloud.gcve_tf_pc
}

output "hcx" {
  description = "Details about the HCX Manager appliance"
  value       = module.gcve-private-cloud.hcx
}

output "nsx" {
  description = "Details about the NSX Manager appliance"
  value       = module.gcve-private-cloud.nsx
}

output "vcenter" {
  description = "Details about the vCenter appliance"
  value       = module.gcve-private-cloud.vcenter
}

output "id" {
  description = "ID of the private cloud"
  value       = module.gcve-private-cloud.id
}

output "management_cluster" {
  description = "Details of the management cluster of the private cloud"
  value       = module.gcve-private-cloud.management_cluster
}

output "network_config" {
  description = "Details about the network configuration of the private cloud"
  value       = module.gcve-private-cloud.network_config
}

output "state" {
  description = "Details about the state of the private cloud"
  value       = module.gcve-private-cloud.state
}
