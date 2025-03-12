# WAN

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
| WAN | p | atl-trx1-dc1-p1 | 10.13.81.232/24 | 7280R3 | Not Available | - |
| WAN | p | atl-trx1-dc1-p2 | 10.13.81.228/24 | 7280R3 | Not Available | - |
| WAN | pe | atl-trx1-dc1-pe1 | 10.13.80.232/24 | 7280R3 | Not Available | - |
| WAN | pe | atl-trx1-dc1-pe2 | 10.13.80.228/24 | 7280R3 | Not Available | - |
| WAN | pe | cvg-trx1-concentrix-pe1 | 10.9.181.178/28 | 7280R3 | Not Available | JPA2410P265 |
| WAN | pe | cvg-trx1-concentrix-pe2 | 10.9.181.179/28 | 7280R3 | Not Available | JPA2340P4W6 |
| WAN | pe | den-trx1-qualfon-pe1 | 10.9.176.210/28 | 7280R3 | Not Available | - |
| WAN | pe | den-trx1-qualfon-pe2 | 10.9.176.211/28 | 7280R3 | Not Available | - |
| WAN | rr | DFW-TRX1-DALEQ-RR1 | 10.13.81.232/24 | 7280R3 | Not Available | - |
| WAN | pe | dfw-trx1-ptxb1-pe1 | 10.9.182.132/28 | 7280R3 | Not Available | - |
| WAN | pe | dfw-trx1-ptxb1-pe2 | 10.9.182.133/28 | 7280R3 | Not Available | - |
| WAN | pe | dtw-trx1-qualfon-pe1 | 10.9.176.194/28 | 7280R3 | Not Available | - |
| WAN | pe | dtw-trx1-qualfon-pe2 | 10.9.176.195/28 | 7280R3 | Not Available | - |
| WAN | rr | IAD-TRX1-DC21-RR1 | 10.9.181.16/24 | 7280R3 | Not Available | - |
| WAN | pe | mco-trx1-concentrix-pe1 | 10.9.181.162/28 | 7280R3 | Not Available | JPE16452836 |
| WAN | pe | mco-trx1-concentrix-pe2 | 10.9.181.163/28 | 7280R3 | Not Available | SSJ16472017 |
| WAN | pe | phx-trx1-a2e-pe1 | 10.50.1.21/24 | 7280R3 | Not Available | - |
| WAN | pe | phx-trx1-dsvc-pe2 | 10.50.129.21/24 | 7280R3 | Not Available | - |
| WAN | pe | tpa-trx1-comb2n-pe1 | 10.9.181.1/24 | 7280R3 | Not Available | - |
| WAN | pe | tpa-trx1-comb2n-pe2 | 10.9.181.2/24 | 7280R3 | Not Available | - |
| WAN | pe | tpa-trx1-cra2s-pe1 | 10.9.180.1/24 | 7280R3 | Not Available | - |
| WAN | pe | tpa-trx1-cra2s-pe2 | 10.9.180.2/24 | 7280R3 | Not Available | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 10.153.33.128/26 | 64 | 0 | 0.0 % |
| 10.199.0.28/26 | 64 | 14 | 21.88 % |
| 10.199.0.38/27 | 32 | 10 | 31.25 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| WAN | atl-trx1-dc1-p1 | 10.199.0.40/32 |
| WAN | atl-trx1-dc1-p2 | 10.199.0.42/32 |
| WAN | atl-trx1-dc1-pe1 | 10.199.0.28/32 |
| WAN | atl-trx1-dc1-pe2 | 10.199.0.29/32 |
| WAN | cvg-trx1-concentrix-pe1 | 10.199.0.156/32 |
| WAN | cvg-trx1-concentrix-pe2 | 10.199.0.157/32 |
| WAN | den-trx1-qualfon-pe1 | 10.199.0.152/32 |
| WAN | den-trx1-qualfon-pe2 | 10.199.0.153/32 |
| WAN | DFW-TRX1-DALEQ-RR1 | 10.199.0.38/32 |
| WAN | dfw-trx1-ptxb1-pe1 | 10.199.0.34/32 |
| WAN | dfw-trx1-ptxb1-pe2 | 10.199.0.35/32 |
| WAN | dtw-trx1-qualfon-pe1 | 10.199.0.150/32 |
| WAN | dtw-trx1-qualfon-pe2 | 10.199.0.151/32 |
| WAN | IAD-TRX1-DC21-RR1 | 10.199.0.39/32 |
| WAN | mco-trx1-concentrix-pe1 | 10.199.0.154/32 |
| WAN | mco-trx1-concentrix-pe2 | 10.199.0.155/32 |
| WAN | phx-trx1-a2e-pe1 | 10.199.0.20/32 |
| WAN | phx-trx1-dsvc-pe2 | 10.199.0.21/32 |
| WAN | tpa-trx1-comb2n-pe1 | 10.199.0.42/32 |
| WAN | tpa-trx1-comb2n-pe2 | 10.199.0.43/32 |
| WAN | tpa-trx1-cra2s-pe1 | 10.199.0.44/32 |
| WAN | tpa-trx1-cra2s-pe2 | 10.199.0.45/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
