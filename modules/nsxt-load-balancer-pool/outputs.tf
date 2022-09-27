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

output "nsxt_lb_pool" {
  description = "The NSX resource object of the created load balancer pool."
  value       = nsxt_policy_lb_pool.this
}

output "id" {
  description = "The NSX resource ID for the created load balancer pool."
  value       = nsxt_policy_lb_pool.this.id
}

output "path" {
  description = "The NSX resource path for the created load balancer pool."
  value       = nsxt_policy_lb_pool.this.path
}

output "revision" {
  description = "The NSX object revision path for the load balancer pool."
  value       = nsxt_policy_lb_pool.this.revision
}
