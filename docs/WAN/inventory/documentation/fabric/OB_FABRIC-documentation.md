# OB_FABRIC

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
| OB_FABRIC | l3router | den-ob1-qualfon-n1 | - | - | Provisioned | WTW23320663 |
| OB_FABRIC | l3router | den-ob1-ttech-n1 | - | - | Provisioned | WTW23320663 |
| OB_FABRIC | l3router | dfw-ob1-foundever-n1 | - | - | Provisioned | WTW23320663 |
| OB_FABRIC | l3router | dfw-ob1-telepf-n1 | - | - | Provisioned | WTW23320663 |
| OB_FABRIC | l3router | dtw-ob1-qualfon-n1 | - | - | Provisioned | WTW23320663 |
| OB_FABRIC | l3router | iad-ob1-teletech-n1 | - | - | Provisioned | WTW23320663 |
| OB_FABRIC | l3router | mco-ob1-concentrix-n1 | - | 710P | Provisioned | WTW23320662 |

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
| 10.9.176.0/24 | 256 | 7 | 2.74 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| OB_FABRIC | den-ob1-qualfon-n1 | 10.9.176.185/32 |
| OB_FABRIC | den-ob1-ttech-n1 | 10.9.176.180/32 |
| OB_FABRIC | dfw-ob1-foundever-n1 | 10.9.176.183/32 |
| OB_FABRIC | dfw-ob1-telepf-n1 | 10.9.176.179/32 |
| OB_FABRIC | dtw-ob1-qualfon-n1 | 10.9.176.184/32 |
| OB_FABRIC | iad-ob1-teletech-n1 | 10.9.176.181/32 |
| OB_FABRIC | mco-ob1-concentrix-n1 | 10.9.176.186/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
