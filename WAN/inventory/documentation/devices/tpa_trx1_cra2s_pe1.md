# tpa-trx1-cra2s-pe1

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
  - [Route-maps](#route-maps)
- [ACL](#acl)
  - [IP Access-lists](#ip-access-lists)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)
- [MACsec](#macsec)
  - [MACsec Summary](#macsec-summary)
  - [MACsec Device Configuration](#macsec-device-configuration)
- [EOS CLI Device Configuration](#eos-cli-device-configuration)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | Description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | MGMT | 10.9.180.1/24 | - |

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
   ip address 10.9.180.1/24
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
| nsho_provider_networks | TPA | All | Enabled |
| nsho_provider_networks | TPA |  | Enabled |
| nsho_provider_networks | TPA | bgp backward-transition, bridge | Disabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | 9919759fd9fff698894b6a940ea38c0a9cd89d6c | - | - |

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
| NETSVC_NETBRAIN_TEST | READONLY | v3 | sha | aes | - | - | 9919759fd9fff698894b6a940ea38c0a9cd89d6c |
| NETSVC_NETBRAIN | READONLY | v3 | sha | aes | - | - | 9919759fd9fff698894b6a940ea38c0a9cd89d6c |
| SERVICENOW | READONLY | v3 | sha | aes | - | - | 9919759fd9fff698894b6a940ea38c0a9cd89d6c |
| NETSVC_NETSCOUT | READONLY | v3 | sha | aes | - | - | 9919759fd9fff698894b6a940ea38c0a9cd89d6c |
| NETSVC_SPECTRUM | READONLY | v3 | sha | aes | - | - | 9919759fd9fff698894b6a940ea38c0a9cd89d6c |
| sdadmin | CAPC | v3 | md5 | - | - | - | 9919759fd9fff698894b6a940ea38c0a9cd89d6c |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 9919759fd9fff698894b6a940ea38c0a9cd89d6c
snmp-server contact nsho_provider_networks
snmp-server location TPA
snmp-server vrf MGMT local-interface Management1
snmp-server view READALL ISO included
snmp-server group READONLY v3 priv read READALL
snmp-server user NETSVC_NETBRAIN_TEST READONLY v3 localized 9919759fd9fff698894b6a940ea38c0a9cd89d6c auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETBRAIN READONLY v3 localized 9919759fd9fff698894b6a940ea38c0a9cd89d6c auth sha <removed> priv aes <removed>
snmp-server user SERVICENOW READONLY v3 localized 9919759fd9fff698894b6a940ea38c0a9cd89d6c auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETSCOUT READONLY v3 localized 9919759fd9fff698894b6a940ea38c0a9cd89d6c auth sha <removed> priv aes <removed>
snmp-server user NETSVC_SPECTRUM READONLY v3 localized 9919759fd9fff698894b6a940ea38c0a9cd89d6c auth sha <removed> priv aes <removed>
snmp-server user sdadmin CAPC v3 localized 9919759fd9fff698894b6a940ea38c0a9cd89d6c auth md5 <removed>
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

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | MPLS_Overlay_peering | default | 10.199.0.44/32 |

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
   ip address 10.199.0.44/32
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

### Router OSPF

#### Router OSPF Summary

| Process ID | Router ID | Default Passive Interface | No Passive Interface | BFD | Max LSA | Default Information Originate | Log Adjacency Changes Detail | Auto Cost Reference Bandwidth | Maximum Paths | MPLS LDP Sync Default | Distribute List In |
| ---------- | --------- | ------------------------- | -------------------- | --- | ------- | ----------------------------- | ---------------------------- | ----------------------------- | ------------- | --------------------- | ------------------ |
| 64800 | 10.199.0.44 | disabled |- | enabled | 12000 | disabled | disabled | 1000000 | - | - | - |

#### OSPF Interfaces

| Interface | Area | Cost | Point To Point |
| -------- | -------- | -------- | -------- |
| Loopback0 | 0.0.0.0 | - | - |

#### Router OSPF Device Configuration

```eos
!
router ospf 64800
   router-id 10.199.0.44
   bfd default
   max-lsa 12000
   auto-cost reference-bandwidth 1000000
```

### Router BGP

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 64800 | 10.199.0.44 |

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
   router-id 10.199.0.44
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
| LDP Router ID | 10.199.0.44 |
| LDP Interface Disabled Default | True |
| LDP Transport-Address Interface | Loopback0 |

#### MPLS and LDP Device Configuration

```eos
!
mpls ip
!
mpls ldp
   interface disabled default
   router-id 10.199.0.44
   no shutdown
   transport-address interface Loopback0
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

### Route-maps

#### Route-maps Summary

##### PREF_DEFAULT_IMPORT_MAP

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | community DC21_DEFAULT_COMM | local-preference 150 | - | - |
| 20 | permit | community DA2_DEFAULT_COMM | local-preference 120 | - | - |
| 900 | permit | - | - | - | - |

##### RO_BLEED_IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | local-preference 20 | - | - |

##### RO_BLEED_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | as-path prepend 64800 64800 64800 64800 64800 | - | - |

##### RO_IDTN_BGP_POLICY_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | community 64800:1 additive | - | - |

##### RO_MGMT_SW_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit |  ip address prefix-list DEFAULT  | community 64800:1 additive | - | - |

##### RO_TRUST_BGP_POLICY_IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | community POLICY_LP20_BLEED | local-preference 20 | - | - |
| 20 | permit | community POLICY_LP190_OVERRIDE | local-preference 190 | - | - |
| 30 | permit | community POLICY_LP120 | local-preference 120 | - | - |
| 40 | permit | community POLICY_LP150 | local-preference 150 | - | - |
| 50 | permit | community POLICY_LP170 | local-preference 170 | - | - |
| 60 | permit | community POLICY_LP180 | local-preference 180 | - | - |
| 70 | permit | community PE1 | local-preference 120 | - | - |
| 80 | permit | - | - | - | - |

##### RO_TRUST_BGP_POLICY_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 5 | deny | ip address prefix-list VELO-SPECIFIC | - | - | - |
| 10 | permit |  ip address prefix-list DEFAULT  | community 64800:1 additive | - | - |

##### RO_UNTRUST_BGP_POLICY_IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | community POLICY_LP20_BLEED | local-preference 20 | - | - |
| 20 | permit | community POLICY_LP190_OVERRIDE | local-preference 190 | - | - |
| 30 | permit | community POLICY_LP120 | local-preference 120 | - | - |
| 40 | permit | community POLICY_LP150 | local-preference 150 | - | - |
| 50 | permit | community POLICY_LP170 | local-preference 170 | - | - |
| 60 | permit | community POLICY_LP180 | local-preference 180 | - | - |
| 70 | permit | community PE1 | local-preference 120 | - | - |
| 80 | permit | - | - | - | - |

##### RO_UNTRUST_BGP_POLICY_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit |  ip address prefix-list DEFAULT  | community 64800:1 additive | - | - |

##### RO_USAADR_BGP_POLICY_IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 70 | permit | community PE1 | local-preference 120 | - | - |

##### RO_USAADR_BGP_POLICY_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | community 64800:1 additive | - | - |

#### Route-maps Device Configuration

```eos
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
route-map RO_BLEED_IN permit 10
   set local-preference 20
!
route-map RO_BLEED_OUT permit 10
   set as-path prepend 64800 64800 64800 64800 64800
!
route-map RO_IDTN_BGP_POLICY_OUT permit 10
   set community 64800:1 additive
!
route-map RO_MGMT_SW_OUT permit 10
   match  ip address prefix-list DEFAULT 
   set community 64800:1 additive
!
route-map RO_TRUST_BGP_POLICY_IN permit 10
   match community POLICY_LP20_BLEED
   set local-preference 20
!
route-map RO_TRUST_BGP_POLICY_IN permit 20
   match community POLICY_LP190_OVERRIDE
   set local-preference 190
!
route-map RO_TRUST_BGP_POLICY_IN permit 30
   match community POLICY_LP120
   set local-preference 120
!
route-map RO_TRUST_BGP_POLICY_IN permit 40
   match community POLICY_LP150
   set local-preference 150
!
route-map RO_TRUST_BGP_POLICY_IN permit 50
   match community POLICY_LP170
   set local-preference 170
!
route-map RO_TRUST_BGP_POLICY_IN permit 60
   match community POLICY_LP180
   set local-preference 180
!
route-map RO_TRUST_BGP_POLICY_IN permit 70
   match community PE1
   set local-preference 120
!
route-map RO_TRUST_BGP_POLICY_IN permit 80
!
route-map RO_TRUST_BGP_POLICY_OUT deny 5
   match ip address prefix-list VELO-SPECIFIC
!
route-map RO_TRUST_BGP_POLICY_OUT permit 10
   match  ip address prefix-list DEFAULT 
   set community 64800:1 additive
!
route-map RO_UNTRUST_BGP_POLICY_IN permit 10
   match community POLICY_LP20_BLEED
   set local-preference 20
!
route-map RO_UNTRUST_BGP_POLICY_IN permit 20
   match community POLICY_LP190_OVERRIDE
   set local-preference 190
!
route-map RO_UNTRUST_BGP_POLICY_IN permit 30
   description Standard import map to allow All routes
   match community POLICY_LP120
   set local-preference 120
!
route-map RO_UNTRUST_BGP_POLICY_IN permit 40
   match community POLICY_LP150
   set local-preference 150
!
route-map RO_UNTRUST_BGP_POLICY_IN permit 50
   match community POLICY_LP170
   set local-preference 170
!
route-map RO_UNTRUST_BGP_POLICY_IN permit 60
   match community POLICY_LP180
   set local-preference 180
!
route-map RO_UNTRUST_BGP_POLICY_IN permit 70
   match community PE1
   set local-preference 120
!
route-map RO_UNTRUST_BGP_POLICY_IN permit 80
!
route-map RO_UNTRUST_BGP_POLICY_OUT permit 10
   match  ip address prefix-list DEFAULT 
   set community 64800:1 additive
!
route-map RO_USAADR_BGP_POLICY_IN permit 70
   match community PE1
   set local-preference 120
!
route-map RO_USAADR_BGP_POLICY_OUT permit 10
   set community 64800:1 additive
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

## MACsec

### MACsec Summary

License is not installed.


#### MACsec Profiles Summary

##### Profile MKA_AES_256

###### Settings

| Cipher | Key-Server Priority | Rekey-Period | SCI | Traffic Unprotected Fallback |
| ------ | ------------------- | ------------ | --- | ---------------------------- |
| aes256-gcm | 60 | - | True | - |

### MACsec Device Configuration

```eos
!
mac security
   !
   profile MKA_AES_256
      cipher aes256-gcm
      mka key-server priority 60
      sci
```

## EOS CLI Device Configuration

```eos
!
vlan 1
  name Default
  state suspend
!
vrf instance MGMT
!
vrf instance OB1
!
vrf instance USUNT1
!
vrf instance USX1
!
queue-monitor streaming
  no shutdown
!
mac security
  profile MKA_AES_256
      cipher aes256-gcm
      key 0100000000000000000000000000000000000000000000000000000000000000 7 13031216090D057A7B7478636572435746535106090803045E534846090807030205045B0B56570807544356540B5B565F711C1E59495547425B5C547A7B747863
      mka key-server priority 255
      sci
!
interface Port-Channel100
  description PE-PE:TPA-TRX1-CRA2S-PE2:Po100
  no switchport
  ip address 10.199.1.120/31
  mpls ldp interface
  ip ospf network point-to-point
  ip ospf authentication message-digest
  ip ospf area 0.0.0.0
  ip ospf message-digest-key 1 md5 7 IZHin6R1FrKg2GaolowV8Q==
!
interface Ethernet1
  shutdown
  no switchport
!
interface Ethernet2
  shutdown
  no switchport
!
interface Ethernet3
  shutdown
  no switchport
!
interface Ethernet4
  shutdown
  no switchport
!
interface Ethernet5
  shutdown
  no switchport
!
interface Ethernet6
  shutdown
  no switchport
!
interface Ethernet7
  shutdown
  no switchport
!
interface Ethernet8
  shutdown
  no switchport
!
interface Ethernet9
  shutdown
  no switchport
!
interface Ethernet10
  shutdown
  no switchport
!
interface Ethernet11
  description PE-PE:TEMP To TPA-TRX1-CRA02S-PE1:Te0/1/3
  no shutdown
  mtu 9170
  no switchport
  ip address 10.199.1.57/31
  mpls ldp interface
  mac security profile MKA_AES_256
  ip ospf network point-to-point
  ip ospf authentication message-digest
  ip ospf area 0.0.0.0
  ip ospf message-digest-key 1 md5 7 Nh5uOmPgl5u4z6I0rF3erA==
!
interface Ethernet12
  shutdown
  no switchport
!
interface Ethernet13
  shutdown
  no switchport
!
interface Ethernet14
  shutdown
  no switchport
!
interface Ethernet15
  shutdown
  no switchport
!
interface Ethernet16
  shutdown
  no switchport
!
interface Ethernet17
  shutdown
  no switchport
!
interface Ethernet18
  shutdown
  no switchport
!
interface Ethernet19
  shutdown
  no switchport
!
interface Ethernet20
  shutdown
  no switchport
!
interface Ethernet21
  shutdown
  no switchport
!
interface Ethernet22
  shutdown
  no switchport
!
interface Ethernet23
  shutdown
  no switchport
!
interface Ethernet24
  shutdown
  no switchport
!
interface Ethernet25
  shutdown
  no switchport
!
interface Ethernet26
  shutdown
  no switchport
!
interface Ethernet27
  shutdown
  no switchport
!
interface Ethernet28
  shutdown
  no switchport
!
interface Ethernet29
  shutdown
  no switchport
!
interface Ethernet30
  shutdown
  no switchport
!
interface Ethernet31
  shutdown
  no switchport
!
interface Ethernet32
  shutdown
  no switchport
!
interface Ethernet33
  shutdown
  no switchport
!
interface Ethernet34
  shutdown
  no switchport
!
interface Ethernet35
  shutdown
  no switchport
!
interface Ethernet36
  description Pe-PE:TPA-TRX1-COMB2N-PE1:Eth36:Lumen:CID#446905447
  no shutdown
  mtu 9170
  no switchport
  ip address 10.199.1.90/31
  mpls ldp interface
  mac security profile MKA_AES_256
  ip ospf cost 1000
  ip ospf network point-to-point
  ip ospf authentication message-digest
  ip ospf area 0.0.0.0
  ip ospf message-digest-key 1 md5 7 LWjQhAwDgK8PAURxrj2omA==
!
interface Ethernet37
  description P-PE:Verizon:W1D60063:IAD-TRX1-DC21-P3:Et1
  no shutdown
  mtu 9170
  no switchport
  ip address 10.199.1.19/31
  mpls ldp interface
  mac security profile MKA_AES_256
  ip ospf network point-to-point
  ip ospf authentication message-digest
  ip ospf area 0.0.0.0
  ip ospf message-digest-key 1 md5 7 LWjQhAwDgK8PAURxrj2omA==
!
interface Ethernet38
  shutdown
  no switchport
!
interface Ethernet39
  shutdown
  no switchport
!
interface Ethernet40
  shutdown
  no switchport
!
interface Ethernet41
  shutdown
  no switchport
!
interface Ethernet42
  shutdown
  no switchport
!
interface Ethernet43
  shutdown
  no switchport
!
interface Ethernet44
  shutdown
  no switchport
!
interface Ethernet45
  shutdown
  no switchport
!
interface Ethernet46
  shutdown
  no switchport
!
interface Ethernet47
  description PE-PE:TPA-TRX1-CRO-PE2:Eth47
  no shutdown
  no switchport
  channel-group 100 mode active
  mac security profile MKA_AES_256
!
interface Ethernet48
  description PE-PE:TPA-TRX1-CRO-PE2:Eth48
  no shutdown
  no switchport
  channel-group 100 mode active
  mac security profile MKA_AES_256
!
interface Ethernet49/1
  description PE-CE:TPA-UI1-CRO-N1:Eth1/1
  no shutdown
  no switchport
!
interface Ethernet49/1.2020
  description PE-CE:TPA-UI1-CRO-N1:Eth1/1.2020
  encapsulation dot1q vlan 2020
  vrf USX1
  ip address 10.49.30.0/31
  ip access-group ACL_RO_TRAFFIC_INBOUND in
!
interface Ethernet49/1.2820
  description PE-CE:TPA-UI1-CRO-N1:Eth1/1.2820
  encapsulation dot1q vlan 2820
  vrf USUNT1
  ip address 10.111.124.32/31
!
interface Ethernet49/2
  no shutdown
  no switchport
!
interface Ethernet49/3
  no shutdown
  no switchport
!
interface Ethernet49/4
  no shutdown
  no switchport
!
interface Ethernet50/1
  description PE-CE:TPA-UI1-CRO-N2:Eth1/1
  no shutdown
  no switchport
!
interface Ethernet50/1.2020
  description PE-CE:TPA-UI1-CRO-N2:Eth1/1.2020
  encapsulation dot1q vlan 2020
  vrf USX1
  ip address 10.49.30.2/31
  ip access-group ACL_RO_TRAFFIC_INBOUND in
!
interface Ethernet50/1.2820
  description PE-CE:TPA-UI1-CRO-N2:Eth1/1.2820
  encapsulation dot1q vlan 2820
  vrf USUNT1
  ip address 10.111.124.34/31
!
interface Ethernet50/2
  no shutdown
  no switchport
!
interface Ethernet50/3
  no shutdown
  no switchport
!
interface Ethernet50/4
  no shutdown
  no switchport
!
interface Ethernet51/1
  description PE-CE:TPA-OB1-CRO-N1:Eth53/1
  no shutdown
  no switchport
  vrf OB1
  ip address 10.9.183.36/31
!
interface Ethernet51/2
  no shutdown
  no switchport
!
interface Ethernet51/3
  no shutdown
  no switchport
!
interface Ethernet51/4
  no shutdown
  no switchport
!
interface Ethernet52/1
  description PE-CE:TPA-OB1-CRO-N2:Eth53/1
  no shutdown
  no switchport
  vrf OB1
  ip address 10.9.183.38/31
!
interface Ethernet52/2
  no shutdown
  no switchport
!
interface Ethernet52/3
  no shutdown
  no switchport
!
interface Ethernet52/4
  no shutdown
  no switchport
!
interface Ethernet53/1
  description PE-CE:TPA-TSC1H01-CRA02S-N1:Et7/1
  shutdown
  no switchport
!
interface Ethernet53/1.3001
  description PE-CE:TPA-TSC1H01-CRA02S-N1:Et7/1.3001:IDTN
  ip address 10.62.0.0/31
!
interface Ethernet53/2
  shutdown
  no switchport
!
interface Ethernet53/3
  shutdown
  no switchport
!
interface Ethernet53/4
  shutdown
  no switchport
!
interface Ethernet54/1
  description PE-CE:TPA-TSC1H01-CRA02S-N2:Et7/1
  shutdown
  no switchport
!
interface Ethernet54/1.3001
  description PE-CE:TPA-TSC1H01-CRA02S-N2:Et7/1.3001:IDTN
  ip address 10.62.0.4/31
!
interface Ethernet54/2
  shutdown
  no switchport
!
interface Ethernet54/3
  shutdown
  no switchport
!
interface Ethernet54/4
  shutdown
  no switchport
!
interface Ethernet55/1
  shutdown
  no switchport
!
interface Ethernet55/2
  shutdown
  no switchport
!
interface Ethernet55/3
  shutdown
  no switchport
!
interface Ethernet55/4
  shutdown
  no switchport
!
interface Ethernet56/1
  shutdown
  no switchport
!
interface Ethernet56/2
  shutdown
  no switchport
!
interface Ethernet56/3
  shutdown
  no switchport
!
interface Ethernet56/4
  shutdown
  no switchport
!
interface Loopback0
  description MPLS_Overlay_peering
  ip address 10.199.0.44/32
  ip ospf area 0.0.0.0
!
interface Management1
  description oob_management
  no shutdown
  vrf MGMT
  ip address 10.9.181.226/28
!
ip access-list ACL_RO_TRAFFIC_INBOUND
  10 permit ip 10.0.0.0/8 any
  20 deny ip any any
!
ip access-list SSH_ACCESS
  10 permit tcp 10.0.0.0/8 any eq ssh
  20 permit tcp 172.16.0.0/12 any eq ssh
  30 permit tcp 167.24.0.0/16 any eq ssh
  40 permit tcp 192.168.0.0/16 any eq ssh
  50 permit tcp 198.148.150.0/24 any eq ssh
!
ip routing
no ip routing vrf MGMT
ip routing vrf OB1
ip routing vrf USUNT1
ip routing vrf USX1
!
ip prefix-list PL_DEFAULT seq 10 permit 0.0.0.0/0
ip prefix-list PL_RFC1918 seq 20 permit 10.0.0.0/8
ip prefix-list PL_RFC1918 seq 30 permit 172.16.0.0/12
ip prefix-list PL_RFC1918 seq 40 permit 192.168.0.0/16
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
!
ip route vrf MGMT 0.0.0.0/0 10.9.181.225
!
arp aging timeout default 900
!
mpls ip
!
mpls ldp
  router-id interface Loopback0
  no shutdown
!
ip ssh client source-interface Management1 vrf MGMT
!
route-map DENY_ALL deny 10
!
route-map PASS_ALL permit 10
!
route-map PASS_DEFAULT_ONLY permit 10
  match ip address prefix-list PL_DEFAULT

!
route-map PREF_DEFAULT_IMPORT_MAP permit 900
  description Standard import map to allow All routes
!
route-map RM_CE_OB1_IN permit 10
!
route-map RM_CE_OB1_OUT permit 10
!
route-map RM_CE_UNTRUST_IN permit 10
!
route-map RM_CE_UNTRUST_OUT permit 10
!
route-map RM_FILTERED_TRUST_OUT permit 10
  match ip address prefix-list PL_DEFAULT
!
route-map RM_FILTERED_TRUST_OUT permit 20
  match ip address prefix-list PL_RFC1918
!
route-map RM_RO_TRUST_IN permit 10
  match community POLICY_LP190_OVERRIDE
  set local-preference 190
!
route-map RM_RO_TRUST_IN permit 20
  match community POLICY_LP120
  set local-preference 120
!
route-map RM_RO_TRUST_IN permit 30
  match community POLICY_LP150
  set local-preference 150
!
route-map RM_RO_TRUST_IN permit 40
  match community POLICY_LP170
  set local-preference 170
!
route-map RM_RO_TRUST_IN permit 50
  match community POLICY_LP180
  set local-preference 180
!
route-map RM_RO_TRUST_IN permit 60
  match community PE1
  set local-preference 120
!
route-map RM_RO_TRUST_IN permit 80
!
route-map RM_RO_TRUST_OUT permit 10
  match ip address prefix-list PL_DEFAULT
  set community 64800:1 additive
!
route-map RM_RO_TRUST_OUT permit 20
  match ip address prefix-list PL_RFC1918
  set community 64800:1 additive
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
router bgp 64800
  router-id 10.199.0.44
  update wait-install
  no bgp default ipv4-unicast
  distance bgp 20 200 200
  maximum-paths 2 ecmp 2
  bgp bestpath tie-break router-id
  neighbor IDTN-CE peer group
  neighbor PE_CE_IDTN peer group
  neighbor PE_CE_IDTN remote-as 64631
  neighbor PE_CE_OB1 peer group
  neighbor PE_CE_OB1 remote-as 64907
  neighbor PE_CE_OB1 bfd
  neighbor PE_CE_OB1 route-map RM_CE_OB1_IN in
  neighbor PE_CE_OB1 route-map RM_CE_OB1_OUT out
  neighbor PE_CE_OB1 password 7 LrxdPchq0LiOI2Jz39Pe5Q==
  neighbor PE_CE_OB1 send-community
  neighbor PE_CE_USUNT1 peer group
  neighbor PE_CE_USUNT1 remote-as 64753
  neighbor PE_CE_USUNT1 bfd
  neighbor PE_CE_USUNT1 route-map RM_CE_UNTRUST_IN in
  neighbor PE_CE_USUNT1 route-map RM_CE_UNTRUST_OUT out
  neighbor PE_CE_USUNT1 password 7 w0VhJ31l/4hvhNMZ8pgI2g==
  neighbor PE_CE_USUNT1 send-community
  neighbor PE_CE_USX1 peer group
  neighbor PE_CE_USX1 remote-as 64753
  neighbor PE_CE_USX1 bfd
  neighbor PE_CE_USX1 route-map RM_RO_TRUST_IN in
  neighbor PE_CE_USX1 route-map RM_RO_TRUST_OUT out
  neighbor PE_CE_USX1 password 7 /LMqBWdOHfjalXup2w+BeA==
  neighbor PE_CE_USX1 send-community
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
    neighbor PE_CE_USUNT1 activate
    neighbor PE_CE_USX1 activate
  !
  address-family vpn-ipv4
    neighbor RR_PEERS activate
    no neighbor default encapsulation mpls next-hop-self source-interface Loopback0
  !
  vrf IDTN
      rd 10.199.0.44:915
      router-id 10.199.0.44
      neighbor 10.62.0.1 peer group IDTN-CE
      neighbor 10.62.0.1 description TPA-TSC1H01-CRA02S-N1:IDTN
      neighbor 10.62.0.5 peer group IDTN-CE
      neighbor 10.62.0.5 description TPA-TSC1H01-CRA02S-N2:IDTN
  !
  vrf OB1
      rd 10.199.0.44:900
      route-target import vpn-ipv4 64800:900
      route-target import vpn-ipv4 64801:900101
      route-target export vpn-ipv4 64800:900
      router-id 10.199.0.44
      maximum-paths 2 ecmp 2
      neighbor 10.9.183.37 peer group PE_CE_OB1
      neighbor 10.9.183.37 description OB1-N1:OB1
      neighbor 10.9.183.39 peer group PE_CE_OB1
      neighbor 10.9.183.39 description OB1-N2:OB1
  !
  vrf USUNT1
      rd 10.199.0.44:911
      route-target import vpn-ipv4 64535:91102
      route-target import vpn-ipv4 64800:911
      route-target import vpn-ipv4 64811:911
      route-target import vpn-ipv4 64812:911
      route-target import vpn-ipv4 64813:911
      route-target import vpn-ipv4 65420:91111
      route-target import vpn-ipv4 65500:911
      route-target export vpn-ipv4 64800:912
      router-id 10.199.0.44
      maximum-paths 2 ecmp 2
      neighbor 10.111.124.33 peer group PE_CE_USUNT1
      neighbor 10.111.124.33 description UI1-N1:USUNT1
      neighbor 10.111.124.35 peer group PE_CE_USUNT1
      neighbor 10.111.124.35 description UI1-N2:USUNT1
  !
  vrf USX1
      rd 10.199.0.44:914
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
      route-target import vpn-ipv4 65011:90201
      route-target import vpn-ipv4 65210:90111
      route-target import vpn-ipv4 65215:90113
      route-target import vpn-ipv4 65354:949
      route-target export vpn-ipv4 64800:914
      route-target import vpn-ipv4 route-map PREF_DEFAULT_IMPORT_MAP
      router-id 10.199.0.44
      maximum-paths 2 ecmp 2
      neighbor 10.49.30.1 peer group PE_CE_USX1
      neighbor 10.49.30.1 description UI1-N1:USX1
      neighbor 10.49.30.3 peer group PE_CE_USX1
      neighbor 10.49.30.3 description UI1-N2:USX1
!
router ospf 64800
  router-id 10.199.0.44
  auto-cost reference-bandwidth 1000000
  bfd default
  max-lsa 0
!
ip tacacs vrf MGMT source-interface Management1
!
management ssh
ip access-group SSH_ACCESS vrf MGMT in
idle-timeout 10
authentication mode password
!
vrf MGMT
  no shutdown
```
