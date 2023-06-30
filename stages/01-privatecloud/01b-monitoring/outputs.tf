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

output "google_service_account" {
  value       = module.gcve-monitoring.google_service_account
  description = "The resource object of the service account for GCVE monitoring"
}

output "mig_monitoring_gcve" {
  value       = module.gcve-monitoring.mig_monitoring_gcve
  description = "The resource object of the MIG used for GCVE monitoring"
  sensitive   = true
}

output "gcve_mon_dashboards" {
  value       = module.gcve-monitoring.gcve_mon_dashboards
  description = "GCVE Monitoring Dashboards resources"
}