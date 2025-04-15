variable "network" {
  description = "twingate network id (outer network)"
  type        = string
  sensitive   = true
}

variable "remote_network" {
  description = "twingate remote network id (inner network)"
  type        = string
  sensitive   = true
}

variable "api_token" {
  description = "twingate api token"
  type        = string
  sensitive   = true
}

variable "cluster_ip" {
  description = "ip to a ingress loadbalancer"
  type        = string
  sensitive   = true
}

variable "user_group_id" {
  description = "group to have access to resources"
  type        = string
  sensitive   = true
}

variable "domain" {
  description = "domain"
  type        = string
  sensitive   = true
}
