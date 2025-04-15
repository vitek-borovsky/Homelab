resource "twingate_resource" "resource" {
  for_each = local.resources

  name              = each.value.name
  address           = var.cluster_ip
  remote_network_id = data.twingate_remote_network.network.id
  alias             = "${each.value.alias}.${var.domain}"

  is_visible = true

  access_group {
    group_id    = data.twingate_group.user.id
  }

  protocols = {
    allow_icmp = true
    tcp = {
      policy = each.value.policy_tcp
      ports = each.value.ports_tcp
    }
    udp = {
      policy = each.value.policy_udp
      ports = each.value.ports_udp
    }
  }
}
