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

variable "tag_category_name" {
  type        = string
  description = "The Tag Category Name"
}

variable "tag_category_cardinality" {
  type        = string
  description = "The Tag Category Cardinality"
}

variable "tag_category_description" {
  type        = string
  description = "The Tag Category Description"
}

variable "tag_category_associable_types" {
  type        = list(string)
  description = "The associable types for Tag Category"
  default     = []
}

variable "tags" {
  type        = map(any)
  description = "Tags to be created in Tag Category"
  default     = {}
}
