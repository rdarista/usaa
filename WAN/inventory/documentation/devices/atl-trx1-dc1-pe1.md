# ATL-TRX1-DC1-PE1

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
  - [DNS Domain](#dns-domain)
  - [IP Name Servers](#ip-name-servers)
  - [Domain Lookup](#domain-lookup)
  - [Clock Settings](#clock-settings)
  - [NTP](#ntp)
  - [IP Client Source Interfaces](#ip-client-source-interfaces)
  - [Management API gNMI](#management-api-gnmi)
  - [Management API HTTP](#management-api-http)
- [Authentication](#authentication)
  - [Local Users](#local-users)
  - [TACACS Servers](#tacacs-servers)
  - [IP TACACS Source Interfaces](#ip-tacacs-source-interfaces)
  - [AAA Authentication](#aaa-authentication)
  - [AAA Authorization](#aaa-authorization)
  - [AAA Accounting](#aaa-accounting)
- [Management Security](#management-security)
  - [Management Security Summary](#management-security-summary)
  - [Management Security SSL Profiles](#management-security-ssl-profiles)
  - [SSL profile SSL_TLS_1_2 Certificates Summary](#ssl-profile-ssl_tls_1_2-certificates-summary)
  - [Management Security Device Configuration](#management-security-device-configuration)
- [Aliases Device Configuration](#aliases-device-configuration)
- [Monitoring](#monitoring)
  - [TerminAttr Daemon](#terminattr-daemon)
  - [Logging](#logging)
  - [SNMP](#snmp)
  - [SFlow](#sflow)
- [Spanning Tree](#spanning-tree)
  - [Spanning Tree Summary](#spanning-tree-summary)
  - [Spanning Tree Device Configuration](#spanning-tree-device-configuration)
- [Internal VLAN Allocation Policy](#internal-vlan-allocation-policy)
  - [Internal VLAN Allocation Policy Summary](#internal-vlan-allocation-policy-summary)
  - [Internal VLAN Allocation Policy Device Configuration](#internal-vlan-allocation-policy-device-configuration)
- [VLANs](#vlans)
  - [VLANs Summary](#vlans-summary)
  - [VLANs Device Configuration](#vlans-device-configuration)
- [Interfaces](#interfaces)
  - [Switchport Default](#switchport-default)
  - [Interface Defaults](#interface-defaults)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
  - [ARP](#arp)
  - [Router OSPF](#router-ospf)
  - [Router BGP](#router-bgp)
- [BFD](#bfd)
  - [Router BFD](#router-bfd)
- [MPLS](#mpls)
  - [MPLS and LDP](#mpls-and-ldp)
  - [MPLS Interfaces](#mpls-interfaces)
- [Queue Monitor](#queue-monitor)
  - [Queue Monitor Length](#queue-monitor-length)
  - [Queue Monitor Streaming](#queue-monitor-streaming)
  - [Queue Monitor Configuration](#queue-monitor-configuration)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
- [Filters](#filters)
  - [IP Community-lists](#ip-community-lists)
  - [Prefix-lists](#prefix-lists)
  - [Route-maps](#route-maps)
- [ACL](#acl)
  - [IP Access-lists](#ip-access-lists)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)
- [EOS CLI Device Configuration](#eos-cli-device-configuration)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | Description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | MGMT | 10.13.80.232/24 | - |

##### IPv6

| Management Interface | Description | Type | VRF | IPv6 Address | IPv6 Gateway |
| -------------------- | ----------- | ---- | --- | ------------ | ------------ |
| Management1 | oob_management | oob | MGMT | - | - |

#### Management Interfaces Device Configuration

```eos
!
interface Management1
   description oob_management
   no shutdown
   vrf MGMT
   ip address 10.13.80.232/24
```

### DNS Domain

DNS domain: usaa.com

#### DNS Domain Device Configuration

```eos
dns domain usaa.com
!
```

### IP Name Servers

#### IP Name Servers Summary

| Name Server | VRF | Priority |
| ----------- | --- | -------- |
| 10.136.128.100 | MGMT | - |
| 10.231.108.100 | MGMT | - |
| 10.0.255.100 | MGMT | - |

#### IP Name Servers Device Configuration

```eos
ip name-server vrf MGMT 10.0.255.100
ip name-server vrf MGMT 10.136.128.100
ip name-server vrf MGMT 10.231.108.100
```

### Domain Lookup

#### DNS Domain Lookup Summary

| Source interface | vrf |
| ---------------- | --- |
| Management1 | MGMT |

#### DNS Domain Lookup Device Configuration

```eos
ip domain lookup vrf MGMT source-interface Management1
```

### Clock Settings

#### Clock Timezone Settings

Clock Timezone is set to **CST6CDT**.

#### Clock Device Configuration

```eos
!
clock timezone CST6CDT
```

### NTP

#### NTP Summary

##### NTP Servers

| Server | VRF | Preferred | Burst | iBurst | Version | Min Poll | Max Poll | Local-interface | Key |
| ------ | --- | --------- | ----- | ------ | ------- | -------- | -------- | --------------- | --- |
| 10.0.16.254 | MGMT | - | - | - | - | - | - | Management1 | 10 |
| 10.136.128.253 | MGMT | - | - | - | - | - | - | Management1 | 10 |
| 10.136.128.254 | MGMT | - | - | - | - | - | - | Management1 | 10 |

##### NTP Authentication

- Authentication enabled

- Trusted Keys: 10

##### NTP Authentication Keys

| ID | Algorithm |
| -- | -------- |
| 10 | md5 |

#### NTP Device Configuration

```eos
!
ntp authentication-key 10 md5 7 <removed>
ntp trusted-key 10
ntp authenticate
ntp server vrf MGMT 10.0.16.254 local-interface Management1 key <removed>
ntp server vrf MGMT 10.136.128.253 local-interface Management1 key <removed>
ntp server vrf MGMT 10.136.128.254 local-interface Management1 key <removed>
```

### IP Client Source Interfaces

| IP Client | VRF | Source Interface Name |
| --------- | --- | --------------------- |
| SSH | MGMT | Management1 |

#### IP Client Source Interfaces Device Configuration

```eos
!
ip ssh client source-interface Management1 vrf MGMT
 ```

### Management API gNMI

#### Management API gNMI Summary

| Transport | SSL Profile | VRF | Notification Timestamp | ACL | Port |
| --------- | ----------- | --- | ---------------------- | --- | ---- |
| default | SSL_TLS_1_2 | MGMT | last-change-time | - | 6030 |

Provider eos-native is configured.

#### Management API gNMI Device Configuration

```eos
!
management api gnmi
   transport grpc default
      ssl profile SSL_TLS_1_2
      vrf MGMT
   provider eos-native
```

### Management API HTTP

#### Management API HTTP Summary

| HTTP | HTTPS | Default Services |
| ---- | ----- | ---------------- |
| False | True | - |

Management HTTPS is using the SSL profile SSL_TLS_1_2

#### Management API VRF Access

| VRF Name | IPv4 ACL | IPv6 ACL |
| -------- | -------- | -------- |
| MGMT | - | - |

#### Management API HTTP Device Configuration

```eos
!
management api http-commands
   protocol https
   protocol https ssl profile SSL_TLS_1_2
   no shutdown
   !
   vrf MGMT
      no shutdown
```

## Authentication

### Local Users

#### Local Users Summary

| User | Privilege | Role | Disabled | Shell |
| ---- | --------- | ---- | -------- | ----- |
| admin | 1 | - | True | - |
| netsupport | 15 | network-admin | False | - |

#### Local Users Device Configuration

```eos
!
no username admin
username netsupport privilege 15 role network-admin secret sha512 <removed>
```

### TACACS Servers

#### TACACS Servers

| VRF | TACACS Servers | Single-Connection | Timeout |
| --- | -------------- | ----------------- | ------- |
| MGMT | prodauth.usaa.com | False | - |

#### TACACS Servers Device Configuration

```eos
!
tacacs-server host prodauth.usaa.com vrf MGMT key 7 <removed>
```

### IP TACACS Source Interfaces

#### IP TACACS Source Interfaces

| VRF | Source Interface Name |
| --- | --------------- |
| MGMT | Management1 |

#### IP TACACS Source Interfaces Device Configuration

```eos
!
ip tacacs vrf MGMT source-interface Management1
```

### AAA Authentication

#### AAA Authentication Summary

| Type | Sub-type | User Stores |
| ---- | -------- | ---------- |
| Login | default | group tacacs+ local |

#### AAA Authentication Device Configuration

```eos
aaa authentication login default group tacacs+ local
aaa authentication enable default group tacacs+ local
!
```

### AAA Authorization

#### AAA Authorization Summary

| Type | User Stores |
| ---- | ----------- |
| Exec | group tacacs+ local |

Authorization for configuration commands is enabled.

Authorization for serial console is enabled.

#### AAA Authorization Privilege Levels Summary

| Privilege Level | User Stores |
| --------------- | ----------- |
| 15 | group tacacs+ local |

#### AAA Authorization Device Configuration

```eos
aaa authorization serial-console
aaa authorization exec default group tacacs+ local
aaa authorization commands 15 default group tacacs+ local
!
```

### AAA Accounting

#### AAA Accounting Summary

| Type | Commands | Record type | Group | Logging |
| ---- | -------- | ----------- | ----- | ------- |
| Exec - Default | - | start-stop | tacacs+ | - |
| Commands - Default | 15 | stop-only | tacacs+ | False |

#### AAA Accounting Device Configuration

```eos
aaa accounting exec default start-stop group tacacs+
aaa accounting commands 15 default stop-only group tacacs+
```

## Management Security

### Management Security Summary

| Settings | Value |
| -------- | ----- |
| Entropy sources | hardware |

### Management Security SSL Profiles

| SSL Profile Name | TLS protocol accepted | Certificate filename | Key filename | Cipher List | CRLs |
| ---------------- | --------------------- | -------------------- | ------------ | ----------- | ---- |
| SSL_TLS_1_2 | 1.2 | SSL_TLS_1_2.crt | SSL_TLS_1_2.key | HIGH:!NULL:!MD5:!ADH:!ANULL:!AECDH | - |

### SSL profile SSL_TLS_1_2 Certificates Summary

| Trust Certificates | Requirement | Policy | System |
| ------------------ | ----------- | ------ | ------ |
| SSL_TLS_1_2.crt | - | - | - |

### Management Security Device Configuration

```eos
!
management security
   entropy source hardware
   ssl profile SSL_TLS_1_2
      tls versions 1.2
      cipher-list HIGH:!NULL:!MD5:!ADH:!ANULL:!AECDH
      trust certificate SSL_TLS_1_2.crt
      certificate SSL_TLS_1_2.crt key SSL_TLS_1_2.key
```

## Aliases Device Configuration

```eos
alias c bash clear

!
```

## Monitoring

### TerminAttr Daemon

#### TerminAttr Daemon Summary

| CV Compression | CloudVision Servers | VRF | Authentication | Smash Excludes | Ingest Exclude | Bypass AAA |
| -------------- | ------------------- | --- | -------------- | -------------- | -------------- | ---------- |
| gzip | 10.139.16.173:9910,10.139.16.174:9910,10.139.16.175:9910 | MGMT | token,tmp/token | ale,flexCounter,hardware,kni,pulse,strata | /Sysdb/cell/1/agent,/Sysdb/cell/2/agent | False |

#### TerminAttr Daemon Device Configuration

```eos
!
daemon TerminAttr
   exec /usr/bin/TerminAttr -cvaddr=10.139.16.173:9910,10.139.16.174:9910,10.139.16.175:9910 -cvauth=token,tmp/token -cvvrf=MGMT -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -taillogs=/var/log/messages
   no shutdown
```

### Logging

#### Logging Servers and Features Summary

| Type | Level |
| -----| ----- |
| Console | disabled |
| Buffer | - |
| Trap | debugging |

| Format Type | Setting |
| ----------- | ------- |
| Timestamp | high-resolution |
| Hostname | hostname |
| Sequence-numbers | false |
| RFC5424 | False |

| VRF | Source Interface |
| --- | ---------------- |
| MGMT | Management1 |

| VRF | Hosts | Ports | Protocol |
| --- | ----- | ----- | -------- |
| MGMT | routingelk-ingest.usaa.com | 8012 | UDP |

#### Logging Servers and Features Device Configuration

```eos
!
logging buffered 10000
logging trap debugging
no logging console
logging vrf MGMT host routingelk-ingest.usaa.com 8012
logging format timestamp high-resolution
logging vrf MGMT source-interface Management1
```

### SNMP

#### SNMP Configuration Summary

| Contact | Location | SNMP Traps | State |
| ------- | -------- | ---------- | ----- |
| nsho_provider_networks | ATL | All | Enabled |
| nsho_provider_networks | ATL |  | Enabled |
| nsho_provider_networks | ATL | bgp backward-transition, bridge | Disabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | 3fafc73104b12cee7cc26d96cc624e3d2f75377f | - | - |

#### SNMP Local Interfaces

| Local Interface | VRF |
| --------------- | --- |
| Management1 | MGMT |

#### SNMP VRF Status

| VRF | Status |
| --- | ------ |
| default | Disabled |
| MGMT | Enabled |

#### SNMP Hosts Configuration

| Host | VRF | Community | Username | Authentication level | SNMP Version |
| ---- |---- | --------- | -------- | -------------------- | ------------ |
| 10.139.4.41 | MGMT | - | NETSVC_SPECTRUM | priv | 3 |
| 10.139.4.44 | MGMT | - | NETSVC_SPECTRUM | priv | 3 |

#### SNMP Views Configuration

| View | MIB Family Name | Status |
| ---- | --------------- | ------ |
| READALL | ISO | Included |

#### SNMP Groups Configuration

| Group | SNMP Version | Authentication | Read | Write | Notify |
| ----- | ------------ | -------------- | ---- | ----- | ------ |
| READONLY | v3 | priv | READALL | - | - |

#### SNMP Users Configuration

| User | Group | Version | Authentication | Privacy | Remote Address | Remote Port | Engine ID |
| ---- | ----- | ------- | -------------- | ------- | -------------- | ----------- | --------- |
| NETSVC_NETBRAIN_TEST | READONLY | v3 | sha | aes | - | - | 3fafc73104b12cee7cc26d96cc624e3d2f75377f |
| NETSVC_NETBRAIN | READONLY | v3 | sha | aes | - | - | 3fafc73104b12cee7cc26d96cc624e3d2f75377f |
| SERVICENOW | READONLY | v3 | sha | aes | - | - | 3fafc73104b12cee7cc26d96cc624e3d2f75377f |
| NETSVC_SPECTRUM | READONLY | v3 | sha | aes | - | - | 3fafc73104b12cee7cc26d96cc624e3d2f75377f |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 3fafc73104b12cee7cc26d96cc624e3d2f75377f
snmp-server contact nsho_provider_networks
snmp-server location ATL
snmp-server vrf MGMT local-interface Management1
snmp-server view READALL ISO included
snmp-server group READONLY v3 priv read READALL
snmp-server user NETSVC_NETBRAIN_TEST READONLY v3 localized 3fafc73104b12cee7cc26d96cc624e3d2f75377f auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETBRAIN READONLY v3 localized 3fafc73104b12cee7cc26d96cc624e3d2f75377f auth sha <removed> priv aes <removed>
snmp-server user SERVICENOW READONLY v3 localized 3fafc73104b12cee7cc26d96cc624e3d2f75377f auth sha <removed> priv aes <removed>
snmp-server user NETSVC_SPECTRUM READONLY v3 localized 3fafc73104b12cee7cc26d96cc624e3d2f75377f auth sha <removed> priv aes <removed>
snmp-server host 10.139.4.41 vrf MGMT version 3 priv NETSVC_SPECTRUM
snmp-server host 10.139.4.44 vrf MGMT version 3 priv NETSVC_SPECTRUM
snmp-server enable traps
no snmp-server enable traps bgp backward-transition
no snmp-server enable traps bridge
no snmp-server vrf default
snmp-server vrf MGMT
```

### SFlow

#### SFlow Summary

| VRF | SFlow Source | SFlow Destination | Port |
| --- | ------------ | ----------------- | ---- |
| MGMT | Management1 | - | - |

sFlow Sample Rate: 65536

sFlow Polling Interval: 5

sFlow is enabled.

#### SFlow Device Configuration

```eos
!
sflow sample 65536
sflow polling-interval 5
sflow vrf MGMT source-interface Management1
sflow run
```

## Spanning Tree

### Spanning Tree Summary

STP mode: **none**

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode none
```

## Internal VLAN Allocation Policy

### Internal VLAN Allocation Policy Summary

| Policy Allocation | Range Beginning | Range Ending |
| ------------------| --------------- | ------------ |
| ascending | 1006 | 1199 |

### Internal VLAN Allocation Policy Device Configuration

```eos
!
vlan internal order ascending range 1006 1199
```

## VLANs

### VLANs Summary

| VLAN ID | Name | Trunk Groups |
| ------- | ---- | ------------ |
| 1 | Default | - |

### VLANs Device Configuration

```eos
!
vlan 1
   name Default
   state suspend
```

## Interfaces

### Switchport Default

#### Switchport Defaults Summary

- Default Switchport Mode: routed

#### Switchport Default Device Configuration

```eos
!
switchport default mode routed
```

### Interface Defaults

#### Interface Defaults Summary

- Default Ethernet Interface Shutdown: True

- Default Routed Interface MTU: 9214

#### Interface Defaults Device Configuration

```eos
!
interface defaults
   ethernet
      shutdown
   mtu 9214
```

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet1/2 |  - | access | - | - | - | - |
| Ethernet3/1 |  - | access | - | - | - | - |
| Ethernet4/3 |  - | access | - | - | - | - |
| Ethernet5/1 |  - | access | - | - | - | - |
| Ethernet6/1 |  - | access | - | - | - | - |
| Ethernet7/1 |  - | access | - | - | - | - |
| Ethernet8/1 |  - | access | - | - | - | - |
| Ethernet9/1 |  - | access | - | - | - | - |
| Ethernet10/1 |  - | access | - | - | - | - |
| Ethernet11/1 |  - | access | - | - | - | - |
| Ethernet12/1 |  - | access | - | - | - | - |
| Ethernet13/1 |  - | access | - | - | - | - |
| Ethernet14/1 |  - | access | - | - | - | - |
| Ethernet17/1 |  - | access | - | - | - | - |
| Ethernet18/1 |  - | access | - | - | - | - |
| Ethernet19/1 |  - | access | - | - | - | - |
| Ethernet20/1 |  - | access | - | - | - | - |
| Ethernet21/2 |  - | access | - | - | - | - |
| Ethernet22/3 |  - | access | - | - | - | - |
| Ethernet23/2 |  - | access | - | - | - | - |
| Ethernet24/3 |  - | access | - | - | - | - |
| Ethernet25/2 |  - | access | - | - | - | - |
| Ethernet26/3 |  - | access | - | - | - | - |
| Ethernet27/1 |  - | access | - | - | - | - |
| Ethernet28/1 |  - | access | - | - | - | - |
| Ethernet29/1 |  - | access | - | - | - | - |
| Ethernet30/1 |  - | access | - | - | - | - |
| Ethernet31/2 |  - | access | - | - | - | - |
| Ethernet33/1 |  - | access | - | - | - | - |
| Ethernet34/1 |  - | access | - | - | - | - |
| Ethernet35/1 |  - | access | - | - | - | - |
| Ethernet36/1 |  - | access | - | - | - | - |

*Inherited from Port-Channel Interface

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet3/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet4/3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet5/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet6/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet7/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet8/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet9/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet10/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet11/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet12/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet13/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet14/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet17/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet18/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet19/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet20/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet21/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet22/3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet23/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet24/3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet25/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet26/3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet27/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet28/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet29/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet30/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet31/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet33/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet34/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet35/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet36/1
   no shutdown
   switchport
   no switchport
   shutdown
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | MPLS_Overlay_peering | default | 10.199.0.28/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | MPLS_Overlay_peering | default | - |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description MPLS_Overlay_peering
   no shutdown
   ip address 10.199.0.28/32
   ip ospf area 0.0.0.0
   mpls ldp interface
```

## Routing

### Service Routing Protocols Model

Multi agent routing protocol model enabled

```eos
!
service routing protocols model multi-agent
```

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |
| MGMT | False |

#### IP Routing Device Configuration

```eos
!
ip routing
no ip routing vrf MGMT
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| MGMT | false |

### Static Routes

#### Static Routes Summary

| VRF | Destination Prefix | Next Hop IP | Exit interface | Administrative Distance | Tag | Route Name | Metric |
| --- | ------------------ | ----------- | -------------- | ----------------------- | --- | ---------- | ------ |
| MGMT | 0.0.0.0/0 | 10.9.182.145 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf MGMT 0.0.0.0/0 10.9.182.145
```

### ARP

Global ARP timeout: 900

#### ARP Device Configuration

```eos
!
arp aging timeout default 900
```

### Router OSPF

#### Router OSPF Summary

| Process ID | Router ID | Default Passive Interface | No Passive Interface | BFD | Max LSA | Default Information Originate | Log Adjacency Changes Detail | Auto Cost Reference Bandwidth | Maximum Paths | MPLS LDP Sync Default | Distribute List In |
| ---------- | --------- | ------------------------- | -------------------- | --- | ------- | ----------------------------- | ---------------------------- | ----------------------------- | ------------- | --------------------- | ------------------ |
| 64800 | 10.199.0.28 | disabled |- | enabled | 0 | disabled | disabled | 1000000 | - | - | - |

#### OSPF Interfaces

| Interface | Area | Cost | Point To Point |
| -------- | -------- | -------- | -------- |
| Loopback0 | 0.0.0.0 | - | - |

#### Router OSPF Device Configuration

```eos
!
router ospf 64800
   router-id 10.199.0.28
   bfd default
   max-lsa 0
   auto-cost reference-bandwidth 1000000
```

### Router BGP

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 64800 | 10.199.0.28 |

| BGP Tuning |
| ---------- |
| update wait-install |
| no bgp default ipv4-unicast |
| maximum-paths 4 ecmp 4 |

#### Router BGP Peer Groups

##### RR_PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | mpls |
| Remote AS | 64800 |
| Source | Loopback0 |
| BFD | True |
| Send community | all |
| Maximum routes | 0 (no limit) |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 10.199.0.39 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - | - | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |

#### Router BGP VPN-IPv4 Address Family

##### VPN-IPv4 Peer Groups

| Peer Group | Activate | Route-map In | Route-map Out | RCF In | RCF Out |
| ---------- | -------- | ------------ | ------------- | ------ | ------- |
| RR_PEERS | True | - | - | - | - |

#### Router BGP Device Configuration

```eos
!
router bgp 64800
   router-id 10.199.0.28
   maximum-paths 4 ecmp 4
   update wait-install
   no bgp default ipv4-unicast
   neighbor RR_PEERS peer group
   neighbor RR_PEERS remote-as 64800
   neighbor RR_PEERS update-source Loopback0
   neighbor RR_PEERS bfd
   neighbor RR_PEERS password 7 <removed>
   neighbor RR_PEERS send-community
   neighbor RR_PEERS maximum-routes 0
   neighbor 10.199.0.39 peer group RR_PEERS
   neighbor 10.199.0.39 description IAD-TRX1-DC21-RR1
   !
   address-family evpn
   !
   address-family ipv4
      no neighbor RR_PEERS activate
   !
   address-family vpn-ipv4
      neighbor RR_PEERS activate
      neighbor default encapsulation mpls next-hop-self source-interface Loopback0
```

## BFD

### Router BFD

#### Router BFD Multihop Summary

| Interval | Minimum RX | Multiplier |
| -------- | ---------- | ---------- |
| 1000 | 1000 | 3 |

#### Router BFD Device Configuration

```eos
!
router bfd
   multihop interval 1000 min-rx 1000 multiplier 3
```

## MPLS

### MPLS and LDP

#### MPLS and LDP Summary

| Setting | Value |
| -------- | ---- |
| MPLS IP Enabled | True |
| LDP Enabled | True |
| LDP Router ID | interface Loopback0 |
| LDP Interface Disabled Default | False |
| LDP Transport-Address Interface | - |

#### MPLS and LDP Device Configuration

```eos
!
mpls ip
!
mpls ldp
   router-id interface Loopback0
   no shutdown
```

### MPLS Interfaces

| Interface | MPLS IP Enabled | LDP Enabled | IGP Sync |
| --------- | --------------- | ----------- | -------- |
| Loopback0 | - | True | - |

## Queue Monitor

### Queue Monitor Length

| Enabled | Logging Interval | Default Thresholds High | Default Thresholds Low | Notifying | TX Latency | CPU Thresholds High | CPU Thresholds Low |
| ------- | ---------------- | ----------------------- | ---------------------- | --------- | ---------- | ------------------- | ------------------ |
| True | - | - | - | disabled | disabled | - | - |

### Queue Monitor Streaming

| Enabled | IP Access Group | IPv6 Access Group | Max Connections | VRF |
| ------- | --------------- | ----------------- | --------------- | --- |
| True | - | - | - | - |

### Queue Monitor Configuration

```eos
!
queue-monitor length
!
queue-monitor streaming
   no shutdown
```

## Multicast

### IP IGMP Snooping

#### IP IGMP Snooping Summary

| IGMP Snooping | Fast Leave | Interface Restart Query | Proxy | Restart Query Interval | Robustness Variable |
| ------------- | ---------- | ----------------------- | ----- | ---------------------- | ------------------- |
| Enabled | - | - | - | - | - |

#### IP IGMP Snooping Device Configuration

```eos
```

## Filters

### IP Community-lists

#### IP Community-lists Summary

| Name | Action | Communities / Regexp |
| ---- | ------ | -------------------- |
| NCFDMZ_DA2_PREF_COMM | permit | 64811:11024 |
| NCFDMZ_DC21_PREF_COMM | permit | 64813:11025 |

#### IP Community-lists Device Configuration

```eos
!
ip community-list NCFDMZ_DA2_PREF_COMM permit 64811:11024
ip community-list NCFDMZ_DC21_PREF_COMM permit 64813:11025
```

### Prefix-lists

#### Prefix-lists Summary

##### PL_DEFAULT

| Sequence | Action |
| -------- | ------ |
| 10 | permit 0.0.0.0/0 |

##### PL_RFC1918

| Sequence | Action |
| -------- | ------ |
| 20 | permit 10.0.0.0/8 |
| 30 | permit 172.16.0.0/12 |
| 40 | permit 192.168.0.0/16 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL_DEFAULT
   seq 10 permit 0.0.0.0/0
!
ip prefix-list PL_RFC1918
   seq 20 permit 10.0.0.0/8
   seq 30 permit 172.16.0.0/12
   seq 40 permit 192.168.0.0/16
```

### Route-maps

#### Route-maps Summary

##### DENY_ALL

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | deny | - | - | - | - |

##### NCFDMZ_PREF_DEFAULT_IMPORT_MAP

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | community NCFDMZ_DA2_PREF_COMM | local-preference 170 | - | - |
| 20 | permit | community NCFDMZ_DC21_PREF_COMM | local-preference 150 | - | - |
| 900 | permit | - | - | - | - |

##### PASS_ALL

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | - | - | - |

##### PASS_DEFAULT_ONLY

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL_DEFAULT | - | - | - |

##### PREF_DEFAULT_IMPORT_MAP

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | community DA2_DEFAULT_COMM<br>community DC21_DEFAULT_COMM | local-preference 150 | - | - |
| 20 | permit | community DC21_DEFAULT_COMM<br>community DA2_DEFAULT_COMM | local-preference 120 | - | - |
| 900 | permit | - | - | - | - |

##### RM_CE_OB1_IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | - | - | - |

##### RM_CE_OB1_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | - | - | - |

##### RM_FILTERED_1NET_BGP_POLICY_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL_RFC1918 | - | - | - |
| 20 | permit | ip address prefix-list PL_DEFAULT | - | - | - |

##### RM_FILTERED_TRUST_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL_DEFAULT | - | - | - |
| 20 | permit | ip address prefix-list PL_RFC1918 | - | - | - |

##### STANDARD_1NET_BGP_POLICY_IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | community POLICY_LP20_BLEED | local-preference 20 | - | - |
| 20 | permit | community POLICY_LP190_OVERRIDE | local-preference 190 | - | - |
| 30 | permit | community POLICY_LP120 | local-preference 120 | - | - |
| 40 | permit | community POLICY_LP150 | local-preference 150 | - | - |
| 50 | permit | community POLICY_LP170 | local-preference 170 | - | - |
| 60 | permit | community POLICY_LP180 | local-preference 180 | - | - |
| 500 | permit | - | - | - | - |

##### STANDARD_1NET_BGP_POLICY_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | - | - | - |

##### TEST_DC_RM

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | community TEST_COMM_DC | local-preference 150 | - | - |

#### Route-maps Device Configuration

```eos
!
route-map DENY_ALL deny 10
!
route-map NCFDMZ_PREF_DEFAULT_IMPORT_MAP permit 10
   description PRIMARY DA2 DEFAULT (LP 170)
   match community NCFDMZ_DA2_PREF_COMM
   set local-preference 170
!
route-map NCFDMZ_PREF_DEFAULT_IMPORT_MAP permit 20
   description SECONDARY DC21 DEFAULT (LP 150)
   match community NCFDMZ_DC21_PREF_COMM
   set local-preference 150
!
route-map NCFDMZ_PREF_DEFAULT_IMPORT_MAP permit 900
   description Standard import map to allow All routes
!
route-map PASS_ALL permit 10
!
route-map PASS_DEFAULT_ONLY permit 10
   match ip address prefix-list PL_DEFAULT
!
route-map PREF_DEFAULT_IMPORT_MAP permit 10
   description Standard import map to allow DC21 Default
   match community DA2_DEFAULT_COMM
   match community DC21_DEFAULT_COMM
   set local-preference 150
!
route-map PREF_DEFAULT_IMPORT_MAP permit 20
   description Standard import map to allow DA2 Default
   match community DA2_DEFAULT_COMM
   match community DC21_DEFAULT_COMM
   set local-preference 120
!
route-map PREF_DEFAULT_IMPORT_MAP permit 900
   description Standard import map to allow All routes
!
route-map RM_CE_OB1_IN permit 10
!
route-map RM_CE_OB1_OUT permit 10
!
route-map RM_FILTERED_1NET_BGP_POLICY_OUT permit 10
   match ip address prefix-list PL_RFC1918
!
route-map RM_FILTERED_1NET_BGP_POLICY_OUT permit 20
   match ip address prefix-list PL_DEFAULT
!
route-map RM_FILTERED_TRUST_OUT permit 10
   match ip address prefix-list PL_DEFAULT
!
route-map RM_FILTERED_TRUST_OUT permit 20
   match ip address prefix-list PL_RFC1918
!
route-map STANDARD_1NET_BGP_POLICY_IN permit 10
   match community POLICY_LP20_BLEED
   set local-preference 20
!
route-map STANDARD_1NET_BGP_POLICY_IN permit 20
   match community POLICY_LP190_OVERRIDE
   set local-preference 190
!
route-map STANDARD_1NET_BGP_POLICY_IN permit 30
   match community POLICY_LP120
   set local-preference 120
!
route-map STANDARD_1NET_BGP_POLICY_IN permit 40
   match community POLICY_LP150
   set local-preference 150
!
route-map STANDARD_1NET_BGP_POLICY_IN permit 50
   match community POLICY_LP170
   set local-preference 170
!
route-map STANDARD_1NET_BGP_POLICY_IN permit 60
   match community POLICY_LP180
   set local-preference 180
!
route-map STANDARD_1NET_BGP_POLICY_IN permit 500
   description PERMIT_ALL_ROUTES
!
route-map STANDARD_1NET_BGP_POLICY_OUT permit 10
!
route-map TEST_DC_RM permit 10
   description THIS IS A TEST AVD ROUTE MAP FOR DC
   match community TEST_COMM_DC
   set local-preference 150
```

## ACL

### IP Access-lists

#### IP Access-lists Device Configuration

```eos
!
ip access-list ACL_RO_TRAFFIC_INBOUND
   10 permit ip 10.0.0.0/8 any
   20 deny ip any any
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| MGMT | disabled |

### VRF Instances Device Configuration

```eos
!
vrf instance MGMT
```

## EOS CLI Device Configuration

```eos
!
!
mac security
    profile MKA_AES_256
        cipher aes256-gcm
        key 0100000000000000000000000000000000000000000000000000000000000000 7 13031216090D057A7B7478636572435746535106090803045E534846090807030205045B0B56570807544356540B5B565F711C1E59495547425B5C547A7B747863
        mka key-server priority 255
        sci
  !
!
vrf instance BUSINTEL
!
vrf instance CCHYBRID
!
vrf instance CCISSUE
!
vrf instance CCMERCH
!
vrf instance DCX1
!
vrf instance DMZMEM1
!
vrf instance IDTN
!
vrf instance IDTNB2B
!
vrf instance IDTNDX
!
vrf instance MGMT
!
vrf instance NCFDMZ
!
vrf instance OB1
!
vrf instance PEN1
!
vrf instance USUNT1
!
vrf instance USX1
!
ip routing
ip routing vrf BUSINTEL
ip routing vrf CCHYBRID
ip routing vrf CCISSUE
ip routing vrf CCMERCH
ip routing vrf DCX1
ip routing vrf DMZMEM1
ip routing vrf IDTN
ip routing vrf IDTNB2B
ip routing vrf IDTNDX
no ip routing vrf MGMT
ip routing vrf NCFDMZ
ip routing vrf OB1
ip routing vrf PEN1
ip routing vrf USUNT1
ip routing vrf USX1
!
!
!
interface Port-Channel110
  description PE-CE:ATL-SI1-DC1-N1:Po101
  no switchport
!
interface Port-Channel110.2001
  description PE-CE:ATL-SI1-DC1-N1:Po101.2001
  encapsulation dot1q vlan 2001
  vrf DCX1
  ip address 10.64.0.0/31
!
interface Port-Channel110.2002
  description PE-CE:ATL-SI1-DC1-N1:Po101.2002
  encapsulation dot1q vlan 2002
  vrf DMZMEM1
  ip address 10.64.0.2/31
!
interface Port-Channel110.2004
  description PE-CE:ATL-SI1-DC1-N1:Po101.2004
  encapsulation dot1q vlan 2004
  vrf BUSINTEL
  ip address 10.64.0.4/31
!
interface Port-Channel110.2006
  description PE-CE:ATL-SI1-DC1-N1:Po101.2006
  encapsulation dot1q vlan 2006
  vrf NCFDMZ
  ip address 10.64.0.6/31
!
interface Port-Channel110.2008
  description PE-CE:ATL-SI1-DC1-N1:Po101.2008
  encapsulation dot1q vlan 2008
  vrf USX1
  ip address 10.64.0.8/31
!
interface Port-Channel111
  description PE-CE:ATL-SI1-DC1-N2:Po101
  no switchport
!
interface Port-Channel111.2001
  description PE-CE:ATL-SI1-DC1-N2:Po101.2001
  encapsulation dot1q vlan 2001
  vrf DCX1
  ip address 10.64.0.20/31
!
interface Port-Channel111.2002
  description PE-CE:ATL-SI1-DC1-N2:Po101.2002
  encapsulation dot1q vlan 2002
  vrf DMZMEM1
  ip address 10.64.0.22/31
!
interface Port-Channel111.2004
  description PE-CE:ATL-SI1-DC1-N2:Po101.2004
  encapsulation dot1q vlan 2004
  vrf BUSINTEL
  ip address 10.64.0.24/31
!
interface Port-Channel111.2006
  description PE-CE:ATL-SI1-DC1-N2:Po101.2006
  encapsulation dot1q vlan 2006
  vrf NCFDMZ
  ip address 10.64.0.26/31
!
interface Port-Channel111.2008
  description PE-CE:ATL-SI1-DC1-N2:Po101.2008
  encapsulation dot1q vlan 2008
  vrf USX1
  ip address 10.64.0.28/31
!
interface Port-Channel114
  description PE-CE:ATL-ST1-DC1-N1:Po101
  no switchport
!
interface Port-Channel114.2001
  description PE-CE:ATL-ST1-DC1-N1:Po101.2001
  encapsulation dot1q vlan 2001
  vrf DCX1
  ip address 10.72.0.0/31
!
interface Port-Channel114.3001
  description PE-CE:ATL-ST1-DC1-N1:Po101.3001
  encapsulation dot1q vlan 3001
  vrf IDTN
  ip address 10.72.0.2/31
!
interface Port-Channel114.3002
  description PE-CE:ATL-ST1-DC1-N1:Po101.3002
  encapsulation dot1q vlan 3002
  vrf IDTNDX
  ip address 10.72.0.4/31
!
interface Port-Channel114.3003
  description PE-CE:ATL-ST1-DC1-N1:Po101.3003
  encapsulation dot1q vlan 3003
  vrf IDTNB2B
  ip address 10.72.0.6/31
!
interface Port-Channel115
  description PE-CE:ATL-ST1-DC1-N2:Po101
  no switchport
!
interface Port-Channel115.2001
  description PE-CE:ATL-ST1-DC1-N2:Po101.2001
  encapsulation dot1q vlan 2001
  vrf DCX1
  ip address 10.72.0.16/31
!
interface Port-Channel115.3001
  description PE-CE:ATL-ST1-DC1-N2:Po101.3001
  encapsulation dot1q vlan 3001
  vrf IDTN
  ip address 10.72.0.18/31
!
interface Port-Channel115.3002
  description PE-CE:ATL-ST1-DC1-N2:Po101.3002
  encapsulation dot1q vlan 3002
  vrf IDTNDX
  ip address 10.72.0.20/31
!
interface Port-Channel115.3003
  description PE-CE:ATL-ST1-DC1-N2:Po101.3003
  encapsulation dot1q vlan 3003
  vrf IDTNB2B
  ip address 10.72.0.22/31
!
interface Port-Channel116
  description PE-CE:ATL-SOB1-DC1-N1:Po101
  no switchport
!
interface Port-Channel116.2001
  description PE-CE:ATL-SOB1-DC1-N1:Po101.2001
  encapsulation dot1q vlan 2001
  vrf DCX1
  ip address 10.76.0.130/31
!
interface Port-Channel117
  description PE-CE:ATL-SOB1-DC1-N2:Po101
  no switchport
!
interface Port-Channel117.2001
  description PE-CE:ATL-SOB1-DC1-N2:Po101.2001
  encapsulation dot1q vlan 2001
  vrf DCX1
  ip address 10.76.0.138/31
!
interface Port-Channel211
  description PE-CE:ATL-SE1-DC1-N1:Po101
  no switchport
!
interface Port-Channel211.2001
  description PE-CE:ATL-SE1-DC1-N1:Po101.2001
  encapsulation dot1q vlan 2001
  vrf DCX1
  ip address 10.77.0.0/31
!
interface Port-Channel211.2002
  description PE-CE:ATL-SE1-DC1-N1:Po101.2002
  encapsulation dot1q vlan 2002
  vrf PEN1
  ip address 10.77.0.2/31
!
interface Port-Channel211.2004
  description PE-CE:ATL-SE1-DC1-N1:Po101.2004
  encapsulation dot1q vlan 2004
  vrf CCISSUE
  ip address 10.77.0.4/31
!
interface Port-Channel211.2005
  description PE-CE:ATL-SE1-DC1-N1:Po101.2005
  encapsulation dot1q vlan 2005
  vrf CCMERCH
  ip address 10.77.0.6/31
!
interface Port-Channel211.2006
  description PE-CE:ATL-SE1-DC1-N1:Po101.2006
  encapsulation dot1q vlan 2006
  vrf CCHYBRID
  ip address 10.77.0.8/31
!
interface Port-Channel212
  description PE-CE:ATL-SE1-DC1-N2:Po101
  no switchport
!
interface Port-Channel212.2001
  description PE-CE:ATL-SE1-DC1-N2:Po101.2001
  encapsulation dot1q vlan 2001
  vrf DCX1
  ip address 10.77.0.20/31
!
interface Port-Channel212.2002
  description PE-CE:ATL-SE1-DC1-N2:Po101.2002
  encapsulation dot1q vlan 2002
  vrf PEN1
  ip address 10.77.0.22/31
!
interface Port-Channel212.2004
  description PE-CE:ATL-SE1-DC1-N2:Po101.2004
  encapsulation dot1q vlan 2004
  vrf CCISSUE
  ip address 10.77.0.24/31
!
interface Port-Channel212.2005
  description PE-CE:ATL-SE1-DC1-N2:Po101.2005
  encapsulation dot1q vlan 2005
  vrf CCMERCH
  ip address 10.77.0.26/31
!
interface Port-Channel212.2006
  description PE-CE:ATL-SE1-DC1-N2:Po101.2006
  encapsulation dot1q vlan 2006
  vrf CCHYBRID
  ip address 10.77.0.28/31
!
interface Ethernet1/1
  description PE-CE:ATL-SI1-DC1-N1:Eth3/49/1
  no shutdown
  no switchport
  channel-group 110 mode active
!
interface Ethernet2/1
  description PE-CE:ATL-SI1-DC1-N2:Eth3/49/1
  no shutdown
  no switchport
  channel-group 111 mode active
!
interface Ethernet2/3
  shutdown
  no switchport
!
interface Ethernet3/1
  description PE-CE:ATL-ST1-DC1-N1:Eth3/49/1
  no shutdown
  no switchport
  channel-group 114 mode active
!
interface Ethernet4/1
  description PE-CE:ATL-ST1-DC1-N2:Eth3/49/1
  no shutdown
  no switchport
  channel-group 115 mode active
!
interface Ethernet15/1
  no shutdown
  no switchport
!
interface Ethernet15/1.2020
  description PE-CE:ATL-UI1-DC1-N1:Eth49/1.2020
  encapsulation dot1q vlan 2020
  vrf USX1
  ip address 10.48.139.0/31
  ip access-group ACL_RO_TRAFFIC_INBOUND in
!
interface Ethernet15/1.2820
  description PE-CE:ATL-UI1-DC1-N1:Eth49/1.2820
  encapsulation dot1q vlan 2820
  vrf USUNT1
  ip address 10.111.125.32/31
!
interface Ethernet16/1
  no shutdown
  no switchport
!
interface Ethernet16/1.2020
  description PE-CE:ATL-UI1-DC1-N2:Eth49/1.2020
  encapsulation dot1q vlan 2020
  vrf USX1
  ip address 10.48.139.2/31
  ip access-group ACL_RO_TRAFFIC_INBOUND in
!
interface Ethernet16/1.2820
  description PE-CE:ATL-UI1-DC1-N2:Eth49/1.2820
  encapsulation dot1q vlan 2820
  vrf USUNT1
  ip address 10.111.125.34/31
!
interface Ethernet21/1
  description PE-CE:ATL-SE1-DC1-N1:Eth3/49/1
  no shutdown
  no switchport
  channel-group 211 mode active
!
interface Ethernet22/1
  description PE-CE:ATL-SE1-DC1-N2:Eth3/49/1
  no shutdown
  no switchport
  channel-group 212 mode active
!
interface Ethernet23/1
  description PE-CE:ATL-SOB1-DC1-N1:Eth3/49/1
  no shutdown
  no switchport
  channel-group 116 mode active
!
interface Ethernet24/1
  description PE-CE:ATL-SOB1-DC1-N2:Eth3/49/1
  no shutdown
  no switchport
  channel-group 117 mode active
!
interface Ethernet25/1
  description P-PE:ATL-TRX1-DC1-P1:Eth25/1
  no shutdown
  no switchport
  ip address 10.199.2.43/31
  mpls ldp interface
  mac security profile MKA_AES_256
  ip ospf network point-to-point
  ip ospf authentication message-digest
  ip ospf area 0.0.0.0
  ip ospf message-digest-key 1 md5 7 gI+W5b1R4lDpehCmYzyW2w==
!
interface Ethernet26/1
  description P-PE:ATL-TRX1-DC1-P2:Eth25/1
  no shutdown
  no switchport
  ip address 10.199.2.45/31
  mpls ldp interface
  mac security profile MKA_AES_256
  ip ospf network point-to-point
  ip ospf authentication message-digest
  ip ospf area 0.0.0.0
  ip ospf message-digest-key 1 md5 7 2N0AcrEZMpyItTIpN+dU7Q==
!
interface Loopback0
  description MPLS_Overlay_peering
  ip address 10.199.0.28/32
  ip ospf area 0.0.0.0
!
interface Management1
  description oob_management
  no shutdown
  vrf MGMT
  ip address 10.9.182.151/28
!
!
mpls ip
!
mpls ldp
  router-id interface Loopback0
  no shutdown
!
!
router bgp 64800
  router-id 10.199.0.28
  update wait-install
  no bgp default ipv4-unicast
  distance bgp 20 200 200
  maximum-paths 2 ecmp 2
  bgp bestpath tie-break router-id
  
  neighbor PE_CE_DC_OB_SOB_DCX1 peer group
neighbor PE_CE_DC_OB_SOB_DCX1 remote-as 65140
neighbor PE_CE_DC_OB_SOB_DCX1 bfd
neighbor PE_CE_DC_OB_SOB_DCX1 route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_OB_SOB_DCX1 route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_OB_SOB_DCX1 password 7 kKXxGiEu6TVyilumLqEW/A==
neighbor PE_CE_DC_OB_SOB_DCX1 send-community
  !
  neighbor PE_CE_DC_PCI_SE_CCHYBRID peer group
neighbor PE_CE_DC_PCI_SE_CCHYBRID remote-as 65120
neighbor PE_CE_DC_PCI_SE_CCHYBRID bfd
neighbor PE_CE_DC_PCI_SE_CCHYBRID route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_PCI_SE_CCHYBRID route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_PCI_SE_CCHYBRID password 7 6eausfeHuNQGCcxKUsAFPw==
neighbor PE_CE_DC_PCI_SE_CCHYBRID send-community
  !
  neighbor PE_CE_DC_PCI_SE_CCISSUE peer group
neighbor PE_CE_DC_PCI_SE_CCISSUE remote-as 65120
neighbor PE_CE_DC_PCI_SE_CCISSUE bfd
neighbor PE_CE_DC_PCI_SE_CCISSUE route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_PCI_SE_CCISSUE route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_PCI_SE_CCISSUE password 7 qtf3UzE4xZNeuFGd+3xb4g==
neighbor PE_CE_DC_PCI_SE_CCISSUE send-community
  !
  neighbor PE_CE_DC_PCI_SE_CCMERCH peer group
neighbor PE_CE_DC_PCI_SE_CCMERCH remote-as 65120
neighbor PE_CE_DC_PCI_SE_CCMERCH bfd
neighbor PE_CE_DC_PCI_SE_CCMERCH route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_PCI_SE_CCMERCH route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_PCI_SE_CCMERCH password 7 6MpbKgmZazHWDDoj3OyS6g==
neighbor PE_CE_DC_PCI_SE_CCMERCH send-community
  !
  neighbor PE_CE_DC_PCI_SE_DCX1 peer group
neighbor PE_CE_DC_PCI_SE_DCX1 remote-as 65120
neighbor PE_CE_DC_PCI_SE_DCX1 bfd
neighbor PE_CE_DC_PCI_SE_DCX1 route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_PCI_SE_DCX1 route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_PCI_SE_DCX1 password 7 GFznB+vHUnXO8PBEZxEMaw==
neighbor PE_CE_DC_PCI_SE_DCX1 send-community
  !
  neighbor PE_CE_DC_PCI_SE_PEN1 peer group
neighbor PE_CE_DC_PCI_SE_PEN1 remote-as 65120
neighbor PE_CE_DC_PCI_SE_PEN1 bfd
neighbor PE_CE_DC_PCI_SE_PEN1 route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_PCI_SE_PEN1 route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_PCI_SE_PEN1 password 7 RNV9B6iVlRDUJlS1ePw3NA==
neighbor PE_CE_DC_PCI_SE_PEN1 send-community
  !
  neighbor PE_CE_DC_PROD_SI_BUSINTEL peer group
neighbor PE_CE_DC_PROD_SI_BUSINTEL remote-as 65100
neighbor PE_CE_DC_PROD_SI_BUSINTEL bfd
neighbor PE_CE_DC_PROD_SI_BUSINTEL route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_PROD_SI_BUSINTEL route-map RM_FILTERED_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_PROD_SI_BUSINTEL password 7 yUMUcnzcG+Z38KepecqVPg==
neighbor PE_CE_DC_PROD_SI_BUSINTEL send-community
  !
  neighbor PE_CE_DC_PROD_SI_DCX1 peer group
neighbor PE_CE_DC_PROD_SI_DCX1 remote-as 65100
neighbor PE_CE_DC_PROD_SI_DCX1 bfd
neighbor PE_CE_DC_PROD_SI_DCX1 route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_PROD_SI_DCX1 route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_PROD_SI_DCX1 password 7 1jAa9l2kLUpHINa0qKoB4Q==
neighbor PE_CE_DC_PROD_SI_DCX1 send-community
  !
  neighbor PE_CE_DC_PROD_SI_DMZMEM1 peer group
neighbor PE_CE_DC_PROD_SI_DMZMEM1 remote-as 65100
neighbor PE_CE_DC_PROD_SI_DMZMEM1 bfd
neighbor PE_CE_DC_PROD_SI_DMZMEM1 route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_PROD_SI_DMZMEM1 route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_PROD_SI_DMZMEM1 password 7 TOwcrcsHO2k2BL+WS6y2gw==
neighbor PE_CE_DC_PROD_SI_DMZMEM1 send-community
  !
  neighbor PE_CE_DC_PROD_SI_NCFDMZ peer group
neighbor PE_CE_DC_PROD_SI_NCFDMZ remote-as 65100
neighbor PE_CE_DC_PROD_SI_NCFDMZ bfd
neighbor PE_CE_DC_PROD_SI_NCFDMZ route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_PROD_SI_NCFDMZ route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_PROD_SI_NCFDMZ password 7 nDL2RDMDmbVlVbVI4SuueQ==
neighbor PE_CE_DC_PROD_SI_NCFDMZ send-community
  !
  neighbor PE_CE_DC_PROD_SI_USX1 peer group
neighbor PE_CE_DC_PROD_SI_USX1 remote-as 65100
neighbor PE_CE_DC_PROD_SI_USX1 bfd
neighbor PE_CE_DC_PROD_SI_USX1 route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_PROD_SI_USX1 route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_PROD_SI_USX1 password 7 dN/55dGE6CJYDkJQAFCa7A==
neighbor PE_CE_DC_PROD_SI_USX1 send-community
  !
  neighbor PE_CE_DC_TEST_ST_DCX1 peer group
neighbor PE_CE_DC_TEST_ST_DCX1 remote-as 65110
neighbor PE_CE_DC_TEST_ST_DCX1 bfd
neighbor PE_CE_DC_TEST_ST_DCX1 route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_TEST_ST_DCX1 route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_TEST_ST_DCX1 password 7 QOH18HsEBuGBmAPWI1fdJA==
neighbor PE_CE_DC_TEST_ST_DCX1 send-community
  !
  neighbor PE_CE_DC_TEST_ST_IDTN peer group
neighbor PE_CE_DC_TEST_ST_IDTN remote-as 65110
neighbor PE_CE_DC_TEST_ST_IDTN bfd
neighbor PE_CE_DC_TEST_ST_IDTN route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_TEST_ST_IDTN route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_TEST_ST_IDTN password 7 1jIoYXF6cWpAQoBcqwbNtA==
neighbor PE_CE_DC_TEST_ST_IDTN send-community
  !
  neighbor PE_CE_DC_TEST_ST_IDTNB2B peer group
neighbor PE_CE_DC_TEST_ST_IDTNB2B remote-as 65110
neighbor PE_CE_DC_TEST_ST_IDTNB2B bfd
neighbor PE_CE_DC_TEST_ST_IDTNB2B route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_TEST_ST_IDTNB2B route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_TEST_ST_IDTNB2B password 7 pugQyDfR4vWDCNsCFm/KgA==
neighbor PE_CE_DC_TEST_ST_IDTNB2B send-community
  !
  neighbor PE_CE_DC_TEST_ST_IDTNDX peer group
neighbor PE_CE_DC_TEST_ST_IDTNDX remote-as 65110
neighbor PE_CE_DC_TEST_ST_IDTNDX bfd
neighbor PE_CE_DC_TEST_ST_IDTNDX route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_TEST_ST_IDTNDX route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_TEST_ST_IDTNDX password 7 AIP6ztnNcrut2cZWEI7nlA==
neighbor PE_CE_DC_TEST_ST_IDTNDX send-community
  !
  neighbor PE_CE_DC_USUNT1 peer group
neighbor PE_CE_DC_USUNT1 remote-as 64754
neighbor PE_CE_DC_USUNT1 bfd
neighbor PE_CE_DC_USUNT1 route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_USUNT1 route-map STANDARD_1NET_BGP_POLICY_OUT out
neighbor PE_CE_DC_USUNT1 password 7 MjQUte/1TRYAVx9cuhE6cw==
neighbor PE_CE_DC_USUNT1 send-community
  !
  neighbor PE_CE_DC_USX1 peer group
neighbor PE_CE_DC_USX1 remote-as 64754
neighbor PE_CE_DC_USX1 bfd
neighbor PE_CE_DC_USX1 route-map STANDARD_1NET_BGP_POLICY_IN in
neighbor PE_CE_DC_USX1 route-map RM_FILTERED_TRUST_OUT out
neighbor PE_CE_DC_USX1 password 7 MqxgRjOvSJ/M0R7hEVqyrA==
neighbor PE_CE_DC_USX1 send-community
  !
  neighbor RR_PEERS peer group
neighbor RR_PEERS remote-as 64800
neighbor RR_PEERS transport pmtud
neighbor RR_PEERS update-source Loopback0
neighbor RR_PEERS bfd
neighbor RR_PEERS password 7 iKTQwhTMWkGv8NnVBwWL8w==
neighbor RR_PEERS send-community standard extended
neighbor RR_PEERS maximum-routes 0
neighbor 10.199.0.38 peer group RR_PEERS
neighbor 10.199.0.38 description BGP-RR:DFW-TRX1-DALEQ-RR1
neighbor 10.199.0.39 peer group RR_PEERS
neighbor 10.199.0.39 description BGP-RR:IAD-TRX1-ABVEQ-RR1
!
  !!
  address-family ipv4
   neighbor PE_CE_DC_OB_SOB_DCX1 activate
   neighbor PE_CE_DC_PCI_SE_CCHYBRID activate
   neighbor PE_CE_DC_PCI_SE_CCISSUE activate
   neighbor PE_CE_DC_PCI_SE_CCMERCH activate
   neighbor PE_CE_DC_PCI_SE_DCX1 activate
   neighbor PE_CE_DC_PCI_SE_PEN1 activate
   neighbor PE_CE_DC_PROD_SI_BUSINTEL activate
   neighbor PE_CE_DC_PROD_SI_DCX1 activate
   neighbor PE_CE_DC_PROD_SI_DMZMEM1 activate
   neighbor PE_CE_DC_PROD_SI_NCFDMZ activate
   neighbor PE_CE_DC_PROD_SI_USX1 activate
   neighbor PE_CE_DC_TEST_ST_DCX1 activate
   neighbor PE_CE_DC_TEST_ST_IDTN activate
   neighbor PE_CE_DC_TEST_ST_IDTNB2B activate
   neighbor PE_CE_DC_TEST_ST_IDTNDX activate
   neighbor PE_CE_DC_USUNT1 activate
   neighbor PE_CE_DC_USX1 activate
!
address-family vpn-ipv4
   neighbor RR_PEERS activate
!
  !
  vrf BUSINTEL
   rd 10.199.0.28:949
   route-target import vpn-ipv4 64536:910
   route-target import vpn-ipv4 64698:949
   route-target import vpn-ipv4 64750:910
   route-target import vpn-ipv4 64751:910
   route-target import vpn-ipv4 64752:910
   route-target import vpn-ipv4 64753:910
   route-target import vpn-ipv4 64800:910
   route-target import vpn-ipv4 64800:914
   route-target import vpn-ipv4 64800:949
   route-target import vpn-ipv4 64800:950
   route-target import vpn-ipv4 64800:91098
   route-target import vpn-ipv4 64800:91099
   route-target import vpn-ipv4 64811:910
   route-target import vpn-ipv4 64811:950
   route-target import vpn-ipv4 64811:91099
   route-target import vpn-ipv4 64813:910
   route-target import vpn-ipv4 64813:950
   route-target import vpn-ipv4 64813:91099
   route-target import vpn-ipv4 64820:90101
   route-target import vpn-ipv4 64820:90103
   route-target import vpn-ipv4 65010:91099
   route-target import vpn-ipv4 65011:90201
   route-target import vpn-ipv4 65210:90111
   route-target import vpn-ipv4 65215:90133
   route-target import vpn-ipv4 65354:949
   route-target export vpn-ipv4 64800:949
   router-id 10.199.0.28
   neighbor 10.64.0.5 peer group PE_CE_DC_PROD_SI_BUSINTEL
   neighbor 10.64.0.5 description ATL-SI1-DC1-N1
   neighbor 10.64.0.25 peer group PE_CE_DC_PROD_SI_BUSINTEL
   neighbor 10.64.0.25 description ATL-SI1-DC1-N2
!
  !
  vrf CCHYBRID
   rd 10.199.0.28:453
   route-target import vpn-ipv4 64692:453
   route-target import vpn-ipv4 64800:453
   route-target export vpn-ipv4 64800:453
   router-id 10.199.0.28
   neighbor 10.77.0.9 peer group PE_CE_DC_PCI_SE_CCHYBRID
   neighbor 10.77.0.9 description ATL-SE1-DC1-N1
   neighbor 10.77.0.29 peer group PE_CE_DC_PCI_SE_CCHYBRID
   neighbor 10.77.0.29 description ATL-SE1-DC1-N2
!
  !
  vrf CCISSUE
   rd 10.199.0.28:452
   route-target import vpn-ipv4 64692:452
   route-target import vpn-ipv4 64800:452
   route-target export vpn-ipv4 64800:452
   router-id 10.199.0.28
   neighbor 10.77.0.5 peer group PE_CE_DC_PCI_SE_CCISSUE
   neighbor 10.77.0.5 description ATL-SE1-DC1-N1
   neighbor 10.77.0.25 peer group PE_CE_DC_PCI_SE_CCISSUE
   neighbor 10.77.0.25 description ATL-SE1-DC1-N2
!
  !
  vrf CCMERCH
   rd 10.199.0.28:451
   route-target import vpn-ipv4 64692:451
   route-target import vpn-ipv4 64800:451
   route-target export vpn-ipv4 64800:451
   router-id 10.199.0.28
   neighbor 10.77.0.7 peer group PE_CE_DC_PCI_SE_CCMERCH
   neighbor 10.77.0.7 description ATL-SE1-DC1-N1
   neighbor 10.77.0.27 peer group PE_CE_DC_PCI_SE_CCMERCH
   neighbor 10.77.0.27 description ATL-SE1-DC1-N2
!
  !
  vrf DCX1
   rd 10.199.0.28:910
   route-target import vpn-ipv4 64534:916
   route-target import vpn-ipv4 64536:910
   route-target import vpn-ipv4 64540:916
   route-target import vpn-ipv4 64653:949
   route-target import vpn-ipv4 64698:949
   route-target import vpn-ipv4 64750:910
   route-target import vpn-ipv4 64751:910
   route-target import vpn-ipv4 64752:910
   route-target import vpn-ipv4 64753:910
   route-target import vpn-ipv4 64755:910
   route-target import vpn-ipv4 64758:910
   route-target import vpn-ipv4 64780:914
   route-target import vpn-ipv4 64782:91401
   route-target import vpn-ipv4 64782:91402
   route-target import vpn-ipv4 64800:910
   route-target import vpn-ipv4 64800:914
   route-target import vpn-ipv4 64800:949
   route-target import vpn-ipv4 64800:91098
   route-target import vpn-ipv4 64800:91099
   route-target import vpn-ipv4 64811:910
   route-target import vpn-ipv4 64811:91099
   route-target import vpn-ipv4 64813:910
   route-target import vpn-ipv4 64813:91099
   route-target import vpn-ipv4 64820:90101
   route-target import vpn-ipv4 64820:90103
   route-target import vpn-ipv4 65010:91099
   route-target import vpn-ipv4 65011:90201
   route-target import vpn-ipv4 65210:90111
   route-target import vpn-ipv4 65215:90113
   route-target import vpn-ipv4 65354:949
   route-target export vpn-ipv4 64800:910
   route-target import vpn-ipv4 route-map PREF_DEFAULT_IMPORT_MAP
   router-id 10.199.0.28
   neighbor 10.64.0.1 peer group PE_CE_DC_PROD_SI_DCX1
   neighbor 10.64.0.1 description ATL-SI1-DC1-N1
   neighbor 10.64.0.21 peer group PE_CE_DC_PROD_SI_DCX1
   neighbor 10.64.0.21 description ATL-SI1-DC1-N2
   neighbor 10.72.0.1 peer group PE_CE_DC_TEST_ST_DCX1
   neighbor 10.72.0.1 description ATL-ST1-DC1-N1
   neighbor 10.72.0.17 peer group PE_CE_DC_TEST_ST_DCX1
   neighbor 10.72.0.17 description ATL-ST1-DC1-N2
   neighbor 10.76.0.131 peer group PE_CE_DC_OB_SOB_DCX1
   neighbor 10.76.0.131 description ATL-SOB1-DC1-N1
   neighbor 10.76.0.139 peer group PE_CE_DC_OB_SOB_DCX1
   neighbor 10.76.0.139 description ATL-SOB1-DC1-N2
   neighbor 10.77.0.1 peer group PE_CE_DC_PCI_SE_DCX1
   neighbor 10.77.0.1 description ATL-SE1-DC1-N1
   neighbor 10.77.0.21 peer group PE_CE_DC_PCI_SE_DCX1
   neighbor 10.77.0.21 description ATL-SE1-DC1-N2
!
  !
  vrf DMZMEM1
   rd 10.199.0.28:909
   route-target import vpn-ipv4 64800:909
   route-target import vpn-ipv4 64811:909
   route-target import vpn-ipv4 64813:909
   route-target export vpn-ipv4 64800:909
   router-id 10.199.0.28
   neighbor 10.64.0.3 peer group PE_CE_DC_PROD_SI_DMZMEM1
   neighbor 10.64.0.3 description ATL-SI1-DC1-N1
   neighbor 10.64.0.23 peer group PE_CE_DC_PROD_SI_DMZMEM1
   neighbor 10.64.0.23 description ATL-SI1-DC1-N2
!
  !
  vrf IDTN
   rd 10.199.0.28:990
   route-target import vpn-ipv4 64526:990
   route-target import vpn-ipv4 64689:990
   route-target import vpn-ipv4 64753:990
   route-target import vpn-ipv4 64800:990
   route-target import vpn-ipv4 64811:990
   route-target import vpn-ipv4 64813:990
   route-target import vpn-ipv4 65425:990
   route-target export vpn-ipv4 64800:990
   router-id 10.199.0.28
   neighbor 10.72.0.3 peer group PE_CE_DC_TEST_ST_IDTN
   neighbor 10.72.0.3 description ATL-ST1-DC1-N1
   neighbor 10.72.0.19 peer group PE_CE_DC_TEST_ST_IDTN
   neighbor 10.72.0.19 description ATL-ST1-DC1-N2
!
  !
  vrf IDTNB2B
   rd 10.199.0.28:489
   route-target import vpn-ipv4 64697:489
   route-target import vpn-ipv4 64800:489
   route-target export vpn-ipv4 64800:489
   router-id 10.199.0.28
   neighbor 10.72.0.7 peer group PE_CE_DC_TEST_ST_IDTNB2B
   neighbor 10.72.0.7 description ATL-ST1-DC1-N1
   neighbor 10.72.0.23 peer group PE_CE_DC_TEST_ST_IDTNB2B
   neighbor 10.72.0.23 description ATL-ST1-DC1-N2
!
  !
  vrf IDTNDX
   rd 10.199.0.28:987
   route-target import vpn-ipv4 64526:987
   route-target import vpn-ipv4 64697:987
   route-target import vpn-ipv4 64697:49099
   route-target import vpn-ipv4 64800:987
   route-target import vpn-ipv4 64800:98799
   route-target import vpn-ipv4 64894:987
   route-target import vpn-ipv4 64898:987
   route-target export vpn-ipv4 64800:987
   router-id 10.199.0.28
   neighbor 10.72.0.5 peer group PE_CE_DC_TEST_ST_IDTNDX
   neighbor 10.72.0.5 description ATL-ST1-DC1-N1
   neighbor 10.72.0.21 peer group PE_CE_DC_TEST_ST_IDTNDX
   neighbor 10.72.0.21 description ATL-ST1-DC1-N2
!
  !
  vrf NCFDMZ
   rd 10.199.0.28:494
   route-target import vpn-ipv4 64693:490
   route-target import vpn-ipv4 64800:494
   route-target export vpn-ipv4 64800:494
   route-target import vpn-ipv4 route-map NCFDMZ_PREF_DEFAULT_IMPORT_MAP
   router-id 10.199.0.28
   neighbor 10.64.0.7 peer group PE_CE_DC_PROD_SI_NCFDMZ
   neighbor 10.64.0.7 description ATL-SI1-DC1-N1
   neighbor 10.64.0.27 peer group PE_CE_DC_PROD_SI_NCFDMZ
   neighbor 10.64.0.27 description ATL-SI1-DC1-N2
!
  !
  vrf OB1
   route-target import vpn-ipv4 64800:900
   route-target import vpn-ipv4 64801:900101
   route-target export vpn-ipv4 64800:900
   maximum-paths 2 ecmp 2
!
  !
  vrf PEN1
   rd 10.199.0.28:992
   route-target import vpn-ipv4 64800:992
   route-target import vpn-ipv4 64811:992
   route-target import vpn-ipv4 64813:992
   route-target import vpn-ipv4 65315:992
   route-target import vpn-ipv4 65508:99201
   route-target import vpn-ipv4 65508:99202
   route-target export vpn-ipv4 64800:992
   router-id 10.199.0.28
   neighbor 10.77.0.3 peer group PE_CE_DC_PCI_SE_PEN1
   neighbor 10.77.0.3 description ATL-SE1-DC1-N1
   neighbor 10.77.0.23 peer group PE_CE_DC_PCI_SE_PEN1
   neighbor 10.77.0.23 description ATL-SE1-DC1-N2
!
  !
  vrf USUNT1
   rd 10.199.0.28:911
   route-target import vpn-ipv4 64535:91102
   route-target import vpn-ipv4 64800:911
   route-target import vpn-ipv4 64811:911
   route-target import vpn-ipv4 64812:911
   route-target import vpn-ipv4 64813:911
   route-target import vpn-ipv4 65420:91111
   route-target import vpn-ipv4 65500:911
   route-target export vpn-ipv4 64800:912
   router-id 10.199.0.28
   neighbor 10.111.125.33 peer group PE_CE_DC_USUNT1
   neighbor 10.111.125.33 description ATL-UI1-DC1-N1:USUNT1
   neighbor 10.111.125.35 peer group PE_CE_DC_USUNT1
   neighbor 10.111.125.35 description ATL-UI1-DC1-N2:USUNT1
!
  !
  vrf USX1
   rd 10.199.0.28:914
   route-target import vpn-ipv4 64536:910
   route-target import vpn-ipv4 64653:949
   route-target import vpn-ipv4 64659:910
   route-target import vpn-ipv4 64698:949
   route-target import vpn-ipv4 64750:910
   route-target import vpn-ipv4 64751:910
   route-target import vpn-ipv4 64752:910
   route-target import vpn-ipv4 64753:910
   route-target import vpn-ipv4 64755:910
   route-target import vpn-ipv4 64756:910
   route-target import vpn-ipv4 64758:910
   route-target import vpn-ipv4 64782:91401
   route-target import vpn-ipv4 64782:91402
   route-target import vpn-ipv4 64800:910
   route-target import vpn-ipv4 64800:914
   route-target import vpn-ipv4 64800:949
   route-target import vpn-ipv4 64800:91098
   route-target import vpn-ipv4 64800:91099
   route-target import vpn-ipv4 64811:910
   route-target import vpn-ipv4 64811:91099
   route-target import vpn-ipv4 64813:910
   route-target import vpn-ipv4 64813:91099
   route-target import vpn-ipv4 64820:90101
   route-target import vpn-ipv4 64820:90103
   route-target import vpn-ipv4 65010:91099
   route-target import vpn-ipv4 65011:90201
   route-target import vpn-ipv4 65210:90111
   route-target import vpn-ipv4 65215:90113
   route-target import vpn-ipv4 65354:949
   route-target export vpn-ipv4 64800:914
   route-target import vpn-ipv4 route-map PREF_DEFAULT_IMPORT_MAP
   router-id 10.199.0.28
   neighbor 10.48.139.1 peer group PE_CE_DC_USX1
   neighbor 10.48.139.1 description ATL-UI1-DC1-N1:DEFAULT
   neighbor 10.48.139.3 peer group PE_CE_DC_USX1
   neighbor 10.48.139.3 description ATL-UI1-DC1-N2:DEFAULT
   neighbor 10.64.0.9 peer group PE_CE_DC_PROD_SI_USX1
   neighbor 10.64.0.9 description ATL-SI1-DC1-N1
   neighbor 10.64.0.29 peer group PE_CE_DC_PROD_SI_USX1
   neighbor 10.64.0.29 description ATL-SI1-DC1-N2
 !
  !
!
management ssh
ip access-group SSH_ACCESS vrf MGMT in
idle-timeout 10
authentication mode password
!
vrf MGMT
  no shutdown
```
