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

 variable "project_id" {
  type        = string
  description = "The project id to deploy Github Runner MIG"
}

variable "region" {
  type        = string
  description = "The GCP region to deploy instances into"
}

variable "zone" {
  type        = string
  description = "The GCP zone to deploy instances into"
}

variable "create_network" {
  type        = bool
  description = "Set to true if you want to create the network"
  default     = false
}

variable "create_subnetwork" {
  type        = bool
  description = "Set to true if you want to create the subnetwork"
  default     = false
}

variable "network_name" {
  type        = string
  description = "Name for the VPC network"
}

variable "subnet_name" {
  type        = string
  description = "Name for the subnet"
}

variable "repo_name" {
  type        = string
  description = "Name of the repo for the Github Action"
}

variable "repo_owner" {
  type        = string
  description = "Owner of the repo for the Github Action"
}

variable "gh_token" {
  type        = string
  description = "Github token that is used for generating Self Hosted Runner Token"
}

variable "machine_type" {
  type        = string
  description = "The GCP machine type to deploy"
  default     = "n1-standard-1"
}

variable "instance_name" {
  type        = string
  description = "The gce instance name"
  default     = "gh-runner"
}

variable "min_replicas" {
  type        = number
  description = "Minimum number of runner instances"
  default     = 1
}

variable "max_replicas" {
  type        = number
  default     = 3
  description = "Maximum number of runner instances"
}