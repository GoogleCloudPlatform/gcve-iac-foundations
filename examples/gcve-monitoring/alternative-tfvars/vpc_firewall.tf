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

data "google_service_account" "monitoring_sa" {
  project    = var.project
  account_id = var.sa_gcve_monitoring
  depends_on = [
    module.gcve-monitoring
  ]
}

resource "google_compute_firewall" "gcvesyslog" {
  project = var.project
  name    = "gcve-syslog-rule"
  network = var.vpc

  allow {
    protocol = "tcp"
    ports    = ["5142"]
  }

  source_ranges           = [var.vcenter_ip_address, var.nsx_manager_ip_address]
  target_service_accounts = [data.google_service_account.monitoring_sa.email]
}
