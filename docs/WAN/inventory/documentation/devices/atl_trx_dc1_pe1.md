# ATL_TRX_DC1_PE1

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
- [Prompt Device Configuration](#prompt-device-configuration)
- [Aliases Device Configuration](#aliases-device-configuration)
- [System Boot Settings](#system-boot-settings)
  - [Boot Secret Summary](#boot-secret-summary)
  - [System Boot Device Configuration](#system-boot-device-configuration)
- [Monitoring](#monitoring)
  - [TerminAttr Daemon](#terminattr-daemon)
  - [Logging](#logging)
  - [SNMP](#snmp)
  - [SFlow](#sflow)
- [Internal VLAN Allocation Policy](#internal-vlan-allocation-policy)
  - [Internal VLAN Allocation Policy Summary](#internal-vlan-allocation-policy-summary)
  - [Internal VLAN Allocation Policy Device Configuration](#internal-vlan-allocation-policy-device-configuration)
- [VLANs](#vlans)
  - [VLANs Summary](#vlans-summary)
  - [VLANs Device Configuration](#vlans-device-configuration)
- [Interfaces](#interfaces)
  - [Interface Defaults](#interface-defaults)
  - [Ethernet Interfaces](#ethernet-interfaces)
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

#### IP Name Servers Device Configuration

```eos
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
| sdadmin | 15 | network-admin | False | - |

#### Local Users Device Configuration

```eos
!
no username admin
username netsupport privilege 15 role network-admin secret sha512 <removed>
username sdadmin privilege 15 role network-admin secret sha512 <removed>
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

## Prompt Device Configuration

```eos
!
prompt %H%v[%D{%H:%M:%S}]%P
```

## Aliases Device Configuration

```eos
alias c bash clear

!
```

## System Boot Settings

### Boot Secret Summary

- The sha512 hashed Aboot password is configured

### System Boot Device Configuration

```eos
!
boot secret sha512 <removed>
```

## Monitoring

### TerminAttr Daemon

#### TerminAttr Daemon Summary

| CV Compression | CloudVision Servers | VRF | Authentication | Smash Excludes | Ingest Exclude | Bypass AAA |
| -------------- | ------------------- | --- | -------------- | -------------- | -------------- | ---------- |
| gzip | 10.158.11.41:9910 | MGMT | token,tmp/token | ale,flexCounter,hardware,kni,pulse,strata | - | False |

#### TerminAttr Daemon Device Configuration

```eos
!
daemon TerminAttr
   exec /usr/bin/TerminAttr -cvaddr=10.158.11.41:9910 -cvauth=token,tmp/token -cvvrf=MGMT -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -taillogs
   no shutdown
```

### Logging

#### Logging Servers and Features Summary

| Type | Level |
| -----| ----- |
| Console | warnings |
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

#### Logging Servers and Features Device Configuration

```eos
!
logging buffered 10000
logging trap debugging
logging console warnings
logging vrf MGMT host 10.0.249.172 9107
logging vrf MGMT host log.usaa.com 7036
logging format timestamp high-resolution
logging vrf MGMT source-interface Management1
```

### SNMP

#### SNMP Configuration Summary

| Contact | Location | SNMP Traps | State |
| ------- | -------- | ---------- | ----- |
| nsho_provider_networks | ATL_TRX_DC1_P | All | Enabled |
| nsho_provider_networks | ATL_TRX_DC1_P |  | Enabled |
| nsho_provider_networks | ATL_TRX_DC1_P | bgp backward-transition, bridge | Disabled |

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
snmp-server location ATL_TRX_DC1_P
snmp-server vrf MGMT local-interface Management1
snmp-server view READALL ISO included
snmp-server group CAPC v3 auth read READALL
snmp-server group READONLY v3 priv read READALL
snmp-server user NETSVC_NETBRAIN_TEST READONLY v3 localized 9e053c85167ef4b9835b66d280f13688729785ea auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETBRAIN READONLY v3 localized 9e053c85167ef4b9835b66d280f13688729785ea auth sha <removed> priv aes <removed>
snmp-server user SERVICENOW READONLY v3 localized 9e053c85167ef4b9835b66d280f13688729785ea auth sha <removed> priv aes <removed>
snmp-server user NETSVC_NETSCOUT READONLY v3 localized 9e053c85167ef4b9835b66d280f13688729785ea auth sha <removed> priv aes <removed>
snmp-server user NETSVC_SPECTRUM READONLY v3 localized 9e053c85167ef4b9835b66d280f13688729785ea auth sha <removed> priv aes <removed>
snmp-server user sdadmin CAPC v3 localized 9e053c85167ef4b9835b66d280f13688729785ea auth md5 <removed>
snmp-server host proddxnspv1lsat.usaa.com vrf MGMT version 3 auth sdadmin
snmp-server host proddxnspv2lsat.usaa.com vrf MGMT version 3 auth sdadmin
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

### Interface Defaults

#### Interface Defaults Summary

- Default Routed Interface MTU: 9214

#### Interface Defaults Device Configuration

```eos
!
interface defaults
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
| Port-Channel110.100 | CE | l3dot1q | - | 100 |

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet25/1 | P2P_LINK_TO_atl_trx_dc1_p1_Ethernet25/1 | routed | - | 10.199.2.43/31 | default | 1500 | False | - | - |
| Ethernet26/1 | P2P_LINK_TO_atl_trx_dc1_p2_Ethernet25/1 | routed | - | 10.199.2.45/31 | default | 1500 | False | - | - |
| Port-Channel110.100 | CE | l3dot1q | - | 10.64.0.6 | BUSINTEL | - | False | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet25/1
   description P2P_LINK_TO_atl_trx_dc1_p1_Ethernet25/1
   no shutdown
   mtu 1500
   mac security profile MKA_AES_256
   no switchport
   ip address 10.199.2.43/31
   mpls ldp igp sync
   mpls ldp interface
   mpls ip
   ip ospf network point-to-point
   ip ospf area 0.0.0.0
!
interface Ethernet26/1
   description P2P_LINK_TO_atl_trx_dc1_p2_Ethernet25/1
   no shutdown
   mtu 1500
   mac security profile MKA_AES_256
   no switchport
   ip address 10.199.2.45/31
   mpls ldp igp sync
   mpls ldp interface
   mpls ip
   ip ospf network point-to-point
   ip ospf area 0.0.0.0
!
interface Port-Channel110
   no shutdown
   no switchport
!
interface Port-Channel110.100
   description CE
   no shutdown
   encapsulation dot1q vlan 100
   vrf BUSINTEL
   ip address 10.64.0.6
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | MPLS_Overlay_peering | default | 10.199.0.1/32 |

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
   ip address 10.199.0.1/32
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
| MGMT | False |

#### IP Routing Device Configuration

```eos
!
ip routing
ip routing vrf BUSINTEL
no ip routing vrf MGMT
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| BUSINTEL | false |
| MGMT | false |

### Router OSPF

#### Router OSPF Summary

| Process ID | Router ID | Default Passive Interface | No Passive Interface | BFD | Max LSA | Default Information Originate | Log Adjacency Changes Detail | Auto Cost Reference Bandwidth | Maximum Paths | MPLS LDP Sync Default | Distribute List In |
| ---------- | --------- | ------------------------- | -------------------- | --- | ------- | ----------------------------- | ---------------------------- | ----------------------------- | ------------- | --------------------- | ------------------ |
| 64800 | 10.199.0.1 | enabled | Ethernet25/1 <br> Ethernet26/1 <br> | enabled | 12000 | disabled | disabled | - | - | - | - |

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
   router-id 10.199.0.1
   passive-interface default
   no passive-interface Ethernet25/1
   no passive-interface Ethernet26/1
   bfd default
   max-lsa 12000
```

### Router BGP

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 64800 | 10.199.0.1 |

| BGP Tuning |
| ---------- |
| distance bgp 20 200 200 |
| neighbor default send-community |
| maximum-paths 2 ecmp 2 |
| bgp bestpath tie-break router-id |
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
| Send community | extended |
| Maximum routes | 0 (no limit) |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 10.255.2.1 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - | - | - |
| 10.255.2.2 | Inherited from peer group RR_PEERS | default | - | Inherited from peer group RR_PEERS | Inherited from peer group RR_PEERS | - | Inherited from peer group RR_PEERS | - | - | - | - |
| 10.64.0.5 | Inherited from peer group PE_CE_DC_PROD_SI_BUSINTEL | BUSINTEL | - | Inherited from peer group PE_CE_DC_PROD_SI_BUSINTEL | Inherited from peer group PE_CE_DC_PROD_SI_BUSINTEL | - | Inherited from peer group PE_CE_DC_PROD_SI_BUSINTEL | - | - | - | - |

#### Router BGP VPN-IPv4 Address Family

##### VPN-IPv4 Peer Groups

| Peer Group | Activate | Route-map In | Route-map Out | RCF In | RCF Out |
| ---------- | -------- | ------------ | ------------- | ------ | ------- |
| RR_PEERS | True | - | - | - | - |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| BUSINTEL | 10.199.0.1:100 | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 64800
   router-id 10.199.0.1
   maximum-paths 4 ecmp 4
   update wait-install
   no bgp default ipv4-unicast
   distance bgp 20 200 200
   neighbor default send-community
   maximum-paths 2 ecmp 2
   bgp bestpath tie-break router-id
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
   neighbor RR_PEERS send-community extended
   neighbor RR_PEERS maximum-routes 0
   neighbor 10.255.2.1 peer group RR_PEERS
   neighbor 10.255.2.1 description DFW-TRX1-DALEQ-RR1
   neighbor 10.255.2.2 peer group RR_PEERS
   neighbor 10.255.2.2 description IAD-TRX1-DC21-RR1
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
   !
   vrf BUSINTEL
      rd 10.199.0.1:100
      route-target import vpn-ipv4 100:100
      route-target import vpn-ipv4 64536:910
      route-target export vpn-ipv4 100:100
      router-id 10.199.0.1
      update wait-install
      neighbor 10.64.0.5 peer group PE_CE_DC_PROD_SI_BUSINTEL
      neighbor 10.64.0.5 description ATL-SI1-DC1-N1
      redistribute connected
      !
      address-family ipv4
         neighbor 10.64.0.5 activate
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

## MPLS

### MPLS and LDP

#### MPLS and LDP Summary

| Setting | Value |
| -------- | ---- |
| MPLS IP Enabled | True |
| LDP Enabled | True |
| LDP Router ID | 10.199.0.1 |
| LDP Interface Disabled Default | True |
| LDP Transport-Address Interface | Loopback0 |

#### MPLS and LDP Device Configuration

```eos
!
mpls ip
!
mpls ldp
   interface disabled default
   router-id 10.199.0.1
   no shutdown
   transport-address interface Loopback0
```

### MPLS Interfaces

| Interface | MPLS IP Enabled | LDP Enabled | IGP Sync |
| --------- | --------------- | ----------- | -------- |
| Ethernet25/1 | True | True | True |
| Ethernet26/1 | True | True | True |
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
!
ip access-list DEF2
   10 permit tcp any any eq 8081
   20 permit icmp any any
   30 permit ip any any tracked
   40 permit udp any any eq bfd ttl eq 255
   50 permit udp any any eq bfd-echo ttl eq 254
   60 permit udp any any eq multihop-bfd micro-bfd sbfd
   70 permit udp any eq sbfd any eq sbfd-initiator
   80 permit ospf any any
   90 permit tcp any any eq ssh telnet www snmp bgp https msdp ldp netconf-ssh gnmi
   100 permit udp any any eq bootps bootpc ntp snmp ptp-event ptp-general rip ldp
   110 permit tcp any any eq mlag ttl eq 255
   120 permit udp any any eq mlag ttl eq 255
   130 permit vrrp any any
   140 permit ahp any any
   150 permit pim any any
   160 permit igmp any any
   170 permit tcp any any range 5900 5910
   180 permit tcp any any range 50000 50100
   190 permit udp any any range 51000 51100
   200 permit tcp any any eq 3333
   210 permit tcp any any eq nat ttl eq 255
   220 permit tcp any eq bgp any
   230 permit rsvp any any
   240 permit tcp any any eq 9340
   250 permit tcp any any eq 9559
   260 permit udp any any eq 8503
   270 permit udp any any eq lsp-ping
   280 permit udp any eq lsp-ping any
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| BUSINTEL | enabled |
| MGMT | disabled |

### VRF Instances Device Configuration

```eos
!
vrf instance BUSINTEL
!
vrf instance MGMT
```

## MACsec

### MACsec Summary

License is not installed.


#### MACsec Profiles Summary

##### Profile MKA_AES_256

###### Settings

| Cipher | Key-Server Priority | Rekey-Period | SCI |
| ------ | ------------------- | ------------ | --- |
| aes256-gcm | 60 | - | True |

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
! note: eos_cli follows
management ssh
  authentication mode password
!
arp aging timeout default 900
!
system control-plane
 ip access-group DEF2 vrf MGMT in
 ip access-group DEF2 in
!
mac security
  profile MKA_AES_256
    cipher aes256-gcm
    key 0100000000000000000000000000000000000000000000000000000000000000 7 13031216090D057A7B7478636572435746535106090803045E534846090807030205045B0B56570807544356540B5B565F711C1E59495547425B5C547A7B747863
    mka key-server priority 255
    sci
```
