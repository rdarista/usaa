# TPA-TRX1-CRA2S-PE1

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
| local | 42bfafe31104f1576cfc9783fde88014a22dec0f | - | - |

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
| NETSVC_NETBRAIN_TEST | READONLY | v3 | sha | aes | - | - | 42bfafe31104f1576cfc9783fde88014a22dec0f |
| NETSVC_NETBRAIN | READONLY | v3 | sha | aes | - | - | 42bfafe31104f1576cfc9783fde88014a22dec0f |
| SERVICENOW | READONLY | v3 | sha | aes | - | - | 42bfafe31104f1576cfc9783fde88014a22dec0f |
| NETSVC_SPECTRUM | READONLY | v3 | sha | aes | - | - | 42bfafe31104f1576cfc9783fde88014a22dec0f |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 42bfafe31104f1576cfc9783fde88014a22dec0f
snmp-server contact nsho_provider_networks
snmp-server location TPA
snmp-server vrf MGMT local-interface Management1
snmp-server view READALL ISO included
snmp-server group READONLY v3 priv read READALL
snmp-server user NETSVC_NETBRAIN_TEST READONLY v3 localized 42bfafe31104f1576cfc9783fde88014a22dec0f auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETBRAIN READONLY v3 localized 42bfafe31104f1576cfc9783fde88014a22dec0f auth sha <removed> priv aes <removed>
snmp-server user SERVICENOW READONLY v3 localized 42bfafe31104f1576cfc9783fde88014a22dec0f auth sha <removed> priv aes <removed>
snmp-server user NETSVC_SPECTRUM READONLY v3 localized 42bfafe31104f1576cfc9783fde88014a22dec0f auth sha <removed> priv aes <removed>
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
| Ethernet1 |  - | access | - | - | - | - |
| Ethernet2 |  - | access | - | - | - | - |
| Ethernet3 |  - | access | - | - | - | - |
| Ethernet4 |  - | access | - | - | - | - |
| Ethernet5 |  - | access | - | - | - | - |
| Ethernet6 |  - | access | - | - | - | - |
| Ethernet7 |  - | access | - | - | - | - |
| Ethernet8 |  - | access | - | - | - | - |
| Ethernet9 |  - | access | - | - | - | - |
| Ethernet10 |  - | access | - | - | - | - |
| Ethernet12 |  - | access | - | - | - | - |
| Ethernet13 |  - | access | - | - | - | - |
| Ethernet14 |  - | access | - | - | - | - |
| Ethernet15 |  - | access | - | - | - | - |
| Ethernet16 |  - | access | - | - | - | - |
| Ethernet17 |  - | access | - | - | - | - |
| Ethernet18 |  - | access | - | - | - | - |
| Ethernet19 |  - | access | - | - | - | - |
| Ethernet20 |  - | access | - | - | - | - |
| Ethernet21 |  - | access | - | - | - | - |
| Ethernet22 |  - | access | - | - | - | - |
| Ethernet23 |  - | access | - | - | - | - |
| Ethernet24 |  - | access | - | - | - | - |
| Ethernet25 |  - | access | - | - | - | - |
| Ethernet26 |  - | access | - | - | - | - |
| Ethernet27 |  - | access | - | - | - | - |
| Ethernet28 |  - | access | - | - | - | - |
| Ethernet29 |  - | access | - | - | - | - |
| Ethernet30 |  - | access | - | - | - | - |
| Ethernet31 |  - | access | - | - | - | - |
| Ethernet32 |  - | access | - | - | - | - |
| Ethernet33 |  - | access | - | - | - | - |
| Ethernet34 |  - | access | - | - | - | - |
| Ethernet35 |  - | access | - | - | - | - |
| Ethernet38 |  - | access | - | - | - | - |
| Ethernet39 |  - | access | - | - | - | - |
| Ethernet40 |  - | access | - | - | - | - |
| Ethernet41 |  - | access | - | - | - | - |
| Ethernet42 |  - | access | - | - | - | - |
| Ethernet43 |  - | access | - | - | - | - |
| Ethernet44 |  - | access | - | - | - | - |
| Ethernet49/2 |  - | access | - | - | - | - |
| Ethernet49/3 |  - | access | - | - | - | - |
| Ethernet49/4 |  - | access | - | - | - | - |
| Ethernet50/2 |  - | access | - | - | - | - |
| Ethernet50/3 |  - | access | - | - | - | - |
| Ethernet50/4 |  - | access | - | - | - | - |
| Ethernet51/2 |  - | access | - | - | - | - |
| Ethernet51/3 |  - | access | - | - | - | - |
| Ethernet51/4 |  - | access | - | - | - | - |
| Ethernet52/2 |  - | access | - | - | - | - |
| Ethernet52/3 |  - | access | - | - | - | - |
| Ethernet52/4 |  - | access | - | - | - | - |
| Ethernet53/1 |  - | access | - | - | - | - |
| Ethernet53/2 |  - | access | - | - | - | - |
| Ethernet53/3 |  - | access | - | - | - | - |
| Ethernet53/4 |  - | access | - | - | - | - |
| Ethernet54/1 |  - | access | - | - | - | - |
| Ethernet54/2 |  - | access | - | - | - | - |
| Ethernet54/3 |  - | access | - | - | - | - |
| Ethernet54/4 |  - | access | - | - | - | - |
| Ethernet55/1 |  - | access | - | - | - | - |
| Ethernet55/2 |  - | access | - | - | - | - |
| Ethernet55/3 |  - | access | - | - | - | - |
| Ethernet55/4 |  - | access | - | - | - | - |
| Ethernet56/1 |  - | access | - | - | - | - |
| Ethernet56/2 |  - | access | - | - | - | - |
| Ethernet56/3 |  - | access | - | - | - | - |
| Ethernet56/4 |  - | access | - | - | - | - |

*Inherited from Port-Channel Interface

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet4
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet5
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet6
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet7
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet8
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet9
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet10
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet12
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet13
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet14
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet15
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet16
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet17
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet18
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet19
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet20
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet21
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet22
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet23
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet24
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet25
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet26
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet27
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet28
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet29
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet30
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet31
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet32
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet33
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet34
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet35
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet38
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet39
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet40
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet41
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet42
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet43
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet44
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet49/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet49/3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet49/4
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet50/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet50/3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet50/4
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet51/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet51/3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet51/4
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet52/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet52/3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet52/4
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet53/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet53/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet53/3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet53/4
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet54/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet54/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet54/3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet54/4
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet55/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet55/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet55/3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet55/4
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet56/1
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet56/2
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet56/3
   no shutdown
   switchport
   no switchport
   shutdown
!
interface Ethernet56/4
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

### Static Routes

#### Static Routes Summary

| VRF | Destination Prefix | Next Hop IP | Exit interface | Administrative Distance | Tag | Route Name | Metric |
| --- | ------------------ | ----------- | -------------- | ----------------------- | --- | ---------- | ------ |
| MGMT | 0.0.0.0/0 | 10.9.181.225 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf MGMT 0.0.0.0/0 10.9.181.225
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
| 64800 | 10.199.0.44 | disabled |- | enabled | 0 | disabled | disabled | 1000000 | - | - | - |

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
   max-lsa 0
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

### Route-maps

#### Route-maps Summary

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
| 10 | permit | - | - | - | - |

##### RM_CE_OB1_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | - | - | - |

##### RM_CE_UNTRUST_IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | - | - | - |

##### RM_CE_UNTRUST_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | - | - | - |

##### RM_FILTERED_TRUST_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL_DEFAULT | - | - | - |
| 20 | permit | ip address prefix-list PL_RFC1918 | - | - | - |

##### RM_RO_TRUST_IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | community POLICY_LP190_OVERRIDE | local-preference 190 | - | - |
| 20 | permit | community POLICY_LP120 | local-preference 120 | - | - |
| 30 | permit | community POLICY_LP150 | local-preference 150 | - | - |
| 40 | permit | community POLICY_LP170 | local-preference 170 | - | - |
| 50 | permit | community POLICY_LP180 | local-preference 180 | - | - |
| 60 | permit | community PE1 | local-preference 120 | - | - |
| 80 | permit | - | - | - | - |

##### RM_RO_TRUST_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL_DEFAULT | community 64800:1 additive | - | - |
| 20 | permit | ip address prefix-list PL_RFC1918 | community 64800:1 additive | - | - |

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

##### TEST_RM

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | community TEST_COMM | local-preference 150 | - | - |

#### Route-maps Device Configuration

```eos
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
route-map TEST_RM permit 10
   description THIS IS A TEST AVD ROUTE MAP
   match community TEST_COMM
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
!
vrf instance MGMT
!
vrf instance OB1
!
vrf instance USUNT1
!
vrf instance USX1
!
ip routing
no ip routing vrf MGMT
ip routing vrf OB1
ip routing vrf USUNT1
ip routing vrf USX1
!
!
vrf instance IDTN
!
ip routing vrf IDTN
!
interface Port-Channel11
  description PE-CE:TPA-TSC1H01-CRA02S-N1:Po101
  mtu 9214
  no switchport
!
interface Port-Channel11.3001
  description PE-CE:TPA-TSC1H01-CRA02S-N1:Po101.3001:IDTN
  encapsulation dot1q vlan 3001
  vrf IDTN
  ip address 10.62.0.0/31
!
interface Port-Channel12
  description PE-CE:TPA-TSC1H01-CRA02S-N2:Po101
  mtu 9214
  no switchport
!
interface Port-Channel12.3001
  description PE-CE:TPA-TSC1H01-CRA02S-N2:Po101.3001:IDTN
  encapsulation dot1q vlan 3001
  vrf IDTN
  ip address 10.62.0.4/31
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
interface Ethernet45 
  description PE-CE:TPA-TSC1H01-CRA02S-N1:Et7/1 
  no shutdown 
  mtu 9214 
  no switchport 
  channel-group 11 mode active
!
interface Ethernet46 
  description PE-CE:TPA-TSC1H01-CRA02S-N2:Et7/1 
  no shutdown 
  mtu 9214 
  no switchport 
  channel-group 12 mode active
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
interface Ethernet51/1
  description PE-CE:TPA-OB1-CRO-N1:Eth53/1
  no shutdown
  no switchport
  vrf OB1
  ip address 10.9.183.36/31
!
interface Ethernet52/1
  description PE-CE:TPA-OB1-CRO-N2:Eth53/1
  no shutdown
  no switchport
  vrf OB1
  ip address 10.9.183.38/31
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
  ip address 10.9.181.228/28
!
route-map RO_IDTN_BGP_POLICY_IN permit 20
  match community POLICY_LP190_OVERRIDE
  set local-preference 190
route-map RO_IDTN_BGP_POLICY_IN permit 30
  match community POLICY_LP120
  set local-preference 120
route-map RO_IDTN_BGP_POLICY_IN permit 40
  match community POLICY_LP150
  set local-preference 150
route-map RO_IDTN_BGP_POLICY_IN permit 50
  match community POLICY_LP170
  set local-preference 170
route-map RO_IDTN_BGP_POLICY_IN permit 60
  match community POLICY_LP180
  set local-preference 180
route-map RO_IDTN_BGP_POLICY_IN permit 70
  match community PE1
  set local-preference 120
route-map RO_IDTN_BGP_POLICY_IN permit 80
!
route-map RO_IDTN_BGP_POLICY_OUT permit 10
  set community 64800:1 additive
!
router bgp 64800
  router-id 10.199.0.44
  update wait-install
  no bgp default ipv4-unicast
  distance bgp 20 200 200
  maximum-paths 2 ecmp 2
  bgp bestpath tie-break router-id
  neighbor PE_CE_IDTN peer group
  neighbor PE_CE_IDTN remote-as 64631
  neighbor PE_CE_IDTN bfd
  neighbor PE_CE_IDTN route-map RO_IDTN_BGP_POLICY_IN in
  neighbor PE_CE_IDTN route-map RO_IDTN_BGP_POLICY_OUT out
  neighbor PE_CE_IDTN password 7 M6Lwa/sjANTxFGoc6AZyvA==
  neighbor PE_CE_IDTN send-community
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
  address-family ipv4
  neighbor PE_CE_IDTN activate
  !
  vrf IDTN
  rd 10.199.0.44:990
  route-target import vpn-ipv4 64526:990
  route-target import vpn-ipv4 64689:990
  route-target import vpn-ipv4 64753:990
  route-target import vpn-ipv4 64800:990
  route-target import vpn-ipv4 64811:990
  route-target import vpn-ipv4 65425:990
  route-target export vpn-ipv4 64800:990
  router-id 10.199.0.44
  neighbor 10.62.0.1 peer group PE_CE_IDTN
  neighbor 10.62.0.1 description TPA-TSC1H01-CRA02S-N1:IDTN
  neighbor 10.62.0.5 peer group PE_CE_IDTN
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
management ssh
ip access-group SSH_ACCESS vrf MGMT in
idle-timeout 10
authentication mode password
!
vrf MGMT
  no shutdown
```
