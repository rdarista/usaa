# ATL-TRX1-DC1-P1

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
| Management1 | oob_management | oob | MGMT | 10.13.81.232/24 | - |

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
   ip address 10.13.81.232/24
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
| local | 290b8e69d5b555cf96a44cf80bee0551537e3aef | - | - |

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
| NETSVC_NETBRAIN_TEST | READONLY | v3 | sha | aes | - | - | 290b8e69d5b555cf96a44cf80bee0551537e3aef |
| NETSVC_NETBRAIN | READONLY | v3 | sha | aes | - | - | 290b8e69d5b555cf96a44cf80bee0551537e3aef |
| SERVICENOW | READONLY | v3 | sha | aes | - | - | 290b8e69d5b555cf96a44cf80bee0551537e3aef |
| NETSVC_SPECTRUM | READONLY | v3 | sha | aes | - | - | 290b8e69d5b555cf96a44cf80bee0551537e3aef |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 290b8e69d5b555cf96a44cf80bee0551537e3aef
snmp-server contact nsho_provider_networks
snmp-server location ATL
snmp-server vrf MGMT local-interface Management1
snmp-server view READALL ISO included
snmp-server group READONLY v3 priv read READALL
snmp-server user NETSVC_NETBRAIN_TEST READONLY v3 localized 290b8e69d5b555cf96a44cf80bee0551537e3aef auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETBRAIN READONLY v3 localized 290b8e69d5b555cf96a44cf80bee0551537e3aef auth sha <removed> priv aes <removed>
snmp-server user SERVICENOW READONLY v3 localized 290b8e69d5b555cf96a44cf80bee0551537e3aef auth sha <removed> priv aes <removed>
snmp-server user NETSVC_SPECTRUM READONLY v3 localized 290b8e69d5b555cf96a44cf80bee0551537e3aef auth sha <removed> priv aes <removed>
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

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet1/1 |  - | access | - | - | - | - |
| Ethernet1/2 |  - | access | - | - | - | - |
| Ethernet1/3 |  - | access | - | - | - | - |
| Ethernet1/4 |  - | access | - | - | - | - |
| Ethernet2/1 |  - | access | - | - | - | - |
| Ethernet2/2 |  - | access | - | - | - | - |
| Ethernet2/3 |  - | access | - | - | - | - |
| Ethernet2/4 |  - | access | - | - | - | - |
| Ethernet3/1 |  - | access | - | - | - | - |
| Ethernet3/2 |  - | access | - | - | - | - |
| Ethernet3/3 |  - | access | - | - | - | - |
| Ethernet3/4 |  - | access | - | - | - | - |
| Ethernet4/1 |  - | access | - | - | - | - |
| Ethernet4/2 |  - | access | - | - | - | - |
| Ethernet4/3 |  - | access | - | - | - | - |
| Ethernet4/4 |  - | access | - | - | - | - |
| Ethernet5/1 |  - | access | - | - | - | - |
| Ethernet5/2 |  - | access | - | - | - | - |
| Ethernet5/3 |  - | access | - | - | - | - |
| Ethernet5/4 |  - | access | - | - | - | - |
| Ethernet6/1 |  - | access | - | - | - | - |
| Ethernet6/2 |  - | access | - | - | - | - |
| Ethernet6/3 |  - | access | - | - | - | - |
| Ethernet6/4 |  - | access | - | - | - | - |
| Ethernet7/1 |  - | access | - | - | - | - |
| Ethernet7/2 |  - | access | - | - | - | - |
| Ethernet7/3 |  - | access | - | - | - | - |
| Ethernet7/4 |  - | access | - | - | - | - |
| Ethernet8/1 |  - | access | - | - | - | - |
| Ethernet8/2 |  - | access | - | - | - | - |
| Ethernet8/3 |  - | access | - | - | - | - |
| Ethernet8/4 |  - | access | - | - | - | - |
| Ethernet9/1 |  - | access | - | - | - | - |
| Ethernet9/2 |  - | access | - | - | - | - |
| Ethernet9/3 |  - | access | - | - | - | - |
| Ethernet9/4 |  - | access | - | - | - | - |
| Ethernet10/1 |  - | access | - | - | - | - |
| Ethernet10/2 |  - | access | - | - | - | - |
| Ethernet10/3 |  - | access | - | - | - | - |
| Ethernet10/4 |  - | access | - | - | - | - |
| Ethernet11/1 |  - | access | - | - | - | - |
| Ethernet11/2 |  - | access | - | - | - | - |
| Ethernet11/3 |  - | access | - | - | - | - |
| Ethernet11/4 |  - | access | - | - | - | - |
| Ethernet12/1 |  - | access | - | - | - | - |
| Ethernet12/2 |  - | access | - | - | - | - |
| Ethernet12/3 |  - | access | - | - | - | - |
| Ethernet12/4 |  - | access | - | - | - | - |
| Ethernet13/1 |  - | access | - | - | - | - |
| Ethernet13/2 |  - | access | - | - | - | - |
| Ethernet13/3 |  - | access | - | - | - | - |
| Ethernet13/4 |  - | access | - | - | - | - |
| Ethernet14/1 |  - | access | - | - | - | - |
| Ethernet14/2 |  - | access | - | - | - | - |
| Ethernet14/3 |  - | access | - | - | - | - |
| Ethernet14/4 |  - | access | - | - | - | - |
| Ethernet15/1 |  - | access | - | - | - | - |
| Ethernet15/2 |  - | access | - | - | - | - |
| Ethernet15/3 |  - | access | - | - | - | - |
| Ethernet15/4 |  - | access | - | - | - | - |
| Ethernet16/1 |  - | access | - | - | - | - |
| Ethernet16/2 |  - | access | - | - | - | - |
| Ethernet16/3 |  - | access | - | - | - | - |
| Ethernet16/4 |  - | access | - | - | - | - |
| Ethernet17/1 |  - | access | - | - | - | - |
| Ethernet17/2 |  - | access | - | - | - | - |
| Ethernet17/3 |  - | access | - | - | - | - |
| Ethernet17/4 |  - | access | - | - | - | - |
| Ethernet18/1 |  - | access | - | - | - | - |
| Ethernet18/2 |  - | access | - | - | - | - |
| Ethernet18/3 |  - | access | - | - | - | - |
| Ethernet18/4 |  - | access | - | - | - | - |
| Ethernet19/1 |  - | access | - | - | - | - |
| Ethernet19/2 |  - | access | - | - | - | - |
| Ethernet19/3 |  - | access | - | - | - | - |
| Ethernet19/4 |  - | access | - | - | - | - |
| Ethernet20/1 |  - | access | - | - | - | - |
| Ethernet20/2 |  - | access | - | - | - | - |
| Ethernet20/3 |  - | access | - | - | - | - |
| Ethernet20/4 |  - | access | - | - | - | - |
| Ethernet21/1 |  - | access | - | - | - | - |
| Ethernet21/2 |  - | access | - | - | - | - |
| Ethernet21/3 |  - | access | - | - | - | - |
| Ethernet21/4 |  - | access | - | - | - | - |
| Ethernet22/1 |  - | access | - | - | - | - |
| Ethernet22/2 |  - | access | - | - | - | - |
| Ethernet22/3 |  - | access | - | - | - | - |
| Ethernet22/4 |  - | access | - | - | - | - |
| Ethernet23/1 |  - | access | - | - | - | - |
| Ethernet23/2 |  - | access | - | - | - | - |
| Ethernet23/3 |  - | access | - | - | - | - |
| Ethernet23/4 |  - | access | - | - | - | - |
| Ethernet24/1 |  - | access | - | - | - | - |
| Ethernet24/2 |  - | access | - | - | - | - |
| Ethernet24/3 |  - | access | - | - | - | - |
| Ethernet24/4 |  - | access | - | - | - | - |
| Ethernet25/2 |  - | access | - | - | - | - |
| Ethernet25/3 |  - | access | - | - | - | - |
| Ethernet25/4 |  - | access | - | - | - | - |
| Ethernet26/2 |  - | access | - | - | - | - |
| Ethernet26/3 |  - | access | - | - | - | - |
| Ethernet26/4 |  - | access | - | - | - | - |
| Ethernet27/1 |  - | access | - | - | - | - |
| Ethernet27/2 |  - | access | - | - | - | - |
| Ethernet27/3 |  - | access | - | - | - | - |
| Ethernet27/4 |  - | access | - | - | - | - |
| Ethernet28/1 |  - | access | - | - | - | - |
| Ethernet28/2 |  - | access | - | - | - | - |
| Ethernet28/3 |  - | access | - | - | - | - |
| Ethernet28/4 |  - | access | - | - | - | - |
| Ethernet29/1 |  - | access | - | - | - | - |
| Ethernet29/2 |  - | access | - | - | - | - |
| Ethernet29/3 |  - | access | - | - | - | - |
| Ethernet29/4 |  - | access | - | - | - | - |
| Ethernet30/1 |  - | access | - | - | - | - |
| Ethernet30/2 |  - | access | - | - | - | - |
| Ethernet30/3 |  - | access | - | - | - | - |
| Ethernet31/2 |  - | access | - | - | - | - |
| Ethernet31/3 |  - | access | - | - | - | - |
| Ethernet31/4 |  - | access | - | - | - | - |
| Ethernet33/1 |  - | access | - | - | - | - |
| Ethernet33/2 |  - | access | - | - | - | - |
| Ethernet33/3 |  - | access | - | - | - | - |
| Ethernet33/4 |  - | access | - | - | - | - |
| Ethernet33/5 |  - | access | - | - | - | - |
| Ethernet33/6 |  - | access | - | - | - | - |
| Ethernet33/7 |  - | access | - | - | - | - |
| Ethernet33/8 |  - | access | - | - | - | - |
| Ethernet34/1 |  - | access | - | - | - | - |
| Ethernet34/2 |  - | access | - | - | - | - |
| Ethernet34/3 |  - | access | - | - | - | - |
| Ethernet34/4 |  - | access | - | - | - | - |
| Ethernet34/5 |  - | access | - | - | - | - |
| Ethernet34/6 |  - | access | - | - | - | - |
| Ethernet34/7 |  - | access | - | - | - | - |
| Ethernet34/8 |  - | access | - | - | - | - |
| Ethernet35/1 |  - | access | - | - | - | - |
| Ethernet35/2 |  - | access | - | - | - | - |
| Ethernet35/3 |  - | access | - | - | - | - |
| Ethernet35/4 |  - | access | - | - | - | - |
| Ethernet35/5 |  - | access | - | - | - | - |
| Ethernet35/6 |  - | access | - | - | - | - |
| Ethernet35/7 |  - | access | - | - | - | - |
| Ethernet35/8 |  - | access | - | - | - | - |
| Ethernet36/1 |  - | access | - | - | - | - |
| Ethernet36/2 |  - | access | - | - | - | - |
| Ethernet36/3 |  - | access | - | - | - | - |
| Ethernet36/4 |  - | access | - | - | - | - |
| Ethernet36/5 |  - | access | - | - | - | - |
| Ethernet36/6 |  - | access | - | - | - | - |
| Ethernet36/7 |  - | access | - | - | - | - |
| Ethernet36/8 |  - | access | - | - | - | - |

*Inherited from Port-Channel Interface

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet1/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet1/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet1/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet2/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet2/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet2/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet2/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet3/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet3/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet3/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet3/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet4/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet4/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet4/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet4/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet5/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet5/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet5/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet5/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet6/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet6/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet6/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet6/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet7/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet7/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet7/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet7/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet8/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet8/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet8/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet8/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet9/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet9/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet9/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet9/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet10/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet10/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet10/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet10/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet11/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet11/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet11/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet11/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet12/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet12/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet12/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet12/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet13/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet13/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet13/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet13/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet14/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet14/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet14/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet14/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet15/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet15/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet15/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet15/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet16/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet16/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet16/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet16/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet17/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet17/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet17/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet17/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet18/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet18/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet18/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet18/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet19/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet19/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet19/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet19/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet20/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet20/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet20/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet20/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet21/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet21/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet21/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet21/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet22/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet22/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet22/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet22/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet23/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet23/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet23/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet23/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet24/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet24/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet24/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet24/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet25/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet25/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet25/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet26/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet26/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet26/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet27/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet27/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet27/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet27/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet28/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet28/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet28/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet28/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet29/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet29/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet29/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet29/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet30/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet30/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet30/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet31/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet31/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet31/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet33/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet33/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet33/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet33/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet33/5
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet33/6
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet33/7
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet33/8
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet34/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet34/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet34/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet34/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet34/5
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet34/6
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet34/7
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet34/8
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet35/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet35/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet35/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet35/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet35/5
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet35/6
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet35/7
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet35/8
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet36/1
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet36/2
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet36/3
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet36/4
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet36/5
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet36/6
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet36/7
   no shutdown
   switchport
   no switchport shutdown
!
interface Ethernet36/8
   no shutdown
   switchport
   no switchport shutdown
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | LSR_Router_ID | default | 10.199.0.40/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | LSR_Router_ID | default | - |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description LSR_Router_ID
   no shutdown
   ip address 10.199.0.40/32
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
| 64800 | 10.199.0.40 | disabled |- | enabled | 0 | disabled | disabled | 1000000 | - | - | - |

#### OSPF Interfaces

| Interface | Area | Cost | Point To Point |
| -------- | -------- | -------- | -------- |
| Loopback0 | 0.0.0.0 | - | - |

#### Router OSPF Device Configuration

```eos
!
router ospf 64800
   router-id 10.199.0.40
   bfd default
   max-lsa 0
   auto-cost reference-bandwidth 1000000
```

### Router BGP

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| - | - |

#### Router BGP Device Configuration

```eos
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
!
{{MAC_SEC}}
!
{{VRF_DEFINITION}}
!
{{INTERFACE_CONFIG}}
!
{{MPLS_DEFAULTS}}
!
{{MGMT_DEFAULTS}}
```
