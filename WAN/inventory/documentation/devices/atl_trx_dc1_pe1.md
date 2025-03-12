# ATL_TRX_DC1_PE1

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
  - [Port-Channel Interfaces](#port-channel-interfaces)
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
| local | 9e053c85167ef4b9835b66d280f13688729785ea | - | - |

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
| NETSVC_NETBRAIN_TEST | READONLY | v3 | sha | aes | - | - | 9e053c85167ef4b9835b66d280f13688729785ea |
| NETSVC_NETBRAIN | READONLY | v3 | sha | aes | - | - | 9e053c85167ef4b9835b66d280f13688729785ea |
| SERVICENOW | READONLY | v3 | sha | aes | - | - | 9e053c85167ef4b9835b66d280f13688729785ea |
| NETSVC_NETSCOUT | READONLY | v3 | sha | aes | - | - | 9e053c85167ef4b9835b66d280f13688729785ea |
| NETSVC_SPECTRUM | READONLY | v3 | sha | aes | - | - | 9e053c85167ef4b9835b66d280f13688729785ea |
| sdadmin | CAPC | v3 | md5 | - | - | - | 9e053c85167ef4b9835b66d280f13688729785ea |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 9e053c85167ef4b9835b66d280f13688729785ea
snmp-server contact nsho_provider_networks
snmp-server location ATL
snmp-server vrf MGMT local-interface Management1
snmp-server view READALL ISO included
snmp-server group READONLY v3 priv read READALL
snmp-server user NETSVC_NETBRAIN_TEST READONLY v3 localized 9e053c85167ef4b9835b66d280f13688729785ea auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETBRAIN READONLY v3 localized 9e053c85167ef4b9835b66d280f13688729785ea auth sha <removed> priv aes <removed>
snmp-server user SERVICENOW READONLY v3 localized 9e053c85167ef4b9835b66d280f13688729785ea auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETSCOUT READONLY v3 localized 9e053c85167ef4b9835b66d280f13688729785ea auth sha <removed> priv aes <removed>
snmp-server user NETSVC_SPECTRUM READONLY v3 localized 9e053c85167ef4b9835b66d280f13688729785ea auth sha <removed> priv aes <removed>
snmp-server user sdadmin CAPC v3 localized 9e053c85167ef4b9835b66d280f13688729785ea auth md5 <removed>
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

*Inherited from Port-Channel Interface

##### Encapsulation Dot1q Interfaces

| Interface | Description | Type | Vlan ID | Dot1q VLAN Tag |
| --------- | ----------- | -----| ------- | -------------- |
| Port-Channel110.2001 | PE-CE:ATL-SI1-DC1-N1 | l3dot1q | - | 2001 |
| Port-Channel110.2004 | PE-CE:ATL-SI1-DC1-N2 | l3dot1q | - | 2004 |
| Port-Channel111.2001 | PE-CE:ATL-SI1-DC1-N2 | l3dot1q | - | 2001 |
| Port-Channel111.2004 | PE-CE:ATL-SI1-DC1-N2 | l3dot1q | - | 2004 |
| Port-Channel114.2001 | PE-CE:ATL-ST1-DC1-N1 | l3dot1q | - | 2001 |
| Port-Channel115.2001 | PE-CE:ATL-ST1-DC1-N2 | l3dot1q | - | 2001 |
| Port-Channel116.2001 | PE-CE:ATL-SOB1-DC1-N1 | l3dot1q | - | 2001 |
| Port-Channel117.2001 | PE-CE:ATL-SOB1-DC1-N2 | l3dot1q | - | 2001 |
| Port-Channel211.2001 | PE-CE:ATL-SE1-DC1-N1 | l3dot1q | - | 2001 |
| Port-Channel211.2004 | PE-CE:ATL-SE1-DC1-N1 | l3dot1q | - | 2004 |
| Port-Channel211.2005 | PE-CE:ATL-SE1-DC1-N1 | l3dot1q | - | 2005 |
| Port-Channel211.2006 | PE-CE:ATL-SE1-DC1-N2 | l3dot1q | - | 2006 |
| Port-Channel212.2001 | PE-CE:ATL-SE1-DC1-N2 | l3dot1q | - | 2001 |
| Port-Channel212.2004 | PE-CE:ATL-SE1-DC1-N2 | l3dot1q | - | 2004 |
| Port-Channel212.2005 | PE-CE:ATL-SE1-DC1-N2 | l3dot1q | - | 2005 |
| Port-Channel212.2006 | PE-CE:ATL-SE1-DC1-N2 | l3dot1q | - | 2006 |

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet25/1 | P2P_LINK_TO_atl_trx_dc1_p1_Ethernet25/1 | routed | - | 10.199.2.43/31 | default | 1500 | False | - | - |
| Ethernet26/1 | P2P_LINK_TO_atl_trx_dc1_p2_Ethernet25/1 | routed | - | 10.199.2.45/31 | default | 1500 | False | - | - |
| Port-Channel110.2001 | PE-CE:ATL-SI1-DC1-N1 | l3dot1q | - | 10.64.0.0/31 | DCX1 | - | False | - | - |
| Port-Channel110.2004 | PE-CE:ATL-SI1-DC1-N2 | l3dot1q | - | 10.64.0.4/31 | BUSINTEL | - | False | - | - |
| Port-Channel111.2001 | PE-CE:ATL-SI1-DC1-N2 | l3dot1q | - | 10.64.0.20/31 | DCX1 | - | False | - | - |
| Port-Channel111.2004 | PE-CE:ATL-SI1-DC1-N2 | l3dot1q | - | 10.64.0.24/31 | BUSINTEL | - | False | - | - |
| Port-Channel114.2001 | PE-CE:ATL-ST1-DC1-N1 | l3dot1q | - | 10.72.0.0/31 | DCX1 | - | False | - | - |
| Port-Channel115.2001 | PE-CE:ATL-ST1-DC1-N2 | l3dot1q | - | 10.72.0.16/31 | DCX1 | - | False | - | - |
| Port-Channel116.2001 | PE-CE:ATL-SOB1-DC1-N1 | l3dot1q | - | 10.76.0.130/31 | DCX1 | - | False | - | - |
| Port-Channel117.2001 | PE-CE:ATL-SOB1-DC1-N2 | l3dot1q | - | 10.76.0.138/31 | DCX1 | - | False | - | - |
| Port-Channel211.2001 | PE-CE:ATL-SE1-DC1-N1 | l3dot1q | - | 10.77.0.0/31 | DCX1 | - | False | - | - |
| Port-Channel211.2004 | PE-CE:ATL-SE1-DC1-N1 | l3dot1q | - | 10.77.0.4/31 | CCISSUE | - | False | - | - |
| Port-Channel211.2005 | PE-CE:ATL-SE1-DC1-N1 | l3dot1q | - | 10.77.0.6/31 | CCMERCH | - | False | - | - |
| Port-Channel211.2006 | PE-CE:ATL-SE1-DC1-N2 | l3dot1q | - | 10.77.0.8/31 | CCHYBRID | - | False | - | - |
| Port-Channel212.2001 | PE-CE:ATL-SE1-DC1-N2 | l3dot1q | - | 10.77.0.20/31 | DCX1 | - | False | - | - |
| Port-Channel212.2004 | PE-CE:ATL-SE1-DC1-N2 | l3dot1q | - | 10.77.0.24/31 | CCISSUE | - | False | - | - |
| Port-Channel212.2005 | PE-CE:ATL-SE1-DC1-N2 | l3dot1q | - | 10.77.0.26/31 | CCMERCH | - | False | - | - |
| Port-Channel212.2006 | PE-CE:ATL-SE1-DC1-N2 | l3dot1q | - | 10.77.0.28/31 | CCHYBRID | - | False | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1/1
   description P2P_LINK_TO_ATL-SI1-DC1-N1_Ethernet3/14/1
   no shutdown
   channel-group 110 mode active
!
interface Ethernet2/1
   description P2P_LINK_TO_ATL-SI1-DC1-N2_Ethernet3/14/1
   no shutdown
   channel-group 111 mode active
!
interface Ethernet3/1
   description P2P_LINK_TO_ATL-ST1-DC1-N1_Ethernet3/49/1
   no shutdown
   channel-group 114 mode active
!
interface Ethernet4/1
   description P2P_LINK_TO_ATL-ST1-DC1-N2_Ethernet3/49/1
   no shutdown
   channel-group 115 mode active
!
interface Ethernet14/1
   description P2P_LINK_TO_ATL-SE1-DC1-N1_Ethernet49/1
   no shutdown
   channel-group 211 mode active
!
interface Ethernet22/1
   description P2P_LINK_TO_ATL-SE1-DC1-N2_Ethernet49/1
   no shutdown
   channel-group 212 mode active
!
interface Ethernet23/1
   description P2P_LINK_TO_ATL-SOB1-DC1-N1_Ethernet3/49/1
   no shutdown
   channel-group 116 mode active
!
interface Ethernet24/1
   description P2P_LINK_TO_ATL-SOB1-DC1-N2_Ethernet3/49/1
   no shutdown
   channel-group 117 mode active
!
interface Ethernet25/1
   description P2P_LINK_TO_atl_trx_dc1_p1_Ethernet25/1
   no shutdown
   mtu 1500
   mac security profile MKA_AES_256
   no switchport
   ip address 10.199.2.43/31
   mpls ldp interface
   mpls ip
   ip ospf network point-to-point
   ip ospf area 0.0.0.0
   ip ospf authentication message-digest
   ip ospf message-digest-key 1 md5 7 2N0AcrEZMpyItTIpN+dU7Q==

!
interface Ethernet26/1
   description P2P_LINK_TO_atl_trx_dc1_p2_Ethernet25/1
   no shutdown
   mtu 1500
   mac security profile MKA_AES_256
   no switchport
   ip address 10.199.2.45/31
   mpls ldp interface
   mpls ip
   ip ospf network point-to-point
   ip ospf area 0.0.0.0
   ip ospf authentication message-digest
   ip ospf message-digest-key 1 md5 7 2N0AcrEZMpyItTIpN+dU7Q==

!
interface Port-Channel110
   no shutdown
   no switchport
!
interface Port-Channel110.2001
   description PE-CE:ATL-SI1-DC1-N1
   no shutdown
   encapsulation dot1q vlan 2001
   vrf DCX1
   ip address 10.64.0.0/31
!
interface Port-Channel110.2004
   description PE-CE:ATL-SI1-DC1-N2
   no shutdown
   encapsulation dot1q vlan 2004
   vrf BUSINTEL
   ip address 10.64.0.4/31
!
interface Port-Channel111
   no shutdown
   no switchport
!
interface Port-Channel111.2001
   description PE-CE:ATL-SI1-DC1-N2
   no shutdown
   encapsulation dot1q vlan 2001
   vrf DCX1
   ip address 10.64.0.20/31
!
interface Port-Channel111.2004
   description PE-CE:ATL-SI1-DC1-N2
   no shutdown
   encapsulation dot1q vlan 2004
   vrf BUSINTEL
   ip address 10.64.0.24/31
!
interface Port-Channel114
   no shutdown
   no switchport
!
interface Port-Channel114.2001
   description PE-CE:ATL-ST1-DC1-N1
   no shutdown
   encapsulation dot1q vlan 2001
   vrf DCX1
   ip address 10.72.0.0/31
!
interface Port-Channel115
   no shutdown
   no switchport
!
interface Port-Channel115.2001
   description PE-CE:ATL-ST1-DC1-N2
   no shutdown
   encapsulation dot1q vlan 2001
   vrf DCX1
   ip address 10.72.0.16/31
!
interface Port-Channel116
   no shutdown
   no switchport
!
interface Port-Channel116.2001
   description PE-CE:ATL-SOB1-DC1-N1
   no shutdown
   encapsulation dot1q vlan 2001
   vrf DCX1
   ip address 10.76.0.130/31
!
interface Port-Channel117
   no shutdown
   no switchport
!
interface Port-Channel117.2001
   description PE-CE:ATL-SOB1-DC1-N2
   no shutdown
   encapsulation dot1q vlan 2001
   vrf DCX1
   ip address 10.76.0.138/31
!
interface Port-Channel211
   no shutdown
   no switchport
!
interface Port-Channel211.2001
   description PE-CE:ATL-SE1-DC1-N1
   no shutdown
   encapsulation dot1q vlan 2001
   vrf DCX1
   ip address 10.77.0.0/31
!
interface Port-Channel211.2004
   description PE-CE:ATL-SE1-DC1-N1
   no shutdown
   encapsulation dot1q vlan 2004
   vrf CCISSUE
   ip address 10.77.0.4/31
!
interface Port-Channel211.2005
   description PE-CE:ATL-SE1-DC1-N1
   no shutdown
   encapsulation dot1q vlan 2005
   vrf CCMERCH
   ip address 10.77.0.6/31
!
interface Port-Channel211.2006
   description PE-CE:ATL-SE1-DC1-N2
   no shutdown
   encapsulation dot1q vlan 2006
   vrf CCHYBRID
   ip address 10.77.0.8/31
!
interface Port-Channel212
   no shutdown
   no switchport
!
interface Port-Channel212.2001
   description PE-CE:ATL-SE1-DC1-N2
   no shutdown
   encapsulation dot1q vlan 2001
   vrf DCX1
   ip address 10.77.0.20/31
!
interface Port-Channel212.2004
   description PE-CE:ATL-SE1-DC1-N2
   no shutdown
   encapsulation dot1q vlan 2004
   vrf CCISSUE
   ip address 10.77.0.24/31
!
interface Port-Channel212.2005
   description PE-CE:ATL-SE1-DC1-N2
   no shutdown
   encapsulation dot1q vlan 2005
   vrf CCMERCH
   ip address 10.77.0.26/31
!
interface Port-Channel212.2006
   description PE-CE:ATL-SE1-DC1-N2
   no shutdown
   encapsulation dot1q vlan 2006
   vrf CCHYBRID
   ip address 10.77.0.28/31
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel110
   description P2P_LINK_TO_ATL-SI1-DC1-N1_Port-Channel101
   no shutdown
   mtu 1500
   no switchport
!
interface Port-Channel111
   description P2P_LINK_TO_ATL-SI1-DC1-N2_Port-Channel101
   no shutdown
   mtu 1500
   no switchport
!
interface Port-Channel114
   description P2P_LINK_TO_ATL-ST1-DC1-N1_Port-Channel101
   no shutdown
   mtu 1500
   no switchport
!
interface Port-Channel115
   description P2P_LINK_TO_ATL-ST1-DC1-N2_Port-Channel101
   no shutdown
   mtu 1500
   no switchport
!
interface Port-Channel116
   description P2P_LINK_TO_ATL-SOB1-DC1-N1_Port-Channel101
   no shutdown
   mtu 1500
   no switchport
!
interface Port-Channel117
   description P2P_LINK_TO_ATL-SOB1-DC1-N2_Port-Channel101
   no shutdown
   mtu 1500
   no switchport
!
interface Port-Channel211
   description P2P_LINK_TO_ATL-SE1-DC1-N1_Port-Channel101
   no shutdown
   mtu 1500
   no switchport
!
interface Port-Channel212
   description P2P_LINK_TO_ATL-SE1-DC1-N2_Port-Channel101
   no shutdown
   mtu 1500
   no switchport
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
| BUSINTEL | True |
| CCHYBRID | True |
| CCISSUE | True |
| CCMERCH | True |
| DCX1 | True |
| MGMT | False |

#### IP Routing Device Configuration

```eos
!
ip routing
ip routing vrf BUSINTEL
ip routing vrf CCHYBRID
ip routing vrf CCISSUE
ip routing vrf CCMERCH
ip routing vrf DCX1
no ip routing vrf MGMT
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| BUSINTEL | false |
| CCHYBRID | false |
| CCISSUE | false |
| CCMERCH | false |
| DCX1 | false |
| MGMT | false |

### Router OSPF

#### Router OSPF Summary

| Process ID | Router ID | Default Passive Interface | No Passive Interface | BFD | Max LSA | Default Information Originate | Log Adjacency Changes Detail | Auto Cost Reference Bandwidth | Maximum Paths | MPLS LDP Sync Default | Distribute List In |
| ---------- | --------- | ------------------------- | -------------------- | --- | ------- | ----------------------------- | ---------------------------- | ----------------------------- | ------------- | --------------------- | ------------------ |
| 64800 | 10.199.0.28 | disabled |- | enabled | 12000 | disabled | disabled | 1000000 | - | - | - |

#### OSPF Interfaces

| Interface | Area | Cost | Point To Point |
| -------- | -------- | -------- | -------- |
| Ethernet25/1 | 0.0.0.0 | - | True |
| Ethernet26/1 | 0.0.0.0 | - | True |
| Loopback0 | 0.0.0.0 | - | - |

#### Router OSPF Device Configuration

```eos
!
router ospf 64800
   router-id 10.199.0.28
   bfd default
   max-lsa 12000
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

##### PE_CE_DC_OB_SOB_DCX1

| Settings | Value |
| -------- | ----- |
| Remote AS | 65100 |
| BFD | True |
| Send community | standard |

##### PE_CE_DC_PCI_SE_CCHYBRID

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120 |
| BFD | True |
| Send community | standard |

##### PE_CE_DC_PCI_SE_CCISSUE

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120 |
| BFD | True |
| Send community | standard |

##### PE_CE_DC_PCI_SE_CCMERCH

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120 |
| BFD | True |
| Send community | standard |

##### PE_CE_DC_PCI_SE_DCX1

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120 |
| BFD | True |
| Send community | standard |

##### PE_CE_DC_PCI_SE_PEN1

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120 |
| BFD | True |
| Send community | standard |

##### PE_CE_DC_PROD_SI_BUSINTEL

| Settings | Value |
| -------- | ----- |
| Remote AS | 65100 |
| BFD | True |
| Send community | standard |
| Maximum routes | 0 (no limit) |

##### PE_CE_DC_PROD_SI_DCX1

| Settings | Value |
| -------- | ----- |
| Remote AS | 65100 |
| BFD | True |
| Send community | standard |
| Maximum routes | 0 (no limit) |

##### PE_CE_DC_PROD_SI_DMZMEM1

| Settings | Value |
| -------- | ----- |
| Remote AS | 65100 |
| BFD | True |
| Send community | standard |

##### PE_CE_DC_PROD_SI_NCFDMZ

| Settings | Value |
| -------- | ----- |
| Remote AS | 65100 |
| BFD | True |
| Send community | standard |

##### PE_CE_DC_PROD_SI_USX1

| Settings | Value |
| -------- | ----- |
| Remote AS | 65100 |
| BFD | True |
| Send community | standard |

##### PE_CE_DC_TEST_ST_DCX1

| Settings | Value |
| -------- | ----- |
| Remote AS | 65110 |
| BFD | True |
| Send community | standard |

##### PE_CE_DC_TEST_ST_IDTN

| Settings | Value |
| -------- | ----- |
| Remote AS | 65110 |
| BFD | True |
| Send community | standard |

##### PE_CE_DC_TEST_ST_IDTNB2B

| Settings | Value |
| -------- | ----- |
| Remote AS | 65110 |
| BFD | True |
| Send community | standard |

##### PE_CE_DC_TEST_ST_IDTNDX

| Settings | Value |
| -------- | ----- |
| Remote AS | 65110 |
| BFD | True |
| Send community | standard |

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
| 10.64.0.5 | Inherited from peer group PE_CE_DC_PROD_SI_BUSINTEL | BUSINTEL | - | Inherited from peer group PE_CE_DC_PROD_SI_BUSINTEL | Inherited from peer group PE_CE_DC_PROD_SI_BUSINTEL | - | Inherited from peer group PE_CE_DC_PROD_SI_BUSINTEL | - | - | - | - |
| 10.64.0.25 | Inherited from peer group PE_CE_DC_PROD_SI_BUSINTEL | BUSINTEL | - | Inherited from peer group PE_CE_DC_PROD_SI_BUSINTEL | Inherited from peer group PE_CE_DC_PROD_SI_BUSINTEL | - | Inherited from peer group PE_CE_DC_PROD_SI_BUSINTEL | - | - | - | - |
| 10.77.0.9 | Inherited from peer group PE_CE_DC_PCI_SE_CCHYBRID | CCHYBRID | - | Inherited from peer group PE_CE_DC_PCI_SE_CCHYBRID | - | - | Inherited from peer group PE_CE_DC_PCI_SE_CCHYBRID | - | - | - | - |
| 10.77.0.29 | Inherited from peer group PE_CE_DC_PCI_SE_CCHYBRID | CCHYBRID | - | Inherited from peer group PE_CE_DC_PCI_SE_CCHYBRID | - | - | Inherited from peer group PE_CE_DC_PCI_SE_CCHYBRID | - | - | - | - |
| 10.77.0.5 | Inherited from peer group PE_CE_DC_PCI_SE_CCISSUE | CCISSUE | - | Inherited from peer group PE_CE_DC_PCI_SE_CCISSUE | - | - | Inherited from peer group PE_CE_DC_PCI_SE_CCISSUE | - | - | - | - |
| 10.77.0.25 | Inherited from peer group PE_CE_DC_PCI_SE_CCISSUE | CCISSUE | - | Inherited from peer group PE_CE_DC_PCI_SE_CCISSUE | - | - | Inherited from peer group PE_CE_DC_PCI_SE_CCISSUE | - | - | - | - |
| 10.77.0.7 | Inherited from peer group PE_CE_DC_PCI_SE_CCMERCH | CCMERCH | - | Inherited from peer group PE_CE_DC_PCI_SE_CCMERCH | - | - | Inherited from peer group PE_CE_DC_PCI_SE_CCMERCH | - | - | - | - |
| 10.77.0.27 | Inherited from peer group PE_CE_DC_PCI_SE_CCMERCH | CCMERCH | - | Inherited from peer group PE_CE_DC_PCI_SE_CCMERCH | - | - | Inherited from peer group PE_CE_DC_PCI_SE_CCMERCH | - | - | - | - |
| 10.64.0.1 | Inherited from peer group PE_CE_DC_PROD_SI_DCX1 | DCX1 | - | Inherited from peer group PE_CE_DC_PROD_SI_DCX1 | Inherited from peer group PE_CE_DC_PROD_SI_DCX1 | - | Inherited from peer group PE_CE_DC_PROD_SI_DCX1 | - | - | - | - |
| 10.64.0.21 | Inherited from peer group PE_CE_DC_PROD_SI_DCX1 | DCX1 | - | Inherited from peer group PE_CE_DC_PROD_SI_DCX1 | Inherited from peer group PE_CE_DC_PROD_SI_DCX1 | - | Inherited from peer group PE_CE_DC_PROD_SI_DCX1 | - | - | - | - |
| 10.72.0.1 | Inherited from peer group PE_CE_DC_TEST_ST_DCX1 | DCX1 | - | Inherited from peer group PE_CE_DC_TEST_ST_DCX1 | - | - | Inherited from peer group PE_CE_DC_TEST_ST_DCX1 | - | - | - | - |
| 10.72.0.17 | Inherited from peer group PE_CE_DC_TEST_ST_DCX1 | DCX1 | - | Inherited from peer group PE_CE_DC_TEST_ST_DCX1 | - | - | Inherited from peer group PE_CE_DC_TEST_ST_DCX1 | - | - | - | - |
| 10.76.0.131 | Inherited from peer group PE_CE_DC_OB_SOB_DCX1 | DCX1 | - | Inherited from peer group PE_CE_DC_OB_SOB_DCX1 | - | - | Inherited from peer group PE_CE_DC_OB_SOB_DCX1 | - | - | - | - |
| 10.76.0.139 | Inherited from peer group PE_CE_DC_OB_SOB_DCX1 | DCX1 | - | Inherited from peer group PE_CE_DC_OB_SOB_DCX1 | - | - | Inherited from peer group PE_CE_DC_OB_SOB_DCX1 | - | - | - | - |
| 10.77.0.1 | Inherited from peer group PE_CE_DC_PCI_SE_DCX1 | DCX1 | - | Inherited from peer group PE_CE_DC_PCI_SE_DCX1 | - | - | Inherited from peer group PE_CE_DC_PCI_SE_DCX1 | - | - | - | - |
| 10.77.0.21 | Inherited from peer group PE_CE_DC_PCI_SE_DCX1 | DCX1 | - | Inherited from peer group PE_CE_DC_PCI_SE_DCX1 | - | - | Inherited from peer group PE_CE_DC_PCI_SE_DCX1 | - | - | - | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |

#### Router BGP VPN-IPv4 Address Family

##### VPN-IPv4 Peer Groups

| Peer Group | Activate | Route-map In | Route-map Out | RCF In | RCF Out |
| ---------- | -------- | ------------ | ------------- | ------ | ------- |
| RR_PEERS | True | - | - | - | - |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| BUSINTEL | 10.199.0.28:949 | - |
| CCHYBRID | 10.199.0.28:453 | - |
| CCISSUE | 10.199.0.28:452 | - |
| CCMERCH | 10.199.0.28:451 | - |
| DCX1 | 10.199.0.28:910 | - |

#### Router BGP Device Configuration

```eos
!
router bgp 64800
   router-id 10.199.0.28
   maximum-paths 4 ecmp 4
   update wait-install
   no bgp default ipv4-unicast
   neighbor PE_CE_DC_OB_SOB_DCX1 peer group
   neighbor PE_CE_DC_OB_SOB_DCX1 remote-as 65100
   neighbor PE_CE_DC_OB_SOB_DCX1 bfd
   neighbor PE_CE_DC_OB_SOB_DCX1 password 7 <removed>
   neighbor PE_CE_DC_OB_SOB_DCX1 send-community standard
   neighbor PE_CE_DC_OB_SOB_DCX1 route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_OB_SOB_DCX1 route-map STANDARD_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_PCI_SE_CCHYBRID peer group
   neighbor PE_CE_DC_PCI_SE_CCHYBRID remote-as 65120
   neighbor PE_CE_DC_PCI_SE_CCHYBRID bfd
   neighbor PE_CE_DC_PCI_SE_CCHYBRID password 7 <removed>
   neighbor PE_CE_DC_PCI_SE_CCHYBRID send-community standard
   neighbor PE_CE_DC_PCI_SE_CCHYBRID route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_PCI_SE_CCHYBRID route-map STANDARD_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_PCI_SE_CCISSUE peer group
   neighbor PE_CE_DC_PCI_SE_CCISSUE remote-as 65120
   neighbor PE_CE_DC_PCI_SE_CCISSUE bfd
   neighbor PE_CE_DC_PCI_SE_CCISSUE password 7 <removed>
   neighbor PE_CE_DC_PCI_SE_CCISSUE send-community standard
   neighbor PE_CE_DC_PCI_SE_CCISSUE route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_PCI_SE_CCISSUE route-map STANDARD_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_PCI_SE_CCMERCH peer group
   neighbor PE_CE_DC_PCI_SE_CCMERCH remote-as 65120
   neighbor PE_CE_DC_PCI_SE_CCMERCH bfd
   neighbor PE_CE_DC_PCI_SE_CCMERCH password 7 <removed>
   neighbor PE_CE_DC_PCI_SE_CCMERCH send-community standard
   neighbor PE_CE_DC_PCI_SE_CCMERCH route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_PCI_SE_CCMERCH route-map STANDARD_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_PCI_SE_DCX1 peer group
   neighbor PE_CE_DC_PCI_SE_DCX1 remote-as 65120
   neighbor PE_CE_DC_PCI_SE_DCX1 bfd
   neighbor PE_CE_DC_PCI_SE_DCX1 password 7 <removed>
   neighbor PE_CE_DC_PCI_SE_DCX1 send-community standard
   neighbor PE_CE_DC_PCI_SE_DCX1 route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_PCI_SE_DCX1 route-map STANDARD_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_PCI_SE_PEN1 peer group
   neighbor PE_CE_DC_PCI_SE_PEN1 remote-as 65120
   neighbor PE_CE_DC_PCI_SE_PEN1 bfd
   neighbor PE_CE_DC_PCI_SE_PEN1 password 7 <removed>
   neighbor PE_CE_DC_PCI_SE_PEN1 send-community standard
   neighbor PE_CE_DC_PCI_SE_PEN1 route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_PCI_SE_PEN1 route-map STANDARD_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_PROD_SI_BUSINTEL peer group
   neighbor PE_CE_DC_PROD_SI_BUSINTEL remote-as 65100
   neighbor PE_CE_DC_PROD_SI_BUSINTEL bfd
   neighbor PE_CE_DC_PROD_SI_BUSINTEL password 7 <removed>
   neighbor PE_CE_DC_PROD_SI_BUSINTEL send-community standard
   neighbor PE_CE_DC_PROD_SI_BUSINTEL maximum-routes 0
   neighbor PE_CE_DC_PROD_SI_BUSINTEL route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_PROD_SI_BUSINTEL route-map RM_FILTERED_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_PROD_SI_DCX1 peer group
   neighbor PE_CE_DC_PROD_SI_DCX1 remote-as 65100
   neighbor PE_CE_DC_PROD_SI_DCX1 bfd
   neighbor PE_CE_DC_PROD_SI_DCX1 password 7 <removed>
   neighbor PE_CE_DC_PROD_SI_DCX1 send-community standard
   neighbor PE_CE_DC_PROD_SI_DCX1 maximum-routes 0
   neighbor PE_CE_DC_PROD_SI_DCX1 route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_PROD_SI_DCX1 route-map RM_FILTERED_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_PROD_SI_DMZMEM1 peer group
   neighbor PE_CE_DC_PROD_SI_DMZMEM1 remote-as 65100
   neighbor PE_CE_DC_PROD_SI_DMZMEM1 bfd
   neighbor PE_CE_DC_PROD_SI_DMZMEM1 password 7 <removed>
   neighbor PE_CE_DC_PROD_SI_DMZMEM1 send-community standard
   neighbor PE_CE_DC_PROD_SI_DMZMEM1 route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_PROD_SI_DMZMEM1 route-map STANDARD_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_PROD_SI_NCFDMZ peer group
   neighbor PE_CE_DC_PROD_SI_NCFDMZ remote-as 65100
   neighbor PE_CE_DC_PROD_SI_NCFDMZ bfd
   neighbor PE_CE_DC_PROD_SI_NCFDMZ password 7 <removed>
   neighbor PE_CE_DC_PROD_SI_NCFDMZ send-community standard
   neighbor PE_CE_DC_PROD_SI_NCFDMZ route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_PROD_SI_NCFDMZ route-map STANDARD_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_PROD_SI_USX1 peer group
   neighbor PE_CE_DC_PROD_SI_USX1 remote-as 65100
   neighbor PE_CE_DC_PROD_SI_USX1 bfd
   neighbor PE_CE_DC_PROD_SI_USX1 password 7 <removed>
   neighbor PE_CE_DC_PROD_SI_USX1 send-community standard
   neighbor PE_CE_DC_PROD_SI_USX1 route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_PROD_SI_USX1 route-map STANDARD_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_TEST_ST_DCX1 peer group
   neighbor PE_CE_DC_TEST_ST_DCX1 remote-as 65110
   neighbor PE_CE_DC_TEST_ST_DCX1 bfd
   neighbor PE_CE_DC_TEST_ST_DCX1 password 7 <removed>
   neighbor PE_CE_DC_TEST_ST_DCX1 send-community standard
   neighbor PE_CE_DC_TEST_ST_DCX1 route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_TEST_ST_DCX1 route-map STANDARD_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_TEST_ST_IDTN peer group
   neighbor PE_CE_DC_TEST_ST_IDTN remote-as 65110
   neighbor PE_CE_DC_TEST_ST_IDTN bfd
   neighbor PE_CE_DC_TEST_ST_IDTN password 7 <removed>
   neighbor PE_CE_DC_TEST_ST_IDTN send-community standard
   neighbor PE_CE_DC_TEST_ST_IDTN route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_TEST_ST_IDTN route-map STANDARD_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_TEST_ST_IDTNB2B peer group
   neighbor PE_CE_DC_TEST_ST_IDTNB2B remote-as 65110
   neighbor PE_CE_DC_TEST_ST_IDTNB2B bfd
   neighbor PE_CE_DC_TEST_ST_IDTNB2B password 7 <removed>
   neighbor PE_CE_DC_TEST_ST_IDTNB2B send-community standard
   neighbor PE_CE_DC_TEST_ST_IDTNB2B route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_TEST_ST_IDTNB2B route-map STANDARD_1NET_BGP_POLICY_OUT out
   neighbor PE_CE_DC_TEST_ST_IDTNDX peer group
   neighbor PE_CE_DC_TEST_ST_IDTNDX remote-as 65110
   neighbor PE_CE_DC_TEST_ST_IDTNDX bfd
   neighbor PE_CE_DC_TEST_ST_IDTNDX password 7 <removed>
   neighbor PE_CE_DC_TEST_ST_IDTNDX send-community standard
   neighbor PE_CE_DC_TEST_ST_IDTNDX route-map STANDARD_1NET_BGP_POLICY_IN in
   neighbor PE_CE_DC_TEST_ST_IDTNDX route-map STANDARD_1NET_BGP_POLICY_OUT out
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
      no neighbor RR_PEERS activate
   !
   address-family vpn-ipv4
      neighbor RR_PEERS activate
      neighbor default encapsulation mpls next-hop-self source-interface Loopback0
   !
   vrf BUSINTEL
      rd 10.199.0.28:949
      route-target import vpn-ipv4  64800:949 
      route-target import vpn-ipv4 64536:910
      route-target import vpn-ipv4 64698:949
      route-target import vpn-ipv4 64750:910
      route-target import vpn-ipv4 64751:910
      route-target import vpn-ipv4 64752:910
      route-target import vpn-ipv4 64753:910
      route-target import vpn-ipv4 64800:910
      route-target import vpn-ipv4 64800:914
      route-target import vpn-ipv4 64800:949
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
      route-target import vpn-ipv4 64810:91099
      route-target import vpn-ipv4 64811:90201
      route-target import vpn-ipv4 65210:90111
      route-target import vpn-ipv4 65215:90133
      route-target import vpn-ipv4 65354:949
      route-target export vpn-ipv4  64800:949 
      router-id 10.199.0.28
      neighbor 10.64.0.5 peer group PE_CE_DC_PROD_SI_BUSINTEL
      neighbor 10.64.0.5 description ATL-SI1-DC1-N1
      neighbor 10.64.0.25 peer group PE_CE_DC_PROD_SI_BUSINTEL
      neighbor 10.64.0.25 description ATL-SI1-DC1-N2
      !
      address-family ipv4
         neighbor 10.64.0.5 activate
         neighbor 10.64.0.25 activate
   !
   vrf CCHYBRID
      rd 10.199.0.28:453
      route-target import vpn-ipv4  64800:453 
      route-target import vpn-ipv4 64692:453
      route-target export vpn-ipv4  64800:453 
      router-id 10.199.0.28
      neighbor 10.77.0.9 peer group PE_CE_DC_PCI_SE_CCHYBRID
      neighbor 10.77.0.9 description ATL-SE1-DC1-N1
      neighbor 10.77.0.29 peer group PE_CE_DC_PCI_SE_CCHYBRID
      neighbor 10.77.0.29 description ATL-SI1-DC1-N2
      !
      address-family ipv4
         neighbor 10.77.0.9 activate
         neighbor 10.77.0.29 activate
   !
   vrf CCISSUE
      rd 10.199.0.28:452
      route-target import vpn-ipv4  64800:452 
      route-target import vpn-ipv4 64692:452
      route-target export vpn-ipv4  64800:452 
      router-id 10.199.0.28
      neighbor 10.77.0.5 peer group PE_CE_DC_PCI_SE_CCISSUE
      neighbor 10.77.0.5 description ATL-SI1-DC1-N1
      neighbor 10.77.0.25 peer group PE_CE_DC_PCI_SE_CCISSUE
      neighbor 10.77.0.25 description ATL-SI1-DC1-N2
      !
      address-family ipv4
         neighbor 10.77.0.5 activate
         neighbor 10.77.0.25 activate
   !
   vrf CCMERCH
      rd 10.199.0.28:451
      route-target import vpn-ipv4  64800:451 
      route-target import vpn-ipv4 64692:451
      route-target export vpn-ipv4  64800:451 
      router-id 10.199.0.28
      neighbor 10.77.0.7 peer group PE_CE_DC_PCI_SE_CCMERCH
      neighbor 10.77.0.7 description ATL-SI1-DC1-N1
      neighbor 10.77.0.27 peer group PE_CE_DC_PCI_SE_CCMERCH
      neighbor 10.77.0.27 description ATL-SI1-DC1-N2
      !
      address-family ipv4
         neighbor 10.77.0.7 activate
         neighbor 10.77.0.27 activate
   !
   vrf DCX1
      rd 10.199.0.28:910
      route-target import vpn-ipv4  64800:910 
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
      route-target import vpn-ipv4 64800:914
      route-target import vpn-ipv4 64800:949
      route-target import vpn-ipv4 64800:91098
      route-target import vpn-ipv4 64800:91099
      route-target import vpn-ipv4 64811:910
      route-target import vpn-ipv4 64811:91099
      route-target import vpn-ipv4 64813:910
      route-target import vpn-ipv4 64820:90101
      route-target import vpn-ipv4 64820:90103
      route-target import vpn-ipv4 65010:91099
      route-target import vpn-ipv4 65011:90201
      route-target import vpn-ipv4 65210:90111
      route-target import vpn-ipv4 65215:90113
      route-target import vpn-ipv4 65354:949
      route-target import vpn-ipv4 route-map PREF_DEFAULT_IMPORT_MAP
      route-target export vpn-ipv4  64800:910 
      router-id 10.199.0.28
      neighbor 10.64.0.1 peer group PE_CE_DC_PROD_SI_DCX1
      neighbor 10.64.0.1 description ATL-SI1-DC1-N1
      neighbor 10.64.0.21 peer group PE_CE_DC_PROD_SI_DCX1
      neighbor 10.64.0.21 description ATL-SI1-DC1-N1
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
      address-family ipv4
         neighbor 10.64.0.1 activate
         neighbor 10.64.0.21 activate
         neighbor 10.72.0.1 activate
         neighbor 10.72.0.17 activate
         neighbor 10.76.0.131 activate
         neighbor 10.76.0.139 activate
         neighbor 10.77.0.1 activate
         neighbor 10.77.0.21 activate
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
| LDP Router ID | 10.199.0.28 |
| LDP Interface Disabled Default | True |
| LDP Transport-Address Interface | Loopback0 |

#### MPLS and LDP Device Configuration

```eos
!
mpls ip
!
mpls ldp
   interface disabled default
   router-id 10.199.0.28
   no shutdown
   transport-address interface Loopback0
```

### MPLS Interfaces

| Interface | MPLS IP Enabled | LDP Enabled | IGP Sync |
| --------- | --------------- | ----------- | -------- |
| Ethernet25/1 | True | True | - |
| Ethernet26/1 | True | True | - |
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

##### DENY_ALL

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | deny | - | - | - | - |

##### NCFDMZ_PREF_DEFAULT_IMPORT_MAP

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | NCFDMZ_DA2_PREF_COMM | local-preference 170 | - | - |
| 20 | permit | NCFDMZ_DC21_PREF_COMM | local-preference 150 | - | - |
| 900 | permit | - | - | - | - |

##### PASS_ALL

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | - | - | - |

##### PREF_DEFAULT_IMPORT_MAP

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | community DA2_DEFAULT_COMM | local-preference 150 | - | - |
| 20 | permit | community DC21_DEFAULT_COMM | local-preference 120 | - | - |
| 900 | permit | - | - | - | - |

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

#### Route-maps Device Configuration

```eos
!
route-map DENY_ALL deny 10
!
route-map NCFDMZ_PREF_DEFAULT_IMPORT_MAP permit 10
   description PRIMARY DA2 DEFAULT (LP 170)
   match NCFDMZ_DA2_PREF_COMM
   set local-preference 170
!
route-map NCFDMZ_PREF_DEFAULT_IMPORT_MAP permit 20
   description SECONDARY DC21 DEFAULT (LP 150)
   match NCFDMZ_DC21_PREF_COMM
   set local-preference 150
!
route-map NCFDMZ_PREF_DEFAULT_IMPORT_MAP permit 900
   description Standard import map to allow All routes
!
route-map PASS_ALL permit 10
!
route-map PREF_DEFAULT_IMPORT_MAP permit 10
   description Standard import map to allow DA2 Default
   match community DA2_DEFAULT_COMM
   set local-preference 150
!
route-map PREF_DEFAULT_IMPORT_MAP permit 20
   description Standard import map to allow DC21 Default
   match community DC21_DEFAULT_COMM
   set local-preference 120
!
route-map PREF_DEFAULT_IMPORT_MAP permit 900
   description description Standard import map to allow All routes
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
| BUSINTEL | enabled |
| CCHYBRID | enabled |
| CCISSUE | enabled |
| CCMERCH | enabled |
| DCX1 | enabled |
| MGMT | disabled |

### VRF Instances Device Configuration

```eos
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
management ssh
  authentication mode password
!
arp aging timeout default 900
```
