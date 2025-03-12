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
| MPLS_FABRIC | p | atl-trx1-dc1-p1 | 10.13.81.232/24 | 7280R3 | Not Available | - |
| MPLS_FABRIC | p | atl-trx1-dc1-p2 | 10.13.81.228/24 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | atl-trx1-dc1-pe1 | 10.13.80.232/24 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | atl-trx1-dc1-pe2 | 10.13.80.228/24 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | cvg-trx1-concentrix-pe1 | 10.9.181.178/28 | 7280R3 | Not Available | JPA2410P265 |
| MPLS_FABRIC | pe | cvg-trx1-concentrix-pe2 | 10.9.181.179/28 | 7280R3 | Not Available | JPA2340P4W6 |
| MPLS_FABRIC | pe | den-trx1-qualfon-pe1 | 10.9.184.114/28 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | den-trx1-qualfon-pe2 | 10.9.184.115/28 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | den-trx1-ttcnt-pe1 | 10.9.184.34/28 | 7280R3 | Provisioned | HBG241300U2 |
| MPLS_FABRIC | pe | den-trx1-ttcnt-pe2 | 10.9.184.35/28 | 7280R3 | Provisioned | HBG241300TZ |
| MPLS_FABRIC | rr | DFW-TRX1-DALEQ-RR1 | 10.13.81.232/24 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | dfw-trx1-ptxb1-pe1 | 10.9.182.132/28 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | dfw-trx1-ptxb1-pe2 | 10.9.182.133/28 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | dfw-trx1-sitel-pe1 | 10.9.184.2/28 | 7280R3 | Not Available | JPA2410P263 |
| MPLS_FABRIC | pe | dfw-trx1-sitel-pe2 | 10.9.184.3/28 | 7280R3 | Not Available | JPA2410P262 |
| MPLS_FABRIC | pe | dfw-trx1-telepf-pe1 | 10.9.184.18/28 | 7280R3 | Provisioned | HBG243702EA |
| MPLS_FABRIC | pe | dfw-trx1-telepf-pe2 | 10.9.184.19/28 | 7280R3 | Provisioned | JPA2340P4YX |
| MPLS_FABRIC | pe | dtw-trx1-qualfon-pe1 | 10.9.184.50/28 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | dtw-trx1-qualfon-pe2 | 10.9.184.51/28 | 7280R3 | Not Available | - |
| MPLS_FABRIC | rr | IAD-TRX1-DC21-RR1 | 10.9.181.16/24 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | iad-trx1-teletech-pe1 | 10.9.184.98/28 | 7280R3 | Not Available | JPA2410P263 |
| MPLS_FABRIC | pe | iad-trx1-teletech-pe2 | 10.9.184.99/28 | 7280R3 | Not Available | JPA2410P262 |
| MPLS_FABRIC | pe | lax-trx1-test3pcc-pe1 | 7.7.7.7/28 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | lax-trx1-test3pcc-pe2 | 7.7.7.8/28 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | mco-trx1-concentrix-pe1 | 10.9.181.162/28 | 7280R3 | Provisioned | JPA2410P26A |
| MPLS_FABRIC | pe | mco-trx1-concentrix-pe2 | 10.9.181.163/28 | 7280R3 | Provisioned | JPA2410P25D |
| MPLS_FABRIC | pe | oma-trx1-sitel-pe1 | 10.9.184.66/28 | 7280R3 | Provisioned | JPA2410P26V |
| MPLS_FABRIC | pe | oma-trx1-sitel-pe2 | 10.9.184.67/28 | 7280R3 | Provisioned | JPA2410P26Y |
| MPLS_FABRIC | pe | phx-trx1-a2e-pe1 | 10.50.1.21/24 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | phx-trx1-dsvc-pe2 | 10.50.129.21/24 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | slc-trx1-telepf-pe1 | 10.9.184.82/28 | 7280R3 | Not Available | JPA2410P263 |
| MPLS_FABRIC | pe | slc-trx1-telepf-pe2 | 10.9.184.83/28 | 7280R3 | Not Available | JPA2410P262 |
| MPLS_FABRIC | pe | tpa-trx1-comb2n-pe1 | 10.9.181.1/24 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | tpa-trx1-comb2n-pe2 | 10.9.181.2/24 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | tpa-trx1-cra2s-pe1 | 10.9.180.1/24 | 7280R3 | Not Available | - |
| MPLS_FABRIC | pe | tpa-trx1-cra2s-pe2 | 10.9.180.2/24 | 7280R3 | Not Available | - |

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
| MPLS_FABRIC | atl-trx1-dc1-p1 | 10.199.0.40/32 |
| MPLS_FABRIC | atl-trx1-dc1-p2 | 10.199.0.42/32 |
| MPLS_FABRIC | atl-trx1-dc1-pe1 | 10.199.0.28/32 |
| MPLS_FABRIC | atl-trx1-dc1-pe2 | 10.199.0.29/32 |
| MPLS_FABRIC | cvg-trx1-concentrix-pe1 | 10.199.0.156/32 |
| MPLS_FABRIC | cvg-trx1-concentrix-pe2 | 10.199.0.157/32 |
| MPLS_FABRIC | den-trx1-qualfon-pe1 | 10.199.0.152/32 |
| MPLS_FABRIC | den-trx1-qualfon-pe2 | 10.199.0.153/32 |
| MPLS_FABRIC | den-trx1-ttcnt-pe1 | 10.199.0.132/32 |
| MPLS_FABRIC | den-trx1-ttcnt-pe2 | 10.199.0.133/32 |
| MPLS_FABRIC | DFW-TRX1-DALEQ-RR1 | 10.199.0.38/32 |
| MPLS_FABRIC | dfw-trx1-ptxb1-pe1 | 10.199.0.34/32 |
| MPLS_FABRIC | dfw-trx1-ptxb1-pe2 | 10.199.0.35/32 |
| MPLS_FABRIC | dfw-trx1-sitel-pe1 | 10.199.0.150/32 |
| MPLS_FABRIC | dfw-trx1-sitel-pe2 | 10.199.0.150/32 |
| MPLS_FABRIC | dfw-trx1-telepf-pe1 | 10.199.0.134/32 |
| MPLS_FABRIC | dfw-trx1-telepf-pe2 | 10.199.0.135/32 |
| MPLS_FABRIC | dtw-trx1-qualfon-pe1 | 10.199.0.150/32 |
| MPLS_FABRIC | dtw-trx1-qualfon-pe2 | 10.199.0.151/32 |
| MPLS_FABRIC | IAD-TRX1-DC21-RR1 | 10.199.0.39/32 |
| MPLS_FABRIC | iad-trx1-teletech-pe1 | 10.199.0.146/32 |
| MPLS_FABRIC | iad-trx1-teletech-pe2 | 10.199.0.147/32 |
| MPLS_FABRIC | lax-trx1-test3pcc-pe1 | 14.14.14.1/32 |
| MPLS_FABRIC | lax-trx1-test3pcc-pe2 | 7.7.7.10/32 |
| MPLS_FABRIC | mco-trx1-concentrix-pe1 | 10.199.0.154/32 |
| MPLS_FABRIC | mco-trx1-concentrix-pe2 | 10.199.0.155/32 |
| MPLS_FABRIC | oma-trx1-sitel-pe1 | 10.199.0.150/32 |
| MPLS_FABRIC | oma-trx1-sitel-pe2 | 10.199.0.150/32 |
| MPLS_FABRIC | phx-trx1-a2e-pe1 | 10.199.0.20/32 |
| MPLS_FABRIC | phx-trx1-dsvc-pe2 | 10.199.0.21/32 |
| MPLS_FABRIC | slc-trx1-telepf-pe1 | 10.199.0.142/32 |
| MPLS_FABRIC | slc-trx1-telepf-pe2 | 10.199.0.143/32 |
| MPLS_FABRIC | tpa-trx1-comb2n-pe1 | 10.199.0.42/32 |
| MPLS_FABRIC | tpa-trx1-comb2n-pe2 | 10.199.0.43/32 |
| MPLS_FABRIC | tpa-trx1-cra2s-pe1 | 10.199.0.44/32 |
| MPLS_FABRIC | tpa-trx1-cra2s-pe2 | 10.199.0.45/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
