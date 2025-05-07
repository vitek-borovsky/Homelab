# https://registry.terraform.io/providers/Twingate/twingate/latest/docs/data-sources/group
terraform {
  required_providers {
    twingate = {
      source  = "twingate/twingate"
      version = "~> 3.0.17"
    }
  }
}

provider "twingate" {
  api_token = var.api_token
  network   = var.network
}

data "twingate_remote_network" "network" {
  name = var.remote_network
}

data "twingate_group" "user" {
    id = var.user_group_id
}

locals {
  default_port_80_instances = [
    "homepage",
    "fivefilters",
    "freshrss",
    "grafana",
    "prometheus",
    "pihole",
    "adminer",
    "n8n"
  ]

  instances = merge(
    {
      ssh = {
        ports_tcp = [var.ssh_port]
        alias     = "pi"
      }
    },
    {
      for name in local.default_port_80_instances :
      name => {
        ports_tcp = ["80"]
      }
    }
  )

  resources = {
    for k, v in local.instances : k => {
      name        = k
      alias       = try(v.alias, k)
      ports_tcp   = try(v.ports_tcp, [])
      ports_udp   = try(v.ports_udp, [])
      policy_tcp  = length(try(v.ports_tcp, [])) == 0 ? "DENY_ALL" : "RESTRICTED"
      policy_udp  = length(try(v.ports_udp, [])) == 0 ? "DENY_ALL" : "RESTRICTED"
    }
  }
}
