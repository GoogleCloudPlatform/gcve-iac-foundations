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

lb_service = {
  display_name = "load-balancer"
  size         = "MEDIUM"
  tags = {
    tier        = "web",
    environment = "dev"
  }
}

lb_pools = {
  website = {
    display_name = "website-frontend"
    algorithm    = "LEAST_CONNECTION"
    members = {
      web10 = {
        ip_address = "10.50.2.10"
        port       = "443"
      },
      web20 = {
        ip_address = "10.50.2.20"
        port       = "443"
      }
    }
    tags = {
      tier        = "web",
      environment = "dev"
    }
  }
  api = {
    display_name = "website-frontend"
    algorithm    = "LEAST_CONNECTION"
    members = {
      api10 = {
        ip_address = "10.50.3.10"
        port       = "443"
      },
      api20 = {
        ip_address = "10.50.3.20"
        port       = "443"
      }
    }
    tags = {
      tier        = "api",
      environment = "dev"
    }
  }
}

lb_virtual_servers = {
  website = {
    application_profile_path = "/infra/lb-app-profiles/default-http-lb-app-profile"
    ip_address               = "10.50.2.100"
    ports                    = ["443"]
    rules = {
      redirect = {
        match_strategy = "ALL"
        phase          = "HTTP_FORWARDING"
        actions = [
          {
            http_redirect = {
              redirect_status = "301"
              redirect_url    = "https://example.com/newpath"
            }
          }
        ]
        conditions = [
          {
            http_request_uri = {
              uri        = "https://example.com/oldpath"
              match_type = "EQUALS"
            }
          }
        ]
      }
    }
    tags = {
      tier        = "web",
      environment = "dev"
    }
  },
  api = {
    application_profile_path = "/infra/lb-app-profiles/default-http-lb-app-profile"
    ip_address               = "10.50.3.100"
    ports                    = ["443"]
    tags = {
      tier        = "api",
      environment = "dev"
    }
  }
}

