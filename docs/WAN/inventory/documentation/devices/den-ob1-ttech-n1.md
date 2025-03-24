# DEN-OB1-TTECH-N1

## Table of Contents

- [Management](#management)
  - [DNS Domain](#dns-domain)
  - [IP Name Servers](#ip-name-servers)
  - [Domain Lookup](#domain-lookup)
  - [Clock Settings](#clock-settings)
  - [NTP](#ntp)
  - [Management SSH](#management-ssh)
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
  - [Interface Defaults](#interface-defaults)
  - [Interface Profiles](#interface-profiles)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Port-Channel Interfaces](#port-channel-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
  - [VLAN Interfaces](#vlan-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [Virtual Router MAC Address](#virtual-router-mac-address)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
  - [ARP](#arp)
  - [Router BGP](#router-bgp)
- [BFD](#bfd)
  - [Router BFD](#router-bfd)
  - [BFD Interfaces](#bfd-interfaces)
- [Queue Monitor](#queue-monitor)
  - [Queue Monitor Length](#queue-monitor-length)
  - [Queue Monitor Streaming](#queue-monitor-streaming)
  - [Queue Monitor Configuration](#queue-monitor-configuration)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
- [Filters](#filters)
  - [Prefix-lists](#prefix-lists)
  - [Route-maps](#route-maps)
- [ACL](#acl)
  - [IP Access-lists](#ip-access-lists)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)
- [System L1](#system-l1)
  - [Unsupported Interface Configurations](#unsupported-interface-configurations)
  - [System L1 Device Configuration](#system-l1-device-configuration)
- [EOS CLI Device Configuration](#eos-cli-device-configuration)

## Management

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
| 10.136.128.100 | default | - |
| 10.231.108.100 | default | - |
| 10.0.255.100 | default | - |

#### IP Name Servers Device Configuration

```eos
ip name-server vrf default 10.0.255.100
ip name-server vrf default 10.136.128.100
ip name-server vrf default 10.231.108.100
```

### Domain Lookup

#### DNS Domain Lookup Summary

| Source interface | vrf |
| ---------------- | --- |
| Vlan1001 | default |

#### DNS Domain Lookup Device Configuration

```eos
ip domain lookup vrf default source-interface Vlan1001
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
| 10.0.16.254 | default | - | - | - | - | - | - | Loopback0 | 10 |
| 10.136.128.253 | default | - | - | - | - | - | - | Loopback0 | 10 |
| 10.136.128.254 | default | - | - | - | - | - | - | Loopback0 | 10 |

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
ntp server 10.0.16.254 local-interface Loopback0 key <removed>
ntp server 10.136.128.253 local-interface Loopback0 key <removed>
ntp server 10.136.128.254 local-interface Loopback0 key <removed>
```

### Management SSH

#### IPv4 ACL

| IPv4 ACL | VRF |
| -------- | --- |
| SSH_ACCESS | default |

#### SSH Timeout and Management

| Idle Timeout | SSH Management |
| ------------ | -------------- |
| 10 | Enabled |

#### Max number of SSH sessions limit and per-host limit

| Connection Limit | Max from a single Host |
| ---------------- | ---------------------- |
| - | - |

#### Ciphers and Algorithms

| Ciphers | Key-exchange methods | MAC algorithms | Hostkey server algorithms |
|---------|----------------------|----------------|---------------------------|
| default | default | default | default |

#### VRFs

| VRF | Status |
| --- | ------ |
| default | Enabled |

#### Management SSH Device Configuration

```eos
!
management ssh
   ip access-group SSH_ACCESS vrf default in
   idle-timeout 10
   !
   vrf default
      no shutdown
```

### IP Client Source Interfaces

| IP Client | VRF | Source Interface Name |
| --------- | --- | --------------------- |
| SSH | default | Vlan1001 |

#### IP Client Source Interfaces Device Configuration

```eos
!
ip ssh client source-interface Vlan1001 vrf default
 ```

### Management API gNMI

#### Management API gNMI Summary

| Transport | SSL Profile | VRF | Notification Timestamp | ACL | Port |
| --------- | ----------- | --- | ---------------------- | --- | ---- |
| default | SSL_TLS_1_2 | default | last-change-time | - | 6030 |

Provider eos-native is configured.

#### Management API gNMI Device Configuration

```eos
!
management api gnmi
   transport grpc default
      ssl profile SSL_TLS_1_2
      vrf default
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
| default | - | - |

#### Management API HTTP Device Configuration

```eos
!
management api http-commands
   protocol https
   protocol https ssl profile SSL_TLS_1_2
   no shutdown
   !
   vrf default
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
| default | prodauth.usaa.com | False | - |

#### TACACS Servers Device Configuration

```eos
!
tacacs-server host prodauth.usaa.com key 7 <removed>
```

### IP TACACS Source Interfaces

#### IP TACACS Source Interfaces

| VRF | Source Interface Name |
| --- | --------------- |
| default | Vlan1001 |

#### IP TACACS Source Interfaces Device Configuration

```eos
!
ip tacacs vrf default source-interface Vlan1001
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
| gzip | 10.139.16.173:9910,10.139.16.174:9910,10.139.16.175:9910 | default | token,tmp/token | ale,flexCounter,hardware,kni,pulse,strata | /Sysdb/cell/1/agent,/Sysdb/cell/2/agent | False |

#### TerminAttr Daemon Device Configuration

```eos
!
daemon TerminAttr
   exec /usr/bin/TerminAttr -cvaddr=10.139.16.173:9910,10.139.16.174:9910,10.139.16.175:9910 -cvauth=token,tmp/token -cvvrf=default -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -taillogs=/var/log/messages
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
| default | Vlan1001 |

| VRF | Hosts | Ports | Protocol |
| --- | ----- | ----- | -------- |
| default | routingelk-ingest.usaa.com | 8012 | UDP |

#### Logging Servers and Features Device Configuration

```eos
!
logging buffered 10000
logging trap debugging
no logging console
logging host routingelk-ingest.usaa.com 8012
logging format timestamp high-resolution
logging source-interface Vlan1001
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
| local | 89bc6159dba9de2c0c326585337e16ba5b044d2b | - | - |

#### SNMP Local Interfaces

| Local Interface | VRF |
| --------------- | --- |
| Vlan1001 | default |

#### SNMP VRF Status

| VRF | Status |
| --- | ------ |
| default | Disabled |
| MGMT | Enabled |

#### SNMP Hosts Configuration

| Host | VRF | Community | Username | Authentication level | SNMP Version |
| ---- |---- | --------- | -------- | -------------------- | ------------ |
| 10.139.4.41 | - | - | NETSVC_SPECTRUM | priv | 3 |
| 10.139.4.44 | - | - | NETSVC_SPECTRUM | priv | 3 |

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
| NETSVC_NETBRAIN_TEST | READONLY | v3 | sha | aes | - | - | 89bc6159dba9de2c0c326585337e16ba5b044d2b |
| NETSVC_NETBRAIN | READONLY | v3 | sha | aes | - | - | 89bc6159dba9de2c0c326585337e16ba5b044d2b |
| SERVICENOW | READONLY | v3 | sha | aes | - | - | 89bc6159dba9de2c0c326585337e16ba5b044d2b |
| NETSVC_SPECTRUM | READONLY | v3 | sha | aes | - | - | 89bc6159dba9de2c0c326585337e16ba5b044d2b |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 89bc6159dba9de2c0c326585337e16ba5b044d2b
snmp-server contact nsho_provider_networks
snmp-server location DEN
snmp-server vrf default local-interface Vlan1001
snmp-server view READALL ISO included
snmp-server group READONLY v3 priv read READALL
snmp-server user NETSVC_NETBRAIN_TEST READONLY v3 localized 89bc6159dba9de2c0c326585337e16ba5b044d2b auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETBRAIN READONLY v3 localized 89bc6159dba9de2c0c326585337e16ba5b044d2b auth sha <removed> priv aes <removed>
snmp-server user SERVICENOW READONLY v3 localized 89bc6159dba9de2c0c326585337e16ba5b044d2b auth sha <removed> priv aes <removed>
snmp-server user NETSVC_SPECTRUM READONLY v3 localized 89bc6159dba9de2c0c326585337e16ba5b044d2b auth sha <removed> priv aes <removed>
snmp-server host 10.139.4.41 version 3 priv NETSVC_SPECTRUM
snmp-server host 10.139.4.44 version 3 priv NETSVC_SPECTRUM
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
| default | Vlan1001 | - | - |

sFlow Sample Rate: 65536

sFlow Polling Interval: 5

sFlow is enabled.

#### SFlow Device Configuration

```eos
!
sflow sample 65536
sflow polling-interval 5
sflow vrf default source-interface Vlan1001
sflow run
```

## Spanning Tree

### Spanning Tree Summary

STP mode: **mstp**

#### MSTP Instance and Priority

| Instance(s) | Priority |
| -------- | -------- |
| 0 | 32768 |

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
spanning-tree mst 0 priority 32768
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
| 1001 | OB1:MGMT | - |

### VLANs Device Configuration

```eos
!
vlan 1
   name Default
   state suspend
!
vlan 1001
   name OB1:MGMT
```

## Interfaces

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

### Interface Profiles

#### Interface Profiles Summary

- MGMT

#### Interface Profiles Device Configuration

```eos
!
interface profile MGMT
   command description mgmt interface
   command switchport access vlan 1001
   command spanning-tree portfast
   command no spanning-tree portfast auto
   command spanning-tree bpduguard enable
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
| Ethernet11 |  - | access | - | - | - | - |
| Ethernet12 |  - | access | - | - | - | - |

*Inherited from Port-Channel Interface

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Port-Channel11 | - | routed | - | 10.9.176.233/31 | default | - | False | - | - |
| Port-Channel12 | - | routed | - | 10.9.176.235/31 | default | - | False | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   profile MGMT
   no shutdown
   switchport
   profile override description mgmt interface
!
interface Ethernet2
   profile MGMT
   no shutdown
   switchport
   profile override description mgmt interface
!
interface Ethernet3
   profile MGMT
   no shutdown
   switchport
   profile override description mgmt interface
!
interface Ethernet4
   profile MGMT
   no shutdown
   switchport
   profile override description mgmt interface
!
interface Ethernet5
   profile MGMT
   no shutdown
   switchport
   profile override description mgmt interface
!
interface Ethernet6
   profile MGMT
   no shutdown
   switchport
   profile override description mgmt interface
!
interface Ethernet7
   profile MGMT
   no shutdown
   switchport
   profile override description mgmt interface
!
interface Ethernet8
   profile MGMT
   no shutdown
   switchport
   profile override description mgmt interface
!
interface Ethernet9
   profile MGMT
   no shutdown
   switchport
   profile override description mgmt interface
!
interface Ethernet10
   profile MGMT
   no shutdown
   switchport
   profile override description mgmt interface
!
interface Ethernet11
   profile MGMT
   no shutdown
   switchport
   profile override description mgmt interface
!
interface Ethernet12
   profile MGMT
   no shutdown
   switchport
   profile override description mgmt interface
!
interface Ethernet13
   description DEN-TRX1-TTECH-PE1_Ethernet4/1
   no shutdown
   switchport
   channel-group 11 mode active
   spanning-tree portfast
   spanning-tree bpduguard enable
!
interface Ethernet14
   description DEN-TRX1-TTECH-PE2_Ethernet4/1
   no shutdown
   switchport
   channel-group 12 mode active
   spanning-tree portfast
   spanning-tree bpduguard enable
!
interface Port-Channel11
   no shutdown
   no switchport
   ip address 10.9.176.233/31
!
interface Port-Channel12
   no shutdown
   no switchport
   ip address 10.9.176.235/31
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel11
   description L3-PtP:OVERLAY:OB1:PE-CE
   no switchport
   bfd interval 150 min-rx 150 multiplier 150
!
interface Port-Channel12
   description L3-PtP:OVERLAY:OB1:PE-CE
   no switchport
   bfd interval 150 min-rx 150 multiplier 150
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | Router_ID | default | 10.9.176.180/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | Router_ID | default | - |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description Router_ID
   no shutdown
   ip address 10.9.176.180/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan1001 | OB1:MGMT | default | - | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan1001 |  default  |  10.192.17.107/24  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan1001
   description OB1:MGMT
   no shutdown
   ip address 10.192.17.107/24
   ip helper-address 10.132.30.7
   ip helper-address 10.229.88.5
```

## Routing

### Service Routing Protocols Model

Multi agent routing protocol model enabled

```eos
!
service routing protocols model multi-agent
```

### Virtual Router MAC Address

#### Virtual Router MAC Address Summary

Virtual Router MAC Address: 00:1c:73:00:00:99

#### Virtual Router MAC Address Device Configuration

```eos
!
ip virtual-router mac-address 00:1c:73:00:00:99
```

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |

#### IP Routing Device Configuration

```eos
!
ip routing
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| default | false |

### Static Routes

#### Static Routes Summary

| VRF | Destination Prefix | Next Hop IP | Exit interface | Administrative Distance | Tag | Route Name | Metric |
| --- | ------------------ | ----------- | -------------- | ----------------------- | --- | ---------- | ------ |
| default | 0.0.0.0/0 | 10.192.17.1 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route 0.0.0.0/0 10.192.17.1
```

### ARP

Global ARP timeout: 900

#### ARP Device Configuration

```eos
!
arp aging timeout default 900
```

### Router BGP

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 64801 | 10.9.176.180 |

| BGP Tuning |
| ---------- |
| update wait-install |
| no bgp default ipv4-unicast |
| distance bgp 20 200 200 |
| graceful-restart restart-time 300 |
| graceful-restart |
| update wait-install |
| no bgp default ipv4-unicast |
| maximum-paths 2 ecmp 2 |

#### Router BGP Peer Groups

##### PE_CE_OB1

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Remote AS | 64800 |
| BFD | True |
| Send community | all |
| Maximum routes | 12000 |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 10.9.176.232 | Inherited from peer group PE_CE_OB1 | default | - | Inherited from peer group PE_CE_OB1 | Inherited from peer group PE_CE_OB1 | - | Inherited from peer group PE_CE_OB1 | - | - | - | - |
| 10.9.176.234 | Inherited from peer group PE_CE_OB1 | default | - | Inherited from peer group PE_CE_OB1 | Inherited from peer group PE_CE_OB1 | - | Inherited from peer group PE_CE_OB1 | - | - | - | - |

#### Router BGP Device Configuration

```eos
!
router bgp 64801
   router-id 10.9.176.180
   maximum-paths 2 ecmp 2
   update wait-install
   no bgp default ipv4-unicast
   update wait-install
   no bgp default ipv4-unicast
   distance bgp 20 200 200
   graceful-restart restart-time 300
   graceful-restart
   neighbor PE_CE_OB1 peer group
   neighbor PE_CE_OB1 remote-as 64800
   neighbor PE_CE_OB1 bfd
   neighbor PE_CE_OB1 password 7 <removed>
   neighbor PE_CE_OB1 send-community
   neighbor PE_CE_OB1 maximum-routes 12000
   neighbor PE_CE_OB1 route-map DEFAULT_ROUTE in
   neighbor PE_CE_OB1 route-map OB1_3PCC_POLICY_OUT out
   neighbor 10.9.176.232 peer group PE_CE_OB1
   neighbor 10.9.176.234 peer group PE_CE_OB1
   !
   address-family ipv4
      neighbor PE_CE_OB1 activate
      network 10.9.176.180/32
      network 10.9.184.32/28
```

## BFD

### Router BFD

#### Router BFD Multihop Summary

| Interval | Minimum RX | Multiplier |
| -------- | ---------- | ---------- |
| 300 | 300 | 3 |

#### Router BFD Device Configuration

```eos
!
router bfd
   multihop interval 300 min-rx 300 multiplier 3
```

### BFD Interfaces

| Interface | Interval | Minimum RX | Multiplier | Echo |
| --------- | -------- | ---------- | ---------- | ---- |
| Port-Channel11 | 150 | 150 | 150 | - |
| Port-Channel12 | 150 | 150 | 150 | - |

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

### Prefix-lists

#### Prefix-lists Summary

##### DEFAULT_ROUTE

| Sequence | Action |
| -------- | ------ |
| 10 | permit 0.0.0.0/0 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list DEFAULT_ROUTE
   seq 10 permit 0.0.0.0/0
```

### Route-maps

#### Route-maps Summary

##### DEFAULT_ROUTE

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list DEFAULT_ROUTE | - | - | - |

##### OB1_3PCC_POLICY_OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list OB1_3PCC_POLICY_OUT | - | - | - |

#### Route-maps Device Configuration

```eos
!
route-map DEFAULT_ROUTE permit 10
   match ip address prefix-list DEFAULT_ROUTE
!
route-map OB1_3PCC_POLICY_OUT permit 10
   description OB1_3PCC_POLICY_OUT
   match ip address prefix-list OB1_3PCC_POLICY_OUT
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

### VRF Instances Device Configuration

```eos
```

## System L1

### Unsupported Interface Configurations

| Unsupported Configuration | action |
| ---------------- | -------|
| Speed | error |
| Error correction | error |

### System L1 Device Configuration

```eos
!
system l1
   unsupported speed action error
   unsupported error-correction action error
```

## EOS CLI Device Configuration

```eos
!
dhcp relay
  vss control disabled
!
ip dhcp relay information option
ip dhcp relay always-on
ip dhcp relay all-subnets default
!
management ssh
  authentication mode password
!
arp aging timeout default 900
!
system control-plane
  no service-policy input copp-system-policy
!
spanning-tree mst configuration
  name OB1

```
