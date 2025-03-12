# MPLS_FABRIC

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| MPLS_FABRIC | p | atl_trx_dc1_p1 | 10.13.81.232/24 | 7280R3 | Provisioned | - |
| MPLS_FABRIC | p | atl_trx_dc1_p2 | 10.13.81.228/24 | 7280R3 | Provisioned | - |
| MPLS_FABRIC | pe | atl_trx_dc1_pe1 | 10.13.80.232/24 | 7280R3 | Provisioned | - |
| MPLS_FABRIC | pe | atl_trx_dc1_pe2 | 10.13.80.228/24 | 7280R3 | Provisioned | - |
| MPLS_FABRIC | rr | DFW-TRX1-DALEQ-RR1 | 10.13.81.232/24 | 7280R3 | Provisioned | - |
| MPLS_FABRIC | rr | IAD-TRX1-DC21-RR1 | 10.9.181.16/24 | 7280R3 | Provisioned | - |
| MPLS_FABRIC | pe | tpa-trx1-cra2s-pe1 | 10.9.180.1/24 | 7280R3 | Provisioned | - |
| MPLS_FABRIC | pe | TPA-TRX1-CRA2S-PE2 | 10.9.180.2/24 | 7280R3 | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| p | atl_trx_dc1_p1 | Ethernet25/1 | pe | atl_trx_dc1_pe1 | Ethernet25/1 |
| p | atl_trx_dc1_p1 | Ethernet26/1 | pe | atl_trx_dc1_pe2 | Ethernet25/1 |
| p | atl_trx_dc1_p2 | Ethernet25/1 | pe | atl_trx_dc1_pe1 | Ethernet26/1 |
| p | atl_trx_dc1_p2 | Ethernet26/1 | pe | atl_trx_dc1_pe2 | Ethernet26/1 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| atl_trx_dc1_p1 | Ethernet25/1 | 10.199.2.42/31 | atl_trx_dc1_pe1 | Ethernet25/1 | 10.199.2.43/31 |
| atl_trx_dc1_p1 | Ethernet26/1 | 10.199.2.42/31 | atl_trx_dc1_pe2 | Ethernet25/1 | 10.199.2.43/31 |
| atl_trx_dc1_p2 | Ethernet25/1 | 10.199.2.46/31 | atl_trx_dc1_pe1 | Ethernet26/1 | 10.199.2.45/31 |
| atl_trx_dc1_p2 | Ethernet26/1 | 10.199.2.46/31 | atl_trx_dc1_pe2 | Ethernet26/1 | 10.199.2.45/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 10.153.33.128/26 | 64 | 0 | 0.0 % |
| 10.199.0.28/26 | 64 | 6 | 9.38 % |
| 10.199.0.38/27 | 32 | 4 | 12.5 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| MPLS_FABRIC | atl_trx_dc1_p1 | 10.199.0.41/32 |
| MPLS_FABRIC | atl_trx_dc1_p2 | 10.199.0.42/32 |
| MPLS_FABRIC | atl_trx_dc1_pe1 | 10.199.0.28/32 |
| MPLS_FABRIC | atl_trx_dc1_pe2 | 10.199.0.29/32 |
| MPLS_FABRIC | DFW-TRX1-DALEQ-RR1 | 10.199.0.38/32 |
| MPLS_FABRIC | IAD-TRX1-DC21-RR1 | 10.199.0.39/32 |
| MPLS_FABRIC | tpa-trx1-cra2s-pe1 | 10.199.1.28/32 |
| MPLS_FABRIC | TPA-TRX1-CRA2S-PE2 | 10.199.1.28/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
