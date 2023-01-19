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


output "nsxt_firewall_section" {
  description = "The NSX resource ID for the created policy."
  value       = nsxt_firewall_section.firewall_sect
}

output "nsxt_firewall_service" {
  description = "The NSX firewall service."
  value       = nsxt_l4_port_set_ns_service.ns_service_l4
}

output "nsxt_firewall_ipsets" {
  description = "The NSX resource ID for created Ip Sets."
  value       = nsxt_ip_set.ip_sets
}
