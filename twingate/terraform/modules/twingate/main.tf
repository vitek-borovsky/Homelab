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

variable "instances" {
  type = map(object({
    alias           = optional(string)
    ports_tcp       = optional(list(string))
    ports_udp       = optional(list(string))
  }))

  # To create new resource edit here
  default = {
    "ssh" = {
      ports_tcp     = [ "22" ]
      alias         = "pi"
    },
    "homepage" = {
      ports_tcp     = [ "80" ]
    },
    "fivefilters" = {
      ports_tcp     = [ "80" ]
    },
    "freshrss" = {
      ports_tcp     = [ "80" ]
    },
    "grafana" = {
      ports_tcp     = [ "80" ]
    },
    "prometheus" = {
      ports_tcp     = [ "80" ]
    },
    "pihole" = {
      ports_tcp     = [ "80" ]
    },
    "adminer" = {
      ports_tcp     = [ "80" ]
    },
    "nextcloud" = {
      ports_tcp     = [ "80" ]
    },
  }
}
locals {
  resources = {
    for k, v in var.instances :
    k => {
      name  = k
      alias = coalesce(v.alias, k)
      ports_tcp = coalesce(v.ports_tcp, [])
      ports_udp = coalesce(v.ports_udp, [])
      # TODO DRY this
      policy_tcp = length(coalesce(v.ports_tcp, [])) == 0 ? "DENY_ALL" : "RESTRICTED"
      policy_udp = length(coalesce(v.ports_udp, [])) == 0 ? "DENY_ALL" : "RESTRICTED"
    }
  }
}
