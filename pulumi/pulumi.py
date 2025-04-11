import pulumi
import pulumi_twingate as tg

"""
export TWINGATE_ACCESS_TOKEN="1234"
The acess token already identifies the network
(as in vitekborovsky.twingate.com, not remote network)
"""

NETWORK_NAME = "Homelab"
DOMAIN = "homelab"
VITEK_GROUP_ID = "R3JvdXA6MzQ0MjIz"
IP = "192.168.21.59"

network = tg.get_twingate_remote_network(name=NETWORK_NAME)
vitek_group = tg.get_twingate_group(id=VITEK_GROUP_ID)

def create_resource(
        name: str,
        ip: str,
        domain: str,
        sub_domain: str,
        group,
        network,
        tcp_ports: list[str],
        udp_ports: list[str],
        allow_icmp = True
    ) -> None:

    tcp_policy = "RESTRICTED" if len(tcp_ports) != 0 else "DENY_ALL"
    udp_policy = "RESTRICTED" if len(udp_ports) != 0 else "DENY_ALL"

    protocols = {
        "allowIcmp": allow_icmp,
        "tcp": {
            "policy": tcp_policy,
            "ports": tcp_ports,
        },
        "udp": {
            "policy": udp_policy,
            "ports": udp_ports,
        },
    }
    if tcp_policy == "RESTRICTED":
        protocols["tcp"]["ports"] = tcp_ports
    if udp_policy == "RESTRICTED":
        protocols["udp"]["ports"] = udp_ports

    tg.TwingateResource(
        name,
        name=f"{name}2",
        address=ip,
        remote_network_id=network.id,
        access_groups = [{ "groupId": group.id }],
        # access_services=[ {
        #         "service_account_ids": service_account.id,
        #     }
        # ],
        protocols = protocols,
    )

create_resource(
    "homepage",
    "192.168.21.59",
    DOMAIN,
    "homepage",
    vitek_group,
    network,
    [ "80" ],
    [ ],
)
