# DEN-TRX1-QUALFON-PE2

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
| Management1 | oob_management | oob | MGMT | 10.9.184.115/28 | - |

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
   ip address 10.9.184.115/28
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
| staging | 15 | network-admin | False | - |

#### Local Users Device Configuration

```eos
!
no username admin
username netsupport privilege 15 role network-admin secret sha512 <removed>
username staging privilege 15 role network-admin secret sha512 <removed>
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
| nsho_provider_networks | DEN | All | Enabled |
| nsho_provider_networks | DEN |  | Enabled |
| nsho_provider_networks | DEN | bgp backward-transition, bridge | Disabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | 7772b278f90062c417c1eaa4f2ef9aea5b8c1ada | - | - |

#### SNMP Local Interfaces

| Local Interface | VRF |
| --------------- | --- |
| Management1 | MGMT |

#### SNMP VRF Status

| VRF | Status |
| --- | ------ |
| MGMT | Enabled |
| default | Disabled |

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
| NETSVC_NETBRAIN_TEST | READONLY | v3 | sha | aes | - | - | 7772b278f90062c417c1eaa4f2ef9aea5b8c1ada |
| NETSVC_NETBRAIN | READONLY | v3 | sha | aes | - | - | 7772b278f90062c417c1eaa4f2ef9aea5b8c1ada |
| SERVICENOW | READONLY | v3 | sha | aes | - | - | 7772b278f90062c417c1eaa4f2ef9aea5b8c1ada |
| NETSVC_SPECTRUM | READONLY | v3 | sha | aes | - | - | 7772b278f90062c417c1eaa4f2ef9aea5b8c1ada |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 7772b278f90062c417c1eaa4f2ef9aea5b8c1ada
snmp-server contact nsho_provider_networks
snmp-server location DEN
snmp-server vrf MGMT local-interface Management1
snmp-server view READALL ISO included
snmp-server group READONLY v3 priv read READALL
snmp-server user NETSVC_NETBRAIN_TEST READONLY v3 localized 7772b278f90062c417c1eaa4f2ef9aea5b8c1ada auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETBRAIN READONLY v3 localized 7772b278f90062c417c1eaa4f2ef9aea5b8c1ada auth sha <removed> priv aes <removed>
snmp-server user SERVICENOW READONLY v3 localized 7772b278f90062c417c1eaa4f2ef9aea5b8c1ada auth sha <removed> priv aes <removed>
snmp-server user NETSVC_SPECTRUM READONLY v3 localized 7772b278f90062c417c1eaa4f2ef9aea5b8c1ada auth sha <removed> priv aes <removed>
snmp-server host 10.139.4.41 vrf MGMT version 3 priv NETSVC_SPECTRUM
snmp-server host 10.139.4.44 vrf MGMT version 3 priv NETSVC_SPECTRUM
snmp-server enable traps
no snmp-server enable traps bgp backward-transition
no snmp-server enable traps bridge
snmp-server vrf MGMT
no snmp-server vrf default
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

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | MPLS_Overlay_peering | default | 10.199.0.153/32 |

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
   ip address 10.199.0.153/32
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
| MGMT | 0.0.0.0/0 | 10.9.184.113 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf MGMT 0.0.0.0/0 10.9.184.113
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
| 64800 | 10.199.0.153 | disabled |- | enabled | 0 | disabled | disabled | 1000000 | - | - | - |

#### OSPF Interfaces

| Interface | Area | Cost | Point To Point |
| -------- | -------- | -------- | -------- |
| Loopback0 | 0.0.0.0 | - | - |

#### Router OSPF Device Configuration

```eos
!
router ospf 64800
   router-id 10.199.0.153
   bfd default
   max-lsa 0
   auto-cost reference-bandwidth 1000000
```

### Router BGP

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 64800 | 10.199.0.153 |

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
   router-id 10.199.0.153
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
| DA2_DEFAULT_COMM | permit | 64811:11233 |
| DC21_DEFAULT_COMM | permit | 64813:13233 |
| PE1 | permit | (.*):1_ |
| PE2 | permit | (.*):2_ |
| POLICY_LP120 | permit | (.*):412 |
| POLICY_LP150 | permit | (.*):415 |
| POLICY_LP170 | permit | (.*):417 |
| POLICY_LP180 | permit | (.*):418 |
| POLICY_LP190_OVERRIDE | permit | (.*):419 |
| POLICY_LP20_BLEED | permit | (.*):410 |
| 3PCC | permit | (.*):920 |
| OB1 | permit | 64801:1[1-3]7[0-9][0-9] |

#### IP Community-lists Device Configuration

```eos
!
ip community-list DA2_DEFAULT_COMM permit 64811:11233
ip community-list DC21_DEFAULT_COMM permit 64813:13233
ip community-list regexp PE1 permit (.*):1_
ip community-list regexp PE2 permit (.*):2_
ip community-list regexp POLICY_LP120 permit (.*):412
ip community-list regexp POLICY_LP150 permit (.*):415
ip community-list regexp POLICY_LP170 permit (.*):417
ip community-list regexp POLICY_LP180 permit (.*):418
ip community-list regexp POLICY_LP190_OVERRIDE permit (.*):419
ip community-list regexp POLICY_LP20_BLEED permit (.*):410
ip community-list regexp 3PCC permit (.*):920
ip community-list regexp OB1 permit 64801:1[1-3]7[0-9][0-9]
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

##### 3PCC_VENDOR_PRIORITY-1_IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list VENDOR_PFX | local-preference 120<br>community 64800:920 64800:11710 additive | - | - |

##### 3PCC_VENDOR_PRIORITY-1_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | community 3PCC | as-path prepend 64800 64800 64800 64800 | - | - |

##### DENY_ALL

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | deny | - | - | - | - |

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
| 10 | permit | community DC21_DEFAULT_COMM | local-preference 150 | - | - |
| 20 | permit | community DA2_DEFAULT_COMM | local-preference 120 | - | - |
| 900 | permit | - | - | - | - |

##### RM_CE_OB1_IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | community OB1 | - | - | - |

##### RM_CE_OB1_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | - | - | - |

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

#### Route-maps Device Configuration

```eos
!
route-map 3PCC_VENDOR_PRIORITY-1_IN permit 10
   match ip address prefix-list VENDOR_PFX
   set community 64800:920 64800:11710 additive
   set local-preference 120
!
route-map 3PCC_VENDOR_PRIORITY-1_OUT permit 10
   match community 3PCC
   set as-path prepend 64800 64800 64800 64800
!
route-map DENY_ALL deny 10
!
route-map PASS_ALL permit 10
!
route-map PASS_DEFAULT_ONLY permit 10
   match ip address prefix-list PL_DEFAULT
!
route-map PREF_DEFAULT_IMPORT_MAP permit 10
   description Standard import map to allow DC21 Default
   match community DC21_DEFAULT_COMM
   set local-preference 150
!
route-map PREF_DEFAULT_IMPORT_MAP permit 20
   description Standard import map to allow DA2 Default
   match community DA2_DEFAULT_COMM
   set local-preference 120
!
route-map PREF_DEFAULT_IMPORT_MAP permit 900
   description Standard import map to allow All routes
!
route-map RM_CE_OB1_IN permit 10
   match community OB1
!
route-map RM_CE_OB1_OUT permit 10
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
```

## ACL

### IP Access-lists

#### IP Access-lists Device Configuration

```eos
!
ip access-list SSH_ACCESS
   10 permit tcp 10.0.0.0/8 any eq ssh
   20 permit tcp 172.16.0.0/12 any eq ssh
   30 permit tcp 167.24.0.0/16 any eq ssh
   40 permit tcp 192.168.0.0/16 any eq ssh
   50 permit tcp 198.148.150.0/24 any eq ssh
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
!
vrf instance MGMT
!
vrf instance OB1
!
vrf instance VNX1
!
ip routing
no ip routing vrf MGMT
ip routing vrf OB1
ip routing vrf VNX1
!
!
interface Port-Channel10
description PE-PE:Po10:DEN-TRX1-QUALFON-PE1:Po10
no switchport
ip address 10.199.1.163/31
mpls ldp interface
ip ospf network point-to-point
ip ospf authentication message-digest
ip ospf area 0.0.0.0
ip ospf message-digest-key 1 md5 usaaospfpass
!
interface Port-Channel12 
description PE-CE:Po12:DEN-OB1-QUALFON-N1:Et13
vrf OB1
ip address 10.9.177.226/31
!
interface Port-Channel13
description VENDOR:Po13:QUALFON:Po13
no switchport
vrf VNX1
ip address 10.8.249.3/31
mtu 9214
!
interface Ethernet2
  description VENDOR:Et2:DEN:VW-SCLT-01DC-01:Et1 
    no shutdown
    no switchport
    channel-group 13 mode active
!
interface Ethernet3
  description VENDOR:Et3:DEN:VW-SCLT-01DC-01:Et2 
    no shutdown
    no switchport
    channel-group 13 mode active
!
interface Ethernet4
  description PE-CE:Et4:DEN-OB1-QUALFON-N1:Et13
  no shutdown
  no switchport
  channel-group 12 mode active
!
interface Ethernet5
  description PE-PE:Et5:DEN-TRX1-QUALFON-PE1:Et5
  no shutdown
  no switchport
  channel-group 10 mode active
  mac security profile MKA_AES_256
!
interface Ethernet6
  description PE-PE:Et6:DEN-TRX1-QUALFON-PE1:Et6
  no shutdown
  no switchport
  channel-group 10 mode active
  mac security profile MKA_AES_256
!
interface Ethernet37
  description P-PE:VZE:O5002586:Et37:23076833:DFW-TRX1-DALEQ-P3:Gi0/0/0/6
  no shutdown
  mtu 9170
  no switchport
  ip address 10.199.1.158/31
  mpls ldp interface
  mac security profile MKA_AES_256
  ip ospf network point-to-point
  ip ospf authentication message-digest
  ip ospf area 0.0.0.0
  ip ospf message-digest-key 1 md5 usaaospfpass
!
interface Loopback0
  description MPLS_Overlay_peering
  ip address 10.199.0.153/32
  ip ospf area 0.0.0.0
!
interface Management1
  description oob_management
  no shutdown
  vrf MGMT
  ip address 10.9.184.115/28
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
  router-id 10.199.0.153
  update wait-install
  no bgp default ipv4-unicast
  distance bgp 20 200 200
  maximum-paths 2 ecmp 2
  bgp bestpath tie-break router-id
  neighbor PE_CE_OB1 peer group
  neighbor PE_CE_OB1 remote-as 64801
  neighbor PE_CE_OB1 bfd
  neighbor PE_CE_OB1 route-map RM_CE_OB1_IN in
  neighbor PE_CE_OB1 route-map RM_CE_OB1_OUT out
  neighbor PE_CE_OB1 password 7 LrxdPchq0LiOI2Jz39Pe5Q==
  neighbor PE_CE_OB1 send-community
  neighbor PE_CE_3PCC peer group
  neighbor PE_CE_3PCC local-as 7838 no-prepend replace-as
  neighbor PE_CE_3PCC timers 2 5
  neighbor PE_CE_3PCC bfd
  neighbor PE_CE_3PCC send-community
  neighbor PE_CE_3PCC remove-private-as
  neighbor PE_CE_3PCC route-map 3PCC_VENDOR_PRIORITY-1_IN in
  neighbor PE_CE_3PCC route-map 3PCC_VENDOR_PRIORITY-1_OUT out
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
  address-family ipv4
  neighbor PE_CE_OB1 activate
  neighbor PE_CE_3PCC activate
  !
  address-family vpn-ipv4
  neighbor RR_PEERS activate
  no neighbor default encapsulation mpls next-hop-self source-interface Loopback0
  !
  vrf OB1
  rd 10.199.0.153:900
  route-target import vpn-ipv4 64800:900
  route-target import vpn-ipv4 64801:900101
  route-target export vpn-ipv4 64800:900
  router-id 10.199.0.153
  maximum-paths 2 ecmp 2
  neighbor 10.9.177.227 peer group PE_CE_OB1
  neighbor 10.9.177.227 description OB1-N1:OB1
  vrf VNX1
  rd 10.199.0.153:920
  route-target import vpn-ipv4 65420:90311
  route-target import vpn-ipv4 65526:90312
  route-target import vpn-ipv4 65500:903
  route-target import vpn-ipv4 64840:90301
  route-target import vpn-ipv4 64840:90302
  route-target import vpn-ipv4 64840:90303
  route-target import vpn-ipv4 64800:903
  route-target export vpn-ipv4 64800:903
  router-id 10.199.0.153
  maximum-paths 2 ecmp 2
  neighbor 10.8.249.2 remote-as 65008
  neighbor 10.8.249.2 peer group PE_CE_3PCC
  neighbor 10.8.249.2 description QUALFON:VENDOR_DEVICE
  neighbor 10.8.249.2 password 7 $1c$O/K5nO7RsL6PAxl7mDsL0Q==
!
management ssh
ip access-group SSH_ACCESS vrf MGMT in
idle-timeout 10
authentication mode password
!
vrf MGMT
  no shutdown
!
```
