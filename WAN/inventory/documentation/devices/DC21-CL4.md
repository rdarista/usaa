# DC21-CL4

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
  - [DNS Domain](#dns-domain)
  - [IP Name Servers](#ip-name-servers)
  - [Domain Lookup](#domain-lookup)
  - [Clock Settings](#clock-settings)
  - [NTP](#ntp)
  - [Management SSH](#management-ssh)
  - [IP Client Source Interfaces](#ip-client-source-interfaces)
  - [Management API gNMI](#management-api-gnmi)
  - [Management Console](#management-console)
  - [Management API HTTP](#management-api-http)
- [Authentication](#authentication)
  - [Local Users](#local-users)
  - [Enable Password](#enable-password)
  - [IP TACACS Source Interfaces](#ip-tacacs-source-interfaces)
  - [AAA Authentication](#aaa-authentication)
  - [AAA Authorization](#aaa-authorization)
- [Management Security](#management-security)
  - [Management Security Summary](#management-security-summary)
  - [Management Security SSL Profiles](#management-security-ssl-profiles)
  - [SSL profile SSL_TLS_1_2 Certificates Summary](#ssl-profile-ssl_tls_1_2-certificates-summary)
  - [Management Security Device Configuration](#management-security-device-configuration)
- [Monitoring](#monitoring)
  - [TerminAttr Daemon](#terminattr-daemon)
  - [Logging](#logging)
  - [SNMP](#snmp)
- [MLAG](#mlag)
  - [MLAG Summary](#mlag-summary)
  - [MLAG Device Configuration](#mlag-device-configuration)
- [Spanning Tree](#spanning-tree)
  - [Spanning Tree Summary](#spanning-tree-summary)
  - [Spanning Tree Device Configuration](#spanning-tree-device-configuration)
- [Internal VLAN Allocation Policy](#internal-vlan-allocation-policy)
  - [Internal VLAN Allocation Policy Summary](#internal-vlan-allocation-policy-summary)
  - [Internal VLAN Allocation Policy Device Configuration](#internal-vlan-allocation-policy-device-configuration)
- [VLANs](#vlans)
  - [VLANs Summary](#vlans-summary)
  - [VLANs Device Configuration](#vlans-device-configuration)
- [MAC Address Table](#mac-address-table)
  - [MAC Address Table Summary](#mac-address-table-summary)
  - [MAC Address Table Device Configuration](#mac-address-table-device-configuration)
- [Interfaces](#interfaces)
  - [Switchport Default](#switchport-default)
  - [Interface Defaults](#interface-defaults)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Port-Channel Interfaces](#port-channel-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
  - [VLAN Interfaces](#vlan-interfaces)
  - [VXLAN Interface](#vxlan-interface)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [Virtual Router MAC Address](#virtual-router-mac-address)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [ARP](#arp)
  - [Router BGP](#router-bgp)
- [BFD](#bfd)
  - [Router BFD](#router-bfd)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
- [Filters](#filters)
  - [Prefix-lists](#prefix-lists)
  - [Route-maps](#route-maps)
  - [IP Extended Community Lists](#ip-extended-community-lists)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)
- [Virtual Source NAT](#virtual-source-nat)
  - [Virtual Source NAT Summary](#virtual-source-nat-summary)
  - [Virtual Source NAT Configuration](#virtual-source-nat-configuration)
- [Errdisable](#errdisable)
  - [Errdisable Summary](#errdisable-summary)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | Description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | MGMT | 192.168.0.105/24 | - |

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
   ip address 192.168.0.105/24
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
| 10.255.0.2 | - | - |
| 10.136.128.100 | MGMT | - |
| 10.231.108.100 | MGMT | - |

#### IP Name Servers Device Configuration

```eos
ip name-server 10.255.0.2
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
| 10.0.0.253 | MGMT | - | - | - | - | - | - | Management1 | 10 |
| 10.0.0.254 | MGMT | - | - | - | - | - | - | Management1 | 10 |
| 10.0.0.255 | MGMT | - | - | - | - | - | - | Management1 | 10 |

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
ntp server vrf MGMT 10.0.0.253 local-interface Management1 key <removed>
ntp server vrf MGMT 10.0.0.254 local-interface Management1 key <removed>
ntp server vrf MGMT 10.0.0.255 local-interface Management1 key <removed>
```

### Management SSH

#### IPv4 ACL

| IPv4 ACL | VRF |
| -------- | --- |
| SSH_ACCESS | MGMT |

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
| MGMT | Enabled |

#### Management SSH Device Configuration

```eos
!
management ssh
   ip access-group SSH_ACCESS vrf MGMT in
   idle-timeout 10
   no shutdown
   !
   vrf MGMT
      no shutdown
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

### Management Console

#### Management Console Timeout

Management Console Timeout is set to **100** minutes.

#### Management Console Device Configuration

```eos
!
management console
   idle-timeout 100
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
| admin | 15 | network-admin | False | - |
| cvpadmin | 15 | network-admin | False | - |

#### Local Users Device Configuration

```eos
!
username admin privilege 15 role network-admin secret sha512 <removed>
username cvpadmin privilege 15 role network-admin secret sha512 <removed>
```

### Enable Password

sha512 encrypted enable password is configured

#### Enable Password Device Configuration

```eos
!
enable password sha512 <removed>
!
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
| Login | default | local |
| Login | console | local |

AAA Authentication on-failure log has been enabled

AAA Authentication on-success log has been enabled

#### AAA Authentication Device Configuration

```eos
aaa authentication login default local
aaa authentication login console local
aaa authentication policy on-failure log
aaa authentication policy on-success log
!
```

### AAA Authorization

#### AAA Authorization Summary

| Type | User Stores |
| ---- | ----------- |
| Exec | local |

Authorization for configuration commands is enabled.

Authorization for serial console is enabled.

#### AAA Authorization Privilege Levels Summary

| Privilege Level | User Stores |
| --------------- | ----------- |
| all | local |

#### AAA Authorization Device Configuration

```eos
aaa authorization serial-console
aaa authorization exec default local
aaa authorization commands all default local
!
```

## Management Security

### Management Security Summary

| Settings | Value |
| -------- | ----- |

### Management Security SSL Profiles

| SSL Profile Name | TLS protocol accepted | Certificate filename | Key filename | Cipher List | CRLs |
| ---------------- | --------------------- | -------------------- | ------------ | ----------- | ---- |
| SSL_TLS_1_2 | 1.2 | SSL_TLS_1_2.crt | SSL_TLS_1_2.key | HIGH:!NULL:!MD5:!ADH:!ANULL:!AECD | - |

### SSL profile SSL_TLS_1_2 Certificates Summary

| Trust Certificates | Requirement | Policy | System |
| ------------------ | ----------- | ------ | ------ |
| SSL_TLS_1_2.crt | - | - | - |

### Management Security Device Configuration

```eos
!
management security
   ssl profile SSL_TLS_1_2
      tls versions 1.2
      cipher-list HIGH:!NULL:!MD5:!ADH:!ANULL:!AECD
      trust certificate SSL_TLS_1_2.crt
      certificate SSL_TLS_1_2.crt key SSL_TLS_1_2.key
```

## Monitoring

### TerminAttr Daemon

#### TerminAttr Daemon Summary

| CV Compression | CloudVision Servers | VRF | Authentication | Smash Excludes | Ingest Exclude | Bypass AAA |
| -------------- | ------------------- | --- | -------------- | -------------- | -------------- | ---------- |
| gzip | 10.139.16.173:9910,10.139.16.174:9910,10.139.16.175:9910 | MGMT | token,/tmp/token | ale,flexCounter,hardware,kni,pulse,strata | /Sysdb/cell/1/agent,/Sysdb/cell/2/agent | False |

#### TerminAttr Daemon Device Configuration

```eos
!
daemon TerminAttr
   exec /usr/bin/TerminAttr -cvaddr=10.139.16.173:9910,10.139.16.174:9910,10.139.16.175:9910 -cvauth=token,/tmp/token -cvvrf=MGMT -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -taillogs=/var/log/messages
   no shutdown
```

### Logging

#### Logging Servers and Features Summary

| Type | Level |
| -----| ----- |
| Console | warnings |
| Monitor | errors |
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
| MGMT | 10.0.249.172 | 9107 | UDP |
| MGMT | log.usaa.com | 7036 | UDP |
| MGMT | routingelk-anycast.usaa.com | 8012 | UDP |

#### Logging Servers and Features Device Configuration

```eos
!
logging buffered 10000
logging trap debugging
logging console warnings
logging monitor errors
logging vrf MGMT host 10.0.249.172 9107
logging vrf MGMT host log.usaa.com 7036
logging vrf MGMT host routingelk-anycast.usaa.com 8012
logging format timestamp high-resolution
logging vrf MGMT source-interface Management1
```

### SNMP

#### SNMP Configuration Summary

| Contact | Location | SNMP Traps | State |
| ------- | -------- | ---------- | ----- |
| nsho_provider_networks | DC21-CL4 | All | Enabled |
| nsho_provider_networks | DC21-CL4 |  | Enabled |
| nsho_provider_networks | DC21-CL4 | bgp backward-transition, bridge | Disabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | dcaa353ed2dac084293042b523244ffd27f2ed59 | - | - |

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
| proddxnspv1lsat.usaa.com | MGMT | - | sdadmin | auth | 3 |
| proddxnspv2lsat.usaa.com | MGMT | - | sdadmin | auth | 3 |

#### SNMP Views Configuration

| View | MIB Family Name | Status |
| ---- | --------------- | ------ |
| READALL | ISO | Included |

#### SNMP Groups Configuration

| Group | SNMP Version | Authentication | Read | Write | Notify |
| ----- | ------------ | -------------- | ---- | ----- | ------ |
| CAPC | v3 | auth | READALL | - | - |
| READONLY | v3 | priv | READALL | - | - |

#### SNMP Users Configuration

| User | Group | Version | Authentication | Privacy | Remote Address | Remote Port | Engine ID |
| ---- | ----- | ------- | -------------- | ------- | -------------- | ----------- | --------- |
| NETSVC_NETBRAIN_TEST | READONLY | v3 | sha | aes | - | - | dcaa353ed2dac084293042b523244ffd27f2ed59 |
| NETSVC_NETBRAIN | READONLY | v3 | sha | aes | - | - | dcaa353ed2dac084293042b523244ffd27f2ed59 |
| SERVICENOW | READONLY | v3 | sha | aes | - | - | dcaa353ed2dac084293042b523244ffd27f2ed59 |
| NETSVC_NETSCOUT | READONLY | v3 | sha | aes | - | - | dcaa353ed2dac084293042b523244ffd27f2ed59 |
| NETSVC_SPECTRUM | READONLY | v3 | sha | aes | - | - | dcaa353ed2dac084293042b523244ffd27f2ed59 |
| sdadmin | CAPC | v3 | md5 | - | - | - | dcaa353ed2dac084293042b523244ffd27f2ed59 |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local dcaa353ed2dac084293042b523244ffd27f2ed59
snmp-server contact nsho_provider_networks
snmp-server location DC21-CL4
snmp-server vrf MGMT local-interface Management1
snmp-server view READALL ISO included
snmp-server group CAPC v3 auth read READALL
snmp-server group READONLY v3 priv read READALL
snmp-server user NETSVC_NETBRAIN_TEST READONLY v3 localized dcaa353ed2dac084293042b523244ffd27f2ed59 auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETBRAIN READONLY v3 localized dcaa353ed2dac084293042b523244ffd27f2ed59 auth sha <removed> priv aes <removed>
snmp-server user SERVICENOW READONLY v3 localized dcaa353ed2dac084293042b523244ffd27f2ed59 auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETSCOUT READONLY v3 localized dcaa353ed2dac084293042b523244ffd27f2ed59 auth sha <removed> priv aes <removed>
snmp-server user NETSVC_SPECTRUM READONLY v3 localized dcaa353ed2dac084293042b523244ffd27f2ed59 auth sha <removed> priv aes <removed>
snmp-server user sdadmin CAPC v3 localized dcaa353ed2dac084293042b523244ffd27f2ed59 auth md5 <removed>
snmp-server host proddxnspv1lsat.usaa.com vrf MGMT version 3 auth sdadmin
snmp-server host proddxnspv2lsat.usaa.com vrf MGMT version 3 auth sdadmin
snmp-server enable traps
no snmp-server enable traps bgp backward-transition
no snmp-server enable traps bridge
no snmp-server vrf default
snmp-server vrf MGMT
```

## MLAG

### MLAG Summary

| Domain-id | Local-interface | Peer-address | Peer-link |
| --------- | --------------- | ------------ | --------- |
| DC21_CLEAF3_4 | Vlan4094 | 172.16.0.4 | Port-Channel3 |

Dual primary detection is enabled. The detection delay is 5 seconds.

### MLAG Device Configuration

```eos
!
mlag configuration
   domain-id DC21_CLEAF3_4
   local-interface Vlan4094
   peer-address 172.16.0.4
   peer-address heartbeat 192.168.0.104 vrf MGMT
   peer-link Port-Channel3
   dual-primary detection delay 5 action errdisable all-interfaces
   reload-delay mlag 900
   reload-delay non-mlag 1020
```

## Spanning Tree

### Spanning Tree Summary

STP mode: **mstp**

#### MSTP Instance and Priority

| Instance(s) | Priority |
| -------- | -------- |
| 0 | 4096 |

#### Global Spanning-Tree Settings

- Spanning Tree disabled for VLANs: **4093-4094**

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
no spanning-tree vlan-id 4093-4094
spanning-tree mst 0 priority 4096
```

## Internal VLAN Allocation Policy

### Internal VLAN Allocation Policy Summary

| Policy Allocation | Range Beginning | Range Ending |
| ------------------| --------------- | ------------ |
| ascending | 3500 | 4000 |

### Internal VLAN Allocation Policy Device Configuration

```eos
!
vlan internal order ascending range 3500 4000
```

## VLANs

### VLANs Summary

| VLAN ID | Name | Trunk Groups |
| ------- | ---- | ------------ |
| 10 | V10-T-A-VRF-RED | - |
| 20 | V20-T-B-VRF-BLUE | - |
| 30 | V30-T-A-VRF-RED | - |
| 40 | V40-T-B-VRF-BLUE | - |
| 4000 | MLAG_iBGP_RED | LEAF_PEER_L3 |
| 4001 | MLAG_iBGP_BLUE | LEAF_PEER_L3 |
| 4093 | LEAF_PEER_L3 | LEAF_PEER_L3 |
| 4094 | MLAG_PEER | MLAG |

### VLANs Device Configuration

```eos
!
vlan 10
   name V10-T-A-VRF-RED
!
vlan 20
   name V20-T-B-VRF-BLUE
!
vlan 30
   name V30-T-A-VRF-RED
!
vlan 40
   name V40-T-B-VRF-BLUE
!
vlan 4000
   name MLAG_iBGP_RED
   trunk group LEAF_PEER_L3
!
vlan 4001
   name MLAG_iBGP_BLUE
   trunk group LEAF_PEER_L3
!
vlan 4093
   name LEAF_PEER_L3
   trunk group LEAF_PEER_L3
!
vlan 4094
   name MLAG_PEER
   trunk group MLAG
```

## MAC Address Table

### MAC Address Table Summary

- MAC address table entry maximum age: 1800 seconds

### MAC Address Table Device Configuration

```eos
!
mac address-table aging-time 1800
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

- Default Ethernet Interface Shutdown: False

- Default Routed Interface MTU: 9214

#### Interface Defaults Device Configuration

```eos
!
interface defaults
   ethernet
      no shutdown
   mtu 9214
```

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet3 | MLAG_PEER_DC21-CL3_Ethernet3 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 3 |
| Ethernet4 | Host3_Ethernet2 | *trunk | *10,20,30,40,50 | *- | *- | 4 |
| Ethernet5 | Host4_Ethernet2 | *trunk | *10,20,30,40,50 | *- | *- | 5 |

*Inherited from Port-Channel Interface

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet1 | P2P_LINK_TO_DC21-SP1_Ethernet4 | routed | - | 192.168.1.13/31 | default | 1500 | False | - | - |
| Ethernet2 | P2P_LINK_TO_DC21-SP2_Ethernet4 | routed | - | 192.168.1.15/31 | default | 1500 | False | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description P2P_LINK_TO_DC21-SP1_Ethernet4
   no shutdown
   mtu 1500
   speed forced 100g
   no switchport
   ip address 192.168.1.13/31
!
interface Ethernet2
   description P2P_LINK_TO_DC21-SP2_Ethernet4
   no shutdown
   mtu 1500
   speed forced 100g
   no switchport
   ip address 192.168.1.15/31
!
interface Ethernet3
   description MLAG_PEER_DC21-CL3_Ethernet3
   no shutdown
   speed 100g
   channel-group 3 mode active
!
interface Ethernet4
   description Host3_Ethernet2
   no shutdown
   speed 10g
   channel-group 4 mode active
!
interface Ethernet5
   description Host4_Ethernet2
   no shutdown
   speed 10g
   channel-group 5 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel3 | MLAG_PEER_DC21-CL3_Po3 | switched | trunk | - | - | ['LEAF_PEER_L3', 'MLAG'] | - | - | - | - |
| Port-Channel4 | Host3_PortChannel10 | switched | trunk | 10,20,30,40,50 | - | - | - | - | 4 | - |
| Port-Channel5 | Host4_PortChannel10 | switched | trunk | 10,20,30,40,50 | - | - | - | - | 5 | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel3
   description MLAG_PEER_DC21-CL3_Po3
   no shutdown
   switchport
   switchport mode trunk
   switchport trunk group LEAF_PEER_L3
   switchport trunk group MLAG
!
interface Port-Channel4
   description Host3_PortChannel10
   no shutdown
   switchport
   switchport trunk allowed vlan 10,20,30,40,50
   switchport mode trunk
   mlag 4
   spanning-tree portfast
!
interface Port-Channel5
   description Host4_PortChannel10
   no shutdown
   switchport
   switchport trunk allowed vlan 10,20,30,40,50
   switchport mode trunk
   mlag 5
   spanning-tree portfast
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | EVPN_Overlay_Peering | default | 192.168.100.4/32 |
| Loopback1 | VTEP_VXLAN_Tunnel_Source | default | 192.168.200.3/32 |
| Loopback100 | RED_VTEP_DIAGNOSTICS | RED | 10.100.100.4/32 |
| Loopback101 | BLUE_VTEP_DIAGNOSTICS | BLUE | 10.100.101.4/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | EVPN_Overlay_Peering | default | - |
| Loopback1 | VTEP_VXLAN_Tunnel_Source | default | - |
| Loopback100 | RED_VTEP_DIAGNOSTICS | RED | - |
| Loopback101 | BLUE_VTEP_DIAGNOSTICS | BLUE | - |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description EVPN_Overlay_Peering
   no shutdown
   ip address 192.168.100.4/32
!
interface Loopback1
   description VTEP_VXLAN_Tunnel_Source
   no shutdown
   ip address 192.168.200.3/32
!
interface Loopback100
   description RED_VTEP_DIAGNOSTICS
   no shutdown
   vrf RED
   ip address 10.100.100.4/32
!
interface Loopback101
   description BLUE_VTEP_DIAGNOSTICS
   no shutdown
   vrf BLUE
   ip address 10.100.101.4/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan10 | V10-T-A-VRF-RED | RED | - | False |
| Vlan20 | V20-T-B-VRF-BLUE | BLUE | - | False |
| Vlan30 | V30-T-A-VRF-RED | RED | - | False |
| Vlan40 | V40-T-B-VRF-BLUE | BLUE | - | False |
| Vlan4000 | MLAG_PEER_L3_iBGP: vrf RED | RED | 1500 | False |
| Vlan4001 | MLAG_PEER_L3_iBGP: vrf BLUE | BLUE | 1500 | False |
| Vlan4093 | MLAG_PEER_L3_PEERING | default | 1500 | False |
| Vlan4094 | MLAG_PEER | default | 1500 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan10 |  RED  |  -  |  10.10.10.254/24  |  -  |  -  |  -  |  -  |
| Vlan20 |  BLUE  |  -  |  10.10.20.254/24  |  -  |  -  |  -  |  -  |
| Vlan30 |  RED  |  -  |  10.10.30.254/24  |  -  |  -  |  -  |  -  |
| Vlan40 |  BLUE  |  -  |  10.10.40.254/24  |  -  |  -  |  -  |  -  |
| Vlan4000 |  RED  |  172.16.1.5/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4001 |  BLUE  |  172.16.1.5/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4093 |  default  |  172.16.1.5/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  172.16.0.5/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan10
   description V10-T-A-VRF-RED
   no shutdown
   vrf RED
   ip address virtual 10.10.10.254/24
!
interface Vlan20
   description V20-T-B-VRF-BLUE
   no shutdown
   vrf BLUE
   ip address virtual 10.10.20.254/24
!
interface Vlan30
   description V30-T-A-VRF-RED
   no shutdown
   vrf RED
   ip address virtual 10.10.30.254/24
!
interface Vlan40
   description V40-T-B-VRF-BLUE
   no shutdown
   vrf BLUE
   ip address virtual 10.10.40.254/24
!
interface Vlan4000
   description MLAG_PEER_L3_iBGP: vrf RED
   no shutdown
   mtu 1500
   vrf RED
   ip address 172.16.1.5/31
!
interface Vlan4001
   description MLAG_PEER_L3_iBGP: vrf BLUE
   no shutdown
   mtu 1500
   vrf BLUE
   ip address 172.16.1.5/31
!
interface Vlan4093
   description MLAG_PEER_L3_PEERING
   no shutdown
   mtu 1500
   ip address 172.16.1.5/31
!
interface Vlan4094
   description MLAG_PEER
   no shutdown
   mtu 1500
   no autostate
   ip address 172.16.0.5/31
```

### VXLAN Interface

#### VXLAN Interface Summary

| Setting | Value |
| ------- | ----- |
| Source Interface | Loopback1 |
| UDP port | 4789 |
| EVPN MLAG Shared Router MAC | mlag-system-id |

##### VLAN to VNI, Flood List and Multicast Group Mappings

| VLAN | VNI | Flood List | Multicast Group |
| ---- | --- | ---------- | --------------- |
| 10 | 10010 | - | - |
| 20 | 10020 | - | - |
| 30 | 10030 | - | - |
| 40 | 10040 | - | - |

##### VRF to VNI and Multicast Group Mappings

| VRF | VNI | Multicast Group |
| ---- | --- | --------------- |
| BLUE | 1002 | - |
| RED | 1001 | - |

#### VXLAN Interface Device Configuration

```eos
!
interface Vxlan1
   description DC21-CL4_VTEP
   vxlan source-interface Loopback1
   vxlan virtual-router encapsulation mac-address mlag-system-id
   vxlan udp-port 4789
   vxlan vlan 10 vni 10010
   vxlan vlan 20 vni 10020
   vxlan vlan 30 vni 10030
   vxlan vlan 40 vni 10040
   vxlan vrf BLUE vni 1002
   vxlan vrf RED vni 1001
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

Virtual Router MAC Address: 00:1c:73:00:dc:01

#### Virtual Router MAC Address Device Configuration

```eos
!
ip virtual-router mac-address 00:1c:73:00:dc:01
```

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |
| BLUE | True |
| MGMT | False |
| RED | True |

#### IP Routing Device Configuration

```eos
!
ip routing
no ip icmp redirect
ip routing vrf BLUE
no ip routing vrf MGMT
ip routing vrf RED
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| BLUE | false |
| MGMT | false |
| RED | false |

### ARP

Global ARP timeout: 1500

#### ARP Device Configuration

```eos
!
arp aging timeout default 1500
```

### Router BGP

ASN Notation: asdot

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65000.3 | 192.168.100.4 |

| BGP Tuning |
| ---------- |
| timers bgp 5 15 |
| neighbor default send-community |
| graceful-restart restart-time 300 |
| graceful-restart |
| update wait-install |
| no bgp default ipv4-unicast |
| distance bgp 20 200 200 |
| maximum-paths 128 ecmp 128 |

#### Router BGP Peer Groups

##### EVPN-OVERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | evpn |
| Remote AS | 65000.3 |
| Source | Loopback0 |
| BFD | True |
| Send community | all |
| Maximum routes | 0 (no limit) |

##### IPv4-UNDERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Send community | all |
| Maximum routes | 12000 |

##### MLAG-IPv4-UNDERLAY-PEER

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Remote AS | 65000.3 |
| Next-hop self | True |
| Send community | all |
| Maximum routes | 12000 |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 172.16.1.4 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | default | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |
| 192.168.1.12 | 65000.0 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - | - | - | - |
| 192.168.1.14 | 65000.0 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - | - | - | - |
| 192.168.100.249 | Inherited from peer group EVPN-OVERLAY-PEERS | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 192.168.100.250 | Inherited from peer group EVPN-OVERLAY-PEERS | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.16.1.4 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | BLUE | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |
| 172.16.1.4 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | RED | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| EVPN-OVERLAY-PEERS | True | default |

#### Router BGP VLANs

| VLAN | Route-Distinguisher | Both Route-Target | Import Route Target | Export Route-Target | Redistribute |
| ---- | ------------------- | ----------------- | ------------------- | ------------------- | ------------ |
| 10 | 192.168.100.4:10010 | 10010:10010 | - | - | learned |
| 20 | 192.168.100.4:10020 | 10020:10020 | - | - | learned |
| 30 | 192.168.100.4:10030 | 10030:10030 | - | - | learned |
| 40 | 192.168.100.4:10040 | 10040:10040 | - | - | learned |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| BLUE | 192.168.100.4:1002 | connected |
| RED | 192.168.100.4:1001 | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 65000.3
   bgp asn notation asdot
   router-id 192.168.100.4
   distance bgp 20 200 200
   graceful-restart restart-time 300
   graceful-restart
   maximum-paths 128 ecmp 128
   update wait-install
   no bgp default ipv4-unicast
   timers bgp 5 15
   neighbor default send-community
   neighbor EVPN-OVERLAY-PEERS peer group
   neighbor EVPN-OVERLAY-PEERS remote-as 65000.3
   neighbor EVPN-OVERLAY-PEERS update-source Loopback0
   neighbor EVPN-OVERLAY-PEERS bfd
   neighbor EVPN-OVERLAY-PEERS password 7 <removed>
   neighbor EVPN-OVERLAY-PEERS send-community
   neighbor EVPN-OVERLAY-PEERS maximum-routes 0
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor IPv4-UNDERLAY-PEERS password 7 <removed>
   neighbor IPv4-UNDERLAY-PEERS send-community
   neighbor IPv4-UNDERLAY-PEERS maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER peer group
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65000.3
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description DC21-CL3
   neighbor MLAG-IPv4-UNDERLAY-PEER password 7 <removed>
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor 172.16.1.4 peer group MLAG-IPv4-UNDERLAY-PEER
   neighbor 172.16.1.4 description DC21-CL3
   neighbor 192.168.1.12 peer group IPv4-UNDERLAY-PEERS
   neighbor 192.168.1.12 remote-as 65000.0
   neighbor 192.168.1.12 description DC21-SP1_Ethernet4
   neighbor 192.168.1.14 peer group IPv4-UNDERLAY-PEERS
   neighbor 192.168.1.14 remote-as 65000.0
   neighbor 192.168.1.14 description DC21-SP2_Ethernet4
   neighbor 192.168.100.249 peer group EVPN-OVERLAY-PEERS
   neighbor 192.168.100.249 description DC21-SP1
   neighbor 192.168.100.250 peer group EVPN-OVERLAY-PEERS
   neighbor 192.168.100.250 description DC21-SP2
   redistribute connected route-map RM-CONN-2-BGP
   !
   vlan 10
      rd 192.168.100.4:10010
      route-target both 10010:10010
      redistribute learned
   !
   vlan 20
      rd 192.168.100.4:10020
      route-target both 10020:10020
      redistribute learned
   !
   vlan 30
      rd 192.168.100.4:10030
      route-target both 10030:10030
      redistribute learned
   !
   vlan 40
      rd 192.168.100.4:10040
      route-target both 10040:10040
      redistribute learned
   !
   address-family evpn
      neighbor EVPN-OVERLAY-PEERS route-map RM-EVPN-SOO-IN in
      neighbor EVPN-OVERLAY-PEERS route-map RM-EVPN-SOO-OUT out
      neighbor EVPN-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-PEERS activate
      neighbor IPv4-UNDERLAY-PEERS activate
      neighbor MLAG-IPv4-UNDERLAY-PEER activate
   !
   vrf BLUE
      rd 192.168.100.4:1002
      route-target import evpn 1002:1002
      route-target export evpn 1002:1002
      router-id 192.168.100.4
      update wait-install
      neighbor 172.16.1.4 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
   !
   vrf RED
      rd 192.168.100.4:1001
      route-target import evpn 1001:1001
      route-target export evpn 1001:1001
      router-id 192.168.100.4
      update wait-install
      neighbor 172.16.1.4 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
```

## BFD

### Router BFD

#### Router BFD Multihop Summary

| Interval | Minimum RX | Multiplier |
| -------- | ---------- | ---------- |
| 3000 | 3000 | 3 |

#### Router BFD Device Configuration

```eos
!
router bfd
   multihop interval 3000 min-rx 3000 multiplier 3
```

## Multicast

### IP IGMP Snooping

#### IP IGMP Snooping Summary

| IGMP Snooping | Fast Leave | Interface Restart Query | Proxy | Restart Query Interval | Robustness Variable |
| ------------- | ---------- | ----------------------- | ----- | ---------------------- | ------------------- |
| Disabled | - | - | - | - | - |

#### IP IGMP Snooping Device Configuration

```eos
!
no ip igmp snooping
```

## Filters

### Prefix-lists

#### Prefix-lists Summary

##### PL-LOOPBACKS-EVPN-OVERLAY

| Sequence | Action |
| -------- | ------ |
| 10 | permit 192.168.100.0/24 eq 32 |
| 20 | permit 192.168.200.0/24 eq 32 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 192.168.100.0/24 eq 32
   seq 20 permit 192.168.200.0/24 eq 32
```

### Route-maps

#### Route-maps Summary

##### RM-CONN-2-BGP

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY | - | - | - |

##### RM-EVPN-SOO-IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | deny | extcommunity ECL-EVPN-SOO | - | - | - |
| 20 | permit | - | - | - | - |

##### RM-EVPN-SOO-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | extcommunity soo 192.168.200.3:1 additive | - | - |

##### RM-MLAG-PEER-IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | origin incomplete | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-CONN-2-BGP permit 10
   match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY
!
route-map RM-EVPN-SOO-IN deny 10
   match extcommunity ECL-EVPN-SOO
!
route-map RM-EVPN-SOO-IN permit 20
!
route-map RM-EVPN-SOO-OUT permit 10
   set extcommunity soo 192.168.200.3:1 additive
!
route-map RM-MLAG-PEER-IN permit 10
   description Make routes learned over MLAG Peer-link less preferred on spines to ensure optimal routing
   set origin incomplete
```

### IP Extended Community Lists

#### IP Extended Community Lists Summary

| List Name | Type | Extended Communities |
| --------- | ---- | -------------------- |
| ECL-EVPN-SOO | permit | soo 192.168.200.3:1 |

#### IP Extended Community Lists Device Configuration

```eos
!
ip extcommunity-list ECL-EVPN-SOO permit soo 192.168.200.3:1
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| BLUE | enabled |
| MGMT | disabled |
| RED | enabled |

### VRF Instances Device Configuration

```eos
!
vrf instance BLUE
!
vrf instance MGMT
!
vrf instance RED
```

## Virtual Source NAT

### Virtual Source NAT Summary

| Source NAT VRF | Source NAT IP Address |
| -------------- | --------------------- |
| BLUE | 10.100.101.4 |
| RED | 10.100.100.4 |

### Virtual Source NAT Configuration

```eos
!
ip address virtual source-nat vrf BLUE address 10.100.101.4
ip address virtual source-nat vrf RED address 10.100.100.4
```

## Errdisable

### Errdisable Summary



```eos
!
errdisable recovery interval 30
```
