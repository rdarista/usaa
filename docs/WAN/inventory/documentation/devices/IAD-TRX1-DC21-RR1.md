# IAD-TRX1-DC21-RR1

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
- [Filters](#filters)
  - [IP Community-lists](#ip-community-lists)
  - [Prefix-lists](#prefix-lists)
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
| Management1 | oob_management | oob | MGMT | 10.9.181.16/24 | - |

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
   ip address 10.9.181.16/24
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
| nsho_provider_networks | IAD | All | Enabled |
| nsho_provider_networks | IAD |  | Enabled |
| nsho_provider_networks | IAD | bgp backward-transition, bridge | Disabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | ee45846c429dbc7db9303e8078f5721cc96d9d49 | - | - |

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
| NETSVC_NETBRAIN_TEST | READONLY | v3 | sha | aes | - | - | ee45846c429dbc7db9303e8078f5721cc96d9d49 |
| NETSVC_NETBRAIN | READONLY | v3 | sha | aes | - | - | ee45846c429dbc7db9303e8078f5721cc96d9d49 |
| SERVICENOW | READONLY | v3 | sha | aes | - | - | ee45846c429dbc7db9303e8078f5721cc96d9d49 |
| NETSVC_SPECTRUM | READONLY | v3 | sha | aes | - | - | ee45846c429dbc7db9303e8078f5721cc96d9d49 |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local ee45846c429dbc7db9303e8078f5721cc96d9d49
snmp-server contact nsho_provider_networks
snmp-server location IAD
snmp-server vrf MGMT local-interface Management1
snmp-server view READALL ISO included
snmp-server group READONLY v3 priv read READALL
snmp-server user NETSVC_NETBRAIN_TEST READONLY v3 localized ee45846c429dbc7db9303e8078f5721cc96d9d49 auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETBRAIN READONLY v3 localized ee45846c429dbc7db9303e8078f5721cc96d9d49 auth sha <removed> priv aes <removed>
snmp-server user SERVICENOW READONLY v3 localized ee45846c429dbc7db9303e8078f5721cc96d9d49 auth sha <removed> priv aes <removed>
snmp-server user NETSVC_SPECTRUM READONLY v3 localized ee45846c429dbc7db9303e8078f5721cc96d9d49 auth sha <removed> priv aes <removed>
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
| Loopback0 | MPLS_Overlay_peering | default | 10.199.0.39/32 |

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
   ip address 10.199.0.39/32
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
| MGMT | 0.0.0.0/0 | {{ management_gateway }} | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf MGMT 0.0.0.0/0 {{ management_gateway }}
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
| 64800 | 10.199.0.39 | disabled |- | enabled | 0 | disabled | disabled | 1000000 | - | - | - |

#### OSPF Interfaces

| Interface | Area | Cost | Point To Point |
| -------- | -------- | -------- | -------- |
| Loopback0 | 0.0.0.0 | - | - |

#### Router OSPF Device Configuration

```eos
!
router ospf 64800
   router-id 10.199.0.39
   bfd default
   max-lsa 0
   auto-cost reference-bandwidth 1000000
```

### Router BGP

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 64800 | 10.199.0.39 |

| BGP AS | Cluster ID |
| ------ | --------- |
| 64800 | 10.199.0.39 |

| BGP Tuning |
| ---------- |
| update wait-install |
| no bgp default ipv4-unicast |
| maximum-paths 4 ecmp 4 |

#### Router BGP Peer Groups

##### RR-OVERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | mpls |
| Remote AS | 64800 |
| Source | Loopback0 |
| BFD | True |
| Send community | all |
| Maximum routes | 0 (no limit) |

##### RR_PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | mpls |
| Remote AS | 64800 |
| Route Reflector Client | Yes |
| Source | Loopback0 |
| BFD | True |
| Send community | all |
| Maximum routes | 0 (no limit) |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 7.7.7.10 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.20 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.21 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.28 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.29 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.34 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.35 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.38 | Inherited from peer group RR-OVERLAY-PEERS | default | - | Inherited from peer group RR-OVERLAY-PEERS | Inherited from peer group RR-OVERLAY-PEERS | - | Inherited from peer group RR-OVERLAY-PEERS | - | - | - | - |
| 10.199.0.42 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.43 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.44 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.45 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.132 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.133 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.134 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.135 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.142 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.143 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.146 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.147 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.150 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.150 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.150 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.150 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.150 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.151 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.152 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.153 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.154 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.155 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.156 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 10.199.0.157 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |
| 14.14.14.1 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| RR-OVERLAY-PEERS | True | default |

#### Router BGP VPN-IPv4 Address Family

##### VPN-IPv4 Peer Groups

| Peer Group | Activate | Route-map In | Route-map Out | RCF In | RCF Out |
| ---------- | -------- | ------------ | ------------- | ------ | ------- |
| RR-OVERLAY-PEERS | True | - | - | - | - |
| RR_PEERS | True | - | - | - | - |

#### Router BGP Device Configuration

```eos
!
router bgp 64800
   router-id 10.199.0.39
   maximum-paths 4 ecmp 4
   update wait-install
   no bgp default ipv4-unicast
   bgp cluster-id 10.199.0.39
   neighbor RR-OVERLAY-PEERS peer group
   neighbor RR-OVERLAY-PEERS remote-as 64800
   neighbor RR-OVERLAY-PEERS update-source Loopback0
   neighbor RR-OVERLAY-PEERS bfd
   neighbor RR-OVERLAY-PEERS send-community
   neighbor RR-OVERLAY-PEERS maximum-routes 0
   neighbor RR_PEERS peer group
   neighbor RR_PEERS remote-as 64800
   neighbor RR_PEERS update-source Loopback0
   neighbor RR_PEERS route-reflector-client
   neighbor RR_PEERS bfd
   neighbor RR_PEERS password 7 <removed>
   neighbor RR_PEERS send-community
   neighbor RR_PEERS maximum-routes 0
   neighbor 7.7.7.10 peer group RR_PEERS
   neighbor 7.7.7.10 description lax-trx1-test3pcc-pe2
   neighbor 10.199.0.20 peer group RR_PEERS
   neighbor 10.199.0.20 description phx-trx1-a2e-pe1
   neighbor 10.199.0.21 peer group RR_PEERS
   neighbor 10.199.0.21 description phx-trx1-dsvc-pe2
   neighbor 10.199.0.28 peer group RR_PEERS
   neighbor 10.199.0.28 description atl-trx1-dc1-pe1
   neighbor 10.199.0.29 peer group RR_PEERS
   neighbor 10.199.0.29 description atl-trx1-dc1-pe2
   neighbor 10.199.0.34 peer group RR_PEERS
   neighbor 10.199.0.34 description dfw-trx1-ptxb1-pe1
   neighbor 10.199.0.35 peer group RR_PEERS
   neighbor 10.199.0.35 description dfw-trx1-ptxb1-pe2
   neighbor 10.199.0.38 peer group RR-OVERLAY-PEERS
   neighbor 10.199.0.38 description DFW-TRX1-DALEQ-RR1
   neighbor 10.199.0.42 peer group RR_PEERS
   neighbor 10.199.0.42 description tpa-trx1-comb2n-pe1
   neighbor 10.199.0.43 peer group RR_PEERS
   neighbor 10.199.0.43 description tpa-trx1-comb2n-pe2
   neighbor 10.199.0.44 peer group RR_PEERS
   neighbor 10.199.0.44 description tpa-trx1-cra2s-pe1
   neighbor 10.199.0.45 peer group RR_PEERS
   neighbor 10.199.0.45 description tpa-trx1-cra2s-pe2
   neighbor 10.199.0.132 peer group RR_PEERS
   neighbor 10.199.0.132 description den-trx1-ttcnt-pe1
   neighbor 10.199.0.133 peer group RR_PEERS
   neighbor 10.199.0.133 description den-trx1-ttcnt-pe2
   neighbor 10.199.0.134 peer group RR_PEERS
   neighbor 10.199.0.134 description dfw-trx1-telepf-pe1
   neighbor 10.199.0.135 peer group RR_PEERS
   neighbor 10.199.0.135 description dfw-trx1-telepf-pe2
   neighbor 10.199.0.142 peer group RR_PEERS
   neighbor 10.199.0.142 description slc-trx1-telepf-pe1
   neighbor 10.199.0.143 peer group RR_PEERS
   neighbor 10.199.0.143 description slc-trx1-telepf-pe2
   neighbor 10.199.0.146 peer group RR_PEERS
   neighbor 10.199.0.146 description iad-trx1-teletech-pe1
   neighbor 10.199.0.147 peer group RR_PEERS
   neighbor 10.199.0.147 description iad-trx1-teletech-pe2
   neighbor 10.199.0.150 peer group RR_PEERS
   neighbor 10.199.0.150 description dfw-trx1-sitel-pe1
   neighbor 10.199.0.150 peer group RR_PEERS
   neighbor 10.199.0.150 description dfw-trx1-sitel-pe2
   neighbor 10.199.0.150 peer group RR_PEERS
   neighbor 10.199.0.150 description dtw-trx1-qualfon-pe1
   neighbor 10.199.0.150 peer group RR_PEERS
   neighbor 10.199.0.150 description oma-trx1-sitel-pe1
   neighbor 10.199.0.150 peer group RR_PEERS
   neighbor 10.199.0.150 description oma-trx1-sitel-pe2
   neighbor 10.199.0.151 peer group RR_PEERS
   neighbor 10.199.0.151 description dtw-trx1-qualfon-pe2
   neighbor 10.199.0.152 peer group RR_PEERS
   neighbor 10.199.0.152 description den-trx1-qualfon-pe1
   neighbor 10.199.0.153 peer group RR_PEERS
   neighbor 10.199.0.153 description den-trx1-qualfon-pe2
   neighbor 10.199.0.154 peer group RR_PEERS
   neighbor 10.199.0.154 description mco-trx1-concentrix-pe1
   neighbor 10.199.0.155 peer group RR_PEERS
   neighbor 10.199.0.155 description mco-trx1-concentrix-pe2
   neighbor 10.199.0.156 peer group RR_PEERS
   neighbor 10.199.0.156 description cvg-trx1-concentrix-pe1
   neighbor 10.199.0.157 peer group RR_PEERS
   neighbor 10.199.0.157 description cvg-trx1-concentrix-pe2
   neighbor 14.14.14.1 peer group RR_PEERS
   neighbor 14.14.14.1 description lax-trx1-test3pcc-pe1
   !
   address-family evpn
      neighbor RR-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor RR-OVERLAY-PEERS activate
      no neighbor RR_PEERS activate
   !
   address-family vpn-ipv4
      neighbor RR-OVERLAY-PEERS activate
      neighbor RR_PEERS activate
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
management ssh
  authentication mode password
!
arp aging timeout default 900
!
router bgp 64800
  neighbor 10.199.0.20 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.20 description RR-CLIENT:PHX-TRX1-A2E-PE1
  neighbor 10.199.0.21 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.21 description RR-CLIENT:PHX-TRX1-DSVC-PE2
  neighbor 10.199.0.22 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.22 description RR-CLIENT:COS-TRX1-A1N-PE1
  neighbor 10.199.0.23 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.23 description RR-CLIENT:COS-TRX1-A1N-PE2
  neighbor 10.199.0.24 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.24 description RR-CLIENT:TPA-TRX1-TFLRO-PE1
  neighbor 10.199.0.25 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.25 description RR-CLIENT:TPA-TRX1-TFLRO-PE2
  neighbor 10.199.0.26 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.26 description RR-CLIENT:TPA-TRX1-CRA02S-PE1
  neighbor 10.199.0.27 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.27 description RR-CLIENT:TPA-TRX1-CRA02S-PE2
  neighbor 10.199.0.28 peer group RR_CLIENTS
  neighbor 10.199.0.28 description RR-CLIENT:ATL-TRX1-DC1-PE1
  neighbor 10.199.0.29 peer group RR_CLIENTS
  neighbor 10.199.0.29 description RR-CLIENT:ATL-TRX1-DC1-PE2
  neighbor 10.199.0.30 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.30 description RR-CLIENT:CPK-TRX1-B444-PE1
  neighbor 10.199.0.31 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.31 description RR-CLIENT:CPK-TRX1-B444-PE2
  neighbor 10.199.0.34 peer group RR_CLIENTS
  neighbor 10.199.0.34 description RR-CLIENT:DFW-TRX1-PTXB1-PE1
  neighbor 10.199.0.35 peer group RR_CLIENTS
  neighbor 10.199.0.35 description RR-CLIENT:DFW-TRX1-PTXB1-PE2
  neighbor 10.199.0.36 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.36 description RR-CLIENT:CLT-TRX1-CENTS8-PE1
  neighbor 10.199.0.37 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.37 description RR-CLIENT:CLT-TRX1-CENTS8-PE2
  neighbor 10.199.0.53 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.53 description RR-CLIENT:IAD-TRX1-ABVEQ-PE1
  neighbor 10.199.0.54 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.54 description RR-CLIENT:IAD-TRX1-ABVEQ-PE2
  neighbor 10.199.0.60 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.60 description RR-CLIENT:DFW-TRX1-DALEQ-PE1
  neighbor 10.199.0.61 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.61 description RR-CLIENT:DFW-TRX1-DALEQ-PE2
  neighbor 10.199.0.74 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.74 description RR-CLIENT:DFW-TRX1-CRLUNO1-PE1
  neighbor 10.199.0.75 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.75 description RR-CLIENT:DFW-TRX1-CRLUNO1-PE2
  neighbor 10.199.0.80 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.80 description RR-CLIENT:SAT-TRX1-CU1-PE1
  neighbor 10.199.0.81 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.81 description RR-CLIENT:SAT-TRX1-CU1-PE2
  neighbor 10.199.0.85 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.85 description RR-CLIENT:SAT-TRX1-ITC2-PE3
  neighbor 10.199.0.86 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.86 description RR-CLIENT:SAT-TRX1-ITC2-PE4
  neighbor 10.199.0.87 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.87 description RR-CLIENT:DFW-TRX1-CRLUNO1-PE3
  neighbor 10.199.0.88 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.88 description RR-CLIENT:DFW-TRX1-CRLUNO1-PE4
  neighbor 10.199.0.100 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.100 description RR-CLIENT:SAT-TRX1-ITC2-PE1
  neighbor 10.199.0.101 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.101 description RR-CLIENT:SAT-TRX1-ITC2-PE2
  neighbor 10.199.0.102 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.102 description RR-CLIENT:SAT-TRX1-BSVC-PE1
  neighbor 10.199.0.103 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.103 description RR-CLIENT:SAT-TRX1-BSVC-PE2
  neighbor 10.199.0.128 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.128 description BGP-RR:OMA-TRX1-SITEL-PE1
  neighbor 10.199.0.129 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.129 description BGP-RR:OMA-TRX1-SITEL-PE2
  neighbor 10.199.0.130 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.130 description BGP-RR:DFW-TRX1-SITEL-PE1
  neighbor 10.199.0.131 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.131 description BGP-RR:DFW-TRX1-SITEL-PE2
  neighbor 10.199.0.132 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.132 description BGP-RR:DEN-TRX1-TTCNT-PE1
  neighbor 10.199.0.133 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.133 description BGP-RR:DEN-TRX1-TTCNT-PE2
  neighbor 10.199.0.134 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.134 description BGP-RR:DFW-TRX1-TELEPF-PE1
  neighbor 10.199.0.135 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.135 description BGP-RR:DFW-TRX1-TELEPF-PE2
  neighbor 10.199.0.142 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.142 description BGP-RR:SLC-TRX1-TELEPF-PE1
  neighbor 10.199.0.143 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.143 description BGP-RR:SLC-TRX1-TELEPF-PE2
  neighbor 10.199.0.146 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.146 description BGP-RR:IAD-TRX1-TELETECH-PE1
  neighbor 10.199.0.147 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.147 description BGP-RR:IAD-TRX1-TELETECH-PE2
  neighbor 10.199.0.148 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.148 description BGP-RR:SAT-TRX1-DMI-PE1
  neighbor 10.199.0.149 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.149 description BGP-RR:SAT-TRX1-DMI-PE2
  neighbor 10.199.0.150 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.150 description BGP-RR:DTW-TRX1-QUALFON-PE1
  neighbor 10.199.0.151 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.151 description BGP-RR:DTW-TRX1-QUALFON-PE2
  neighbor 10.199.0.152 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.152 description BGP-RR:DEN-TRX1-QUALFON-PE2
  neighbor 10.199.0.153 peer group LEGACY_RR_CLIENTS
  neighbor 10.199.0.153 description BGP-RR:DEN-TRX1-QUALFON-PE1
```
