# WAN repositiory issues to be fixed:

- remove default addiition of rr_overlay peer-group > currently legacy-clients is added here but not a good solution, needs fixing for this

- remove default addition of "redistribute connected" from under per vrf in router bgp
 >> fixed with setting redistribute to null;
 >> this has a fix in 5.0 (issue4091)

- remove default addition of ""update wait-install" redistribute connected ""from under per vrf in router bgp
>> fixed with structured_config per vrf setting

- remove default addition of no passive-interface <eth_id> from router ospf
>> fixed with custom_structured_config

- fix- ospf authentication using eos_designs > "underlay_ospf_authentication"

- fix - mpls ldp igp sync default config
>> fixed with structured config in p2p_links; need to check if port-profile can be used for this

- remove default addition of rt import for rt:rt generated
>> fixed with rt_override;


###

move the SNMP vrf settings
remove transreceievr 4x10G
check the mismatch in the terminattr config
add in ip dhcp relay interformation option
stp mst 1 priority 4096 >> will not be needed to be discussed

