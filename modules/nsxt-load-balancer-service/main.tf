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

resource "nsxt_policy_lb_service" "this" {
  description       = var.resource_description
  display_name      = var.display_name
  connectivity_path = var.connectivity_path
  enabled           = var.enabled
  size              = var.size
  error_log_level   = var.error_log_level

  dynamic "tag" {
    for_each = coalesce(var.tags, {})
    content {
      tag   = tag.key
      scope = tag.value
    }
  }
}
