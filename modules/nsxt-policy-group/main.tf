/*
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

/*
provider "nsxt" {
  host                 = var.nsxt_url
  username             = var.nsxt_user
  password             = var.nsxt_password
  allow_unverified_ssl = false
}
*/

resource "nsxt_policy_group" "this" {
  display_name = var.display_name
  description  = var.description

  criteria {
    dynamic "condition" {
      for_each = var.criteria

      content {
        key         = condition.value.key
        member_type = condition.value.member_type
        operator    = condition.value.operator
        value       = condition.value.value
      }
    }
  }
}
