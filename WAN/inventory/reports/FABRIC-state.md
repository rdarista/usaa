
# Validate State Report

**Table of Contents:**

- [Validate State Report](validate-state-report)
  - [Test Results Summary](#test-results-summary)
  - [Failed Test Results Summary](#failed-test-results-summary)
  - [All Test Results](#all-test-results)

## Test Results Summary

### Summary Totals

| Total Tests | Total Tests Passed | Total Tests Failed |
| ----------- | ------------------ | ------------------ |
| 1020 | 777 | 243 |

### Summary Totals Devices Under Tests

| DUT | Total Tests | Tests Passed | Tests Failed | Categories Failed |
| --- | ----------- | ------------ | ------------ | ----------------- |
| DC-1-CL-1 |  65 | 53 | 12 | Routing Table, Loopback0 Reachability |
| DC-1-CL-2 |  65 | 53 | 12 | Routing Table, Loopback0 Reachability |
| DC-1-CL-3 |  65 | 53 | 12 | Routing Table, Loopback0 Reachability |
| DC-1-CL-4 |  65 | 53 | 12 | Routing Table, Loopback0 Reachability |
| DC-1-SL-1 |  72 | 60 | 12 | Routing Table, Loopback0 Reachability |
| DC-1-SL-2 |  72 | 60 | 12 | Routing Table, Loopback0 Reachability |
| DC-1-SL-3 |  70 | 58 | 12 | Routing Table, Loopback0 Reachability |
| DC-1-SL-4 |  70 | 58 | 12 | Routing Table, Loopback0 Reachability |
| DC-1-SP-1 |  67 | 59 | 8 | Routing Table, Loopback0 Reachability |
| DC-1-SP-2 |  67 | 59 | 8 | Routing Table, Loopback0 Reachability |
| DC-2-CL-1 |  61 | 36 | 25 | Interface State, Routing Table, Loopback0 Reachability |
| DC-2-CL-2 |  59 | 35 | 24 | Routing Table, Loopback0 Reachability |
| DC-2-SL-1 |  64 | 40 | 24 | Routing Table, Loopback0 Reachability |
| DC-2-SL-2 |  64 | 38 | 26 | Interface State, Routing Table, Loopback0 Reachability |
| DC-2-SP-1 |  47 | 31 | 16 | Routing Table, Loopback0 Reachability |
| DC-2-SP-2 |  47 | 31 | 16 | Routing Table, Loopback0 Reachability |

### Summary Totals Per Category

| Test Category | Total Tests | Tests Passed | Tests Failed |
| ------------- | ----------- | ------------ | ------------ |
| NTP |  16 | 16 | 0 |
| Interface State |  268 | 265 | 3 |
| LLDP Topology |  48 | 48 | 0 |
| IP Reachability |  48 | 48 | 0 |
| BGP |  112 | 112 | 0 |
| Routing Table |  336 | 184 | 152 |
| Loopback0 Reachability |  192 | 104 | 88 |

## Failed Test Results Summary

| Test ID | Node | Test Category | Test Description | Test | Test Result | Failure Reason |
| ------- | ---- | ------------- | ---------------- | ---- | ----------- | -------------- |
| 75 | DC-2-SL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - firewalls_Eth1 | FAIL | interface status: down - line protocol status: down |
| 95 | DC-2-CL-1 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel5 - server02_PortChannel2 | FAIL | interface status: down - line protocol status: lowerLayerDown |
| 98 | DC-2-SL-2 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel4 - firewalls_PortChanne1 | FAIL | interface status: down - line protocol status: down |
| 501 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 502 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 503 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 504 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 513 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 514 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 515 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 516 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 525 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 526 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 527 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 528 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 537 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 538 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 539 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 540 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 549 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 550 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 551 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 552 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 561 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 562 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 563 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 564 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 573 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 574 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 575 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 576 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 585 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 586 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 587 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 588 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 589 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.3 | FAIL | Lo1 192.168.5.3 is not in the routing table |
| 590 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.4 | FAIL | Lo1 192.168.5.4 is not in the routing table |
| 591 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.5 | FAIL | Lo1 192.168.5.5 is not in the routing table |
| 592 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.6 | FAIL | Lo1 192.168.5.6 is not in the routing table |
| 593 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.7 | FAIL | Lo1 192.168.5.7 is not in the routing table |
| 594 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.8 | FAIL | Lo1 192.168.5.8 is not in the routing table |
| 595 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.9 | FAIL | Lo1 192.168.5.9 is not in the routing table |
| 596 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.10 | FAIL | Lo1 192.168.5.10 is not in the routing table |
| 601 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.3 | FAIL | Lo1 192.168.5.3 is not in the routing table |
| 602 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.4 | FAIL | Lo1 192.168.5.4 is not in the routing table |
| 603 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.5 | FAIL | Lo1 192.168.5.5 is not in the routing table |
| 604 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.6 | FAIL | Lo1 192.168.5.6 is not in the routing table |
| 605 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.7 | FAIL | Lo1 192.168.5.7 is not in the routing table |
| 606 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.8 | FAIL | Lo1 192.168.5.8 is not in the routing table |
| 607 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.9 | FAIL | Lo1 192.168.5.9 is not in the routing table |
| 608 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.10 | FAIL | Lo1 192.168.5.10 is not in the routing table |
| 613 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.3 | FAIL | Lo1 192.168.5.3 is not in the routing table |
| 614 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.4 | FAIL | Lo1 192.168.5.4 is not in the routing table |
| 615 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.5 | FAIL | Lo1 192.168.5.5 is not in the routing table |
| 616 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.6 | FAIL | Lo1 192.168.5.6 is not in the routing table |
| 617 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.7 | FAIL | Lo1 192.168.5.7 is not in the routing table |
| 618 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.8 | FAIL | Lo1 192.168.5.8 is not in the routing table |
| 619 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.9 | FAIL | Lo1 192.168.5.9 is not in the routing table |
| 620 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.10 | FAIL | Lo1 192.168.5.10 is not in the routing table |
| 625 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.3 | FAIL | Lo1 192.168.5.3 is not in the routing table |
| 626 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.4 | FAIL | Lo1 192.168.5.4 is not in the routing table |
| 627 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.5 | FAIL | Lo1 192.168.5.5 is not in the routing table |
| 628 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.6 | FAIL | Lo1 192.168.5.6 is not in the routing table |
| 629 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.7 | FAIL | Lo1 192.168.5.7 is not in the routing table |
| 630 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.8 | FAIL | Lo1 192.168.5.8 is not in the routing table |
| 631 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.9 | FAIL | Lo1 192.168.5.9 is not in the routing table |
| 632 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.10 | FAIL | Lo1 192.168.5.10 is not in the routing table |
| 645 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 646 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 647 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 648 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 657 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 658 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 659 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 660 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 669 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 670 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 671 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 672 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 681 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 682 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 683 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 684 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 693 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 694 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 695 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 696 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 705 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 706 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 707 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 708 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 717 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 718 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 719 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 720 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 729 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 730 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 731 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 732 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 741 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 742 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 743 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 744 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 753 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 754 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 755 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 756 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 757 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.3 | FAIL | Lo0 192.168.4.3 is not in the routing table |
| 758 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.4 | FAIL | Lo0 192.168.4.4 is not in the routing table |
| 759 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.5 | FAIL | Lo0 192.168.4.5 is not in the routing table |
| 760 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.6 | FAIL | Lo0 192.168.4.6 is not in the routing table |
| 761 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.7 | FAIL | Lo0 192.168.4.7 is not in the routing table |
| 762 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.8 | FAIL | Lo0 192.168.4.8 is not in the routing table |
| 763 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.9 | FAIL | Lo0 192.168.4.9 is not in the routing table |
| 764 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.10 | FAIL | Lo0 192.168.4.10 is not in the routing table |
| 769 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.3 | FAIL | Lo0 192.168.4.3 is not in the routing table |
| 770 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.4 | FAIL | Lo0 192.168.4.4 is not in the routing table |
| 771 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.5 | FAIL | Lo0 192.168.4.5 is not in the routing table |
| 772 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.6 | FAIL | Lo0 192.168.4.6 is not in the routing table |
| 773 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.7 | FAIL | Lo0 192.168.4.7 is not in the routing table |
| 774 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.8 | FAIL | Lo0 192.168.4.8 is not in the routing table |
| 775 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.9 | FAIL | Lo0 192.168.4.9 is not in the routing table |
| 776 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.10 | FAIL | Lo0 192.168.4.10 is not in the routing table |
| 781 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.3 | FAIL | Lo0 192.168.4.3 is not in the routing table |
| 782 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.4 | FAIL | Lo0 192.168.4.4 is not in the routing table |
| 783 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.5 | FAIL | Lo0 192.168.4.5 is not in the routing table |
| 784 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.6 | FAIL | Lo0 192.168.4.6 is not in the routing table |
| 785 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.7 | FAIL | Lo0 192.168.4.7 is not in the routing table |
| 786 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.8 | FAIL | Lo0 192.168.4.8 is not in the routing table |
| 787 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.9 | FAIL | Lo0 192.168.4.9 is not in the routing table |
| 788 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.10 | FAIL | Lo0 192.168.4.10 is not in the routing table |
| 793 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.3 | FAIL | Lo0 192.168.4.3 is not in the routing table |
| 794 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.4 | FAIL | Lo0 192.168.4.4 is not in the routing table |
| 795 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.5 | FAIL | Lo0 192.168.4.5 is not in the routing table |
| 796 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.6 | FAIL | Lo0 192.168.4.6 is not in the routing table |
| 797 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.7 | FAIL | Lo0 192.168.4.7 is not in the routing table |
| 798 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.8 | FAIL | Lo0 192.168.4.8 is not in the routing table |
| 799 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.9 | FAIL | Lo0 192.168.4.9 is not in the routing table |
| 800 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.10 | FAIL | Lo0 192.168.4.10 is not in the routing table |
| 805 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.3 | FAIL | Lo0 192.168.4.3 is not in the routing table |
| 806 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.4 | FAIL | Lo0 192.168.4.4 is not in the routing table |
| 807 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.5 | FAIL | Lo0 192.168.4.5 is not in the routing table |
| 808 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.6 | FAIL | Lo0 192.168.4.6 is not in the routing table |
| 809 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.7 | FAIL | Lo0 192.168.4.7 is not in the routing table |
| 810 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.8 | FAIL | Lo0 192.168.4.8 is not in the routing table |
| 811 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.9 | FAIL | Lo0 192.168.4.9 is not in the routing table |
| 812 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.10 | FAIL | Lo0 192.168.4.10 is not in the routing table |
| 817 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.3 | FAIL | Lo0 192.168.4.3 is not in the routing table |
| 818 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.4 | FAIL | Lo0 192.168.4.4 is not in the routing table |
| 819 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.5 | FAIL | Lo0 192.168.4.5 is not in the routing table |
| 820 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.6 | FAIL | Lo0 192.168.4.6 is not in the routing table |
| 821 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.7 | FAIL | Lo0 192.168.4.7 is not in the routing table |
| 822 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.8 | FAIL | Lo0 192.168.4.8 is not in the routing table |
| 823 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.9 | FAIL | Lo0 192.168.4.9 is not in the routing table |
| 824 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.10 | FAIL | Lo0 192.168.4.10 is not in the routing table |
| 837 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 838 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 839 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 840 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 849 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 850 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 851 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 852 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 861 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 862 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 863 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 864 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 873 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 874 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 875 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 876 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 885 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 886 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 887 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 888 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 897 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 898 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 899 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 900 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 909 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 910 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 911 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 912 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 921 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 922 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 923 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 924 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 933 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 934 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 935 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 936 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 945 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 946 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 947 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 948 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 949 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.3 | FAIL | 100% packet loss |
| 950 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.4 | FAIL | 100% packet loss |
| 951 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.5 | FAIL | 100% packet loss |
| 952 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.6 | FAIL | 100% packet loss |
| 953 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.7 | FAIL | 100% packet loss |
| 954 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.8 | FAIL | 100% packet loss |
| 955 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.9 | FAIL | 100% packet loss |
| 956 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.10 | FAIL | 100% packet loss |
| 961 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.3 | FAIL | 100% packet loss |
| 962 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.4 | FAIL | 100% packet loss |
| 963 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.5 | FAIL | 100% packet loss |
| 964 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.6 | FAIL | 100% packet loss |
| 965 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.7 | FAIL | 100% packet loss |
| 966 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.8 | FAIL | 100% packet loss |
| 967 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.9 | FAIL | 100% packet loss |
| 968 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.10 | FAIL | 100% packet loss |
| 973 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.3 | FAIL | 100% packet loss |
| 974 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.4 | FAIL | 100% packet loss |
| 975 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.5 | FAIL | 100% packet loss |
| 976 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.6 | FAIL | 100% packet loss |
| 977 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.7 | FAIL | 100% packet loss |
| 978 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.8 | FAIL | 100% packet loss |
| 979 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.9 | FAIL | 100% packet loss |
| 980 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.10 | FAIL | 100% packet loss |
| 985 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.3 | FAIL | 100% packet loss |
| 986 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.4 | FAIL | 100% packet loss |
| 987 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.5 | FAIL | 100% packet loss |
| 988 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.6 | FAIL | 100% packet loss |
| 989 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.7 | FAIL | 100% packet loss |
| 990 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.8 | FAIL | 100% packet loss |
| 991 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.9 | FAIL | 100% packet loss |
| 992 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.10 | FAIL | 100% packet loss |
| 997 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.3 | FAIL | 100% packet loss |
| 998 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.4 | FAIL | 100% packet loss |
| 999 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.5 | FAIL | 100% packet loss |
| 1000 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.6 | FAIL | 100% packet loss |
| 1001 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.7 | FAIL | 100% packet loss |
| 1002 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.8 | FAIL | 100% packet loss |
| 1003 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.9 | FAIL | 100% packet loss |
| 1004 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.10 | FAIL | 100% packet loss |
| 1009 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.3 | FAIL | 100% packet loss |
| 1010 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.4 | FAIL | 100% packet loss |
| 1011 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.5 | FAIL | 100% packet loss |
| 1012 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.6 | FAIL | 100% packet loss |
| 1013 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.7 | FAIL | 100% packet loss |
| 1014 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.8 | FAIL | 100% packet loss |
| 1015 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.9 | FAIL | 100% packet loss |
| 1016 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.10 | FAIL | 100% packet loss |

## All Test Results

| Test ID | Node | Test Category | Test Description | Test | Test Result | Failure Reason |
| ------- | ---- | ------------- | ---------------- | ---- | ----------- | -------------- |
| 1 | DC-1-CL-1 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 2 | DC-1-CL-2 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 3 | DC-1-CL-3 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 4 | DC-1-CL-4 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 5 | DC-1-SL-1 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 6 | DC-1-SL-2 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 7 | DC-1-SL-3 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 8 | DC-1-SL-4 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 9 | DC-1-SP-1 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 10 | DC-1-SP-2 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 11 | DC-2-CL-1 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 12 | DC-2-CL-2 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 13 | DC-2-SL-1 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 14 | DC-2-SL-2 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 15 | DC-2-SP-1 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 16 | DC-2-SP-2 | NTP | Synchronised with NTP server | NTP | PASS |  |
| 17 | DC-1-CL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-1-SP-1_Ethernet1 | PASS |  |
| 18 | DC-1-CL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-1-SP-2_Ethernet1 | PASS |  |
| 19 | DC-1-CL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - server01_Eth0 | PASS |  |
| 20 | DC-1-CL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-1-SP-1_Ethernet2 | PASS |  |
| 21 | DC-1-CL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-1-SP-2_Ethernet2 | PASS |  |
| 22 | DC-1-CL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - server01_Eth1 | PASS |  |
| 23 | DC-1-CL-3 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-1-SP-1_Ethernet3 | PASS |  |
| 24 | DC-1-CL-3 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-1-SP-2_Ethernet3 | PASS |  |
| 25 | DC-1-CL-3 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - server02_Eth0 | PASS |  |
| 26 | DC-1-CL-4 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-1-SP-1_Ethernet4 | PASS |  |
| 27 | DC-1-CL-4 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-1-SP-2_Ethernet4 | PASS |  |
| 28 | DC-1-CL-4 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - server02_Eth1 | PASS |  |
| 29 | DC-1-SL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-1-SP-1_Ethernet5 | PASS |  |
| 30 | DC-1-SL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-1-SP-2_Ethernet5 | PASS |  |
| 31 | DC-1-SL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - firewalls_Eth0 | PASS |  |
| 32 | DC-1-SL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet8 -  | PASS |  |
| 33 | DC-1-SL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet8.500 - DCI link | PASS |  |
| 34 | DC-1-SL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-1-SP-1_Ethernet6 | PASS |  |
| 35 | DC-1-SL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-1-SP-2_Ethernet6 | PASS |  |
| 36 | DC-1-SL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - firewalls_Eth1 | PASS |  |
| 37 | DC-1-SL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet8 -  | PASS |  |
| 38 | DC-1-SL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet8.500 - DCI link | PASS |  |
| 39 | DC-1-SL-3 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-1-SP-1_Ethernet9 | PASS |  |
| 40 | DC-1-SL-3 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-1-SP-2_Ethernet9 | PASS |  |
| 41 | DC-1-SL-3 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet3 - loadbalancer_Eth0 | PASS |  |
| 42 | DC-1-SL-4 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-1-SP-1_Ethernet10 | PASS |  |
| 43 | DC-1-SL-4 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-1-SP-2_Ethernet10 | PASS |  |
| 44 | DC-1-SL-4 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet3 - loadbalancer_Eth1 | PASS |  |
| 45 | DC-1-SP-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-1-CL-1_Ethernet1 | PASS |  |
| 46 | DC-1-SP-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-1-CL-2_Ethernet1 | PASS |  |
| 47 | DC-1-SP-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_DC-1-CL-3_Ethernet1 | PASS |  |
| 48 | DC-1-SP-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_DC-1-CL-4_Ethernet1 | PASS |  |
| 49 | DC-1-SP-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet5 - P2P_LINK_TO_DC-1-SL-1_Ethernet1 | PASS |  |
| 50 | DC-1-SP-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet6 - P2P_LINK_TO_DC-1-SL-2_Ethernet1 | PASS |  |
| 51 | DC-1-SP-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet9 - P2P_LINK_TO_DC-1-SL-3_Ethernet1 | PASS |  |
| 52 | DC-1-SP-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet10 - P2P_LINK_TO_DC-1-SL-4_Ethernet1 | PASS |  |
| 53 | DC-1-SP-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-1-CL-1_Ethernet2 | PASS |  |
| 54 | DC-1-SP-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-1-CL-2_Ethernet2 | PASS |  |
| 55 | DC-1-SP-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_DC-1-CL-3_Ethernet2 | PASS |  |
| 56 | DC-1-SP-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_DC-1-CL-4_Ethernet2 | PASS |  |
| 57 | DC-1-SP-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet5 - P2P_LINK_TO_DC-1-SL-1_Ethernet2 | PASS |  |
| 58 | DC-1-SP-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet6 - P2P_LINK_TO_DC-1-SL-2_Ethernet2 | PASS |  |
| 59 | DC-1-SP-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet9 - P2P_LINK_TO_DC-1-SL-3_Ethernet2 | PASS |  |
| 60 | DC-1-SP-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet10 - P2P_LINK_TO_DC-1-SL-4_Ethernet2 | PASS |  |
| 61 | DC-2-CL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-2-SP-1_Ethernet5 | PASS |  |
| 62 | DC-2-CL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-2-SP-2_Ethernet5 | PASS |  |
| 63 | DC-2-CL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - server01_Eth0 | PASS |  |
| 64 | DC-2-CL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet5 - server02_Eth1 | PASS |  |
| 65 | DC-2-CL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-2-SP-1_Ethernet6 | PASS |  |
| 66 | DC-2-CL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-2-SP-2_Ethernet6 | PASS |  |
| 67 | DC-2-CL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - server01_Eth1 | PASS |  |
| 68 | DC-2-SL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-2-SP-1_Ethernet1 | PASS |  |
| 69 | DC-2-SL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-2-SP-2_Ethernet1 | PASS |  |
| 70 | DC-2-SL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - firewalls_Eth0 | PASS |  |
| 71 | DC-2-SL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet8 -  | PASS |  |
| 72 | DC-2-SL-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet8.500 - DCI link | PASS |  |
| 73 | DC-2-SL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-2-SP-1_Ethernet2 | PASS |  |
| 74 | DC-2-SL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-2-SP-2_Ethernet2 | PASS |  |
| 75 | DC-2-SL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet4 - firewalls_Eth1 | FAIL | interface status: down - line protocol status: down |
| 76 | DC-2-SL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet8 -  | PASS |  |
| 77 | DC-2-SL-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet8.500 - DCI link | PASS |  |
| 78 | DC-2-SP-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-2-SL-1_Ethernet1 | PASS |  |
| 79 | DC-2-SP-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-2-SL-2_Ethernet1 | PASS |  |
| 80 | DC-2-SP-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet5 - P2P_LINK_TO_DC-2-CL-1_Ethernet1 | PASS |  |
| 81 | DC-2-SP-1 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet6 - P2P_LINK_TO_DC-2-CL-2_Ethernet1 | PASS |  |
| 82 | DC-2-SP-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet1 - P2P_LINK_TO_DC-2-SL-1_Ethernet2 | PASS |  |
| 83 | DC-2-SP-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet2 - P2P_LINK_TO_DC-2-SL-2_Ethernet2 | PASS |  |
| 84 | DC-2-SP-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet5 - P2P_LINK_TO_DC-2-CL-1_Ethernet2 | PASS |  |
| 85 | DC-2-SP-2 | Interface State | Ethernet Interface Status & Line Protocol == "up" | Ethernet6 - P2P_LINK_TO_DC-2-CL-2_Ethernet2 | PASS |  |
| 86 | DC-1-CL-1 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel4 - server01_PortChanne1 | PASS |  |
| 87 | DC-1-CL-2 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel4 - server01_PortChanne1 | PASS |  |
| 88 | DC-1-CL-3 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel4 - server02_PortChanne1 | PASS |  |
| 89 | DC-1-CL-4 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel4 - server02_PortChanne1 | PASS |  |
| 90 | DC-1-SL-1 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel4 - firewalls_PortChanne1 | PASS |  |
| 91 | DC-1-SL-2 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel4 - firewalls_PortChanne1 | PASS |  |
| 92 | DC-1-SL-3 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel3 - loadbalancer_PortChanne1 | PASS |  |
| 93 | DC-1-SL-4 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel3 - loadbalancer_PortChanne1 | PASS |  |
| 94 | DC-2-CL-1 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel4 - server01_PortChanne1 | PASS |  |
| 95 | DC-2-CL-1 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel5 - server02_PortChannel2 | FAIL | interface status: down - line protocol status: lowerLayerDown |
| 96 | DC-2-CL-2 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel4 - server01_PortChanne1 | PASS |  |
| 97 | DC-2-SL-1 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel4 - firewalls_PortChanne1 | PASS |  |
| 98 | DC-2-SL-2 | Interface State | Port-Channel Interface Status & Line Protocol == "up" | Port-Channel4 - firewalls_PortChanne1 | FAIL | interface status: down - line protocol status: down |
| 99 | DC-1-CL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1010 - B2B_Prod | PASS |  |
| 100 | DC-1-CL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1020 - B2B_Prod_2 | PASS |  |
| 101 | DC-1-CL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1030 - B2B_Partner1 | PASS |  |
| 102 | DC-1-CL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1040 - Extranet1_Partner1_Prod_2 | PASS |  |
| 103 | DC-1-CL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan30 - Util_eDMZ_Prod | PASS |  |
| 104 | DC-1-CL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan40 - Util_eDMZ_Prod_2 | PASS |  |
| 105 | DC-1-CL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan10 - Util_iDMZ_PROD | PASS |  |
| 106 | DC-1-CL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan20 - Util_iDMZ_PROD_2 | PASS |  |
| 107 | DC-1-CL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1010 - B2B_Prod | PASS |  |
| 108 | DC-1-CL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1020 - B2B_Prod_2 | PASS |  |
| 109 | DC-1-CL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1030 - B2B_Partner1 | PASS |  |
| 110 | DC-1-CL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1040 - Extranet1_Partner1_Prod_2 | PASS |  |
| 111 | DC-1-CL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan30 - Util_eDMZ_Prod | PASS |  |
| 112 | DC-1-CL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan40 - Util_eDMZ_Prod_2 | PASS |  |
| 113 | DC-1-CL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan10 - Util_iDMZ_PROD | PASS |  |
| 114 | DC-1-CL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan20 - Util_iDMZ_PROD_2 | PASS |  |
| 115 | DC-1-CL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1010 - B2B_Prod | PASS |  |
| 116 | DC-1-CL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1020 - B2B_Prod_2 | PASS |  |
| 117 | DC-1-CL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1030 - B2B_Partner1 | PASS |  |
| 118 | DC-1-CL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1040 - Extranet1_Partner1_Prod_2 | PASS |  |
| 119 | DC-1-CL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan30 - Util_eDMZ_Prod | PASS |  |
| 120 | DC-1-CL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan40 - Util_eDMZ_Prod_2 | PASS |  |
| 121 | DC-1-CL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan10 - Util_iDMZ_PROD | PASS |  |
| 122 | DC-1-CL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan20 - Util_iDMZ_PROD_2 | PASS |  |
| 123 | DC-1-CL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1010 - B2B_Prod | PASS |  |
| 124 | DC-1-CL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1020 - B2B_Prod_2 | PASS |  |
| 125 | DC-1-CL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1030 - B2B_Partner1 | PASS |  |
| 126 | DC-1-CL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1040 - Extranet1_Partner1_Prod_2 | PASS |  |
| 127 | DC-1-CL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan30 - Util_eDMZ_Prod | PASS |  |
| 128 | DC-1-CL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan40 - Util_eDMZ_Prod_2 | PASS |  |
| 129 | DC-1-CL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan10 - Util_iDMZ_PROD | PASS |  |
| 130 | DC-1-CL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan20 - Util_iDMZ_PROD_2 | PASS |  |
| 131 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan200 - B2B-IDMZ-IDMZ-LB-OUT-BL-IN | PASS |  |
| 132 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan201 - B2B-IDMZ-BL-OUT-INT-FW-IN | PASS |  |
| 133 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1010 - B2B_Prod | PASS |  |
| 134 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1020 - B2B_Prod_2 | PASS |  |
| 135 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan202 - B2B-EDMZ-INTFW-OUT-BL-IN | PASS |  |
| 136 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1030 - B2B_Partner1 | PASS |  |
| 137 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1040 - B2B_Partner1_Prod_2 | PASS |  |
| 138 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan30 - Util_eDMZ_Prod | PASS |  |
| 139 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan40 - Util_eDMZ_Prod_2 | PASS |  |
| 140 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan102 - UTIL-EDMZ-INTFW-OUT-BL-IN | PASS |  |
| 141 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan103 - UTIL-EDMZ-BL-OUT-EDMZLB-IN | PASS |  |
| 142 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan104 - UTIL-EDMZ-EDMZLB-OUT-BL-IN | PASS |  |
| 143 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan105 - UTIL-EDMZ-BL-OUT-EXT-FW-IN | PASS |  |
| 144 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan10 - Util_iDMZ_PROD | PASS |  |
| 145 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan20 - Util_iDMZ_PROD_2 | PASS |  |
| 146 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan100 - UTIL-IDMZ-IDMZ-LB-OUT-BL-IN | PASS |  |
| 147 | DC-1-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan101 - UTIL-IDMZ-BL-OUT-INT-FW-IN | PASS |  |
| 148 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan200 - B2B-IDMZ-IDMZ-LB-OUT-BL-IN | PASS |  |
| 149 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan201 - B2B-IDMZ-BL-OUT-INT-FW-IN | PASS |  |
| 150 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1010 - B2B_Prod | PASS |  |
| 151 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1020 - B2B_Prod_2 | PASS |  |
| 152 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan202 - B2B-EDMZ-INTFW-OUT-BL-IN | PASS |  |
| 153 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1030 - B2B_Partner1 | PASS |  |
| 154 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1040 - B2B_Partner1_Prod_2 | PASS |  |
| 155 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan30 - Util_eDMZ_Prod | PASS |  |
| 156 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan40 - Util_eDMZ_Prod_2 | PASS |  |
| 157 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan102 - UTIL-EDMZ-INTFW-OUT-BL-IN | PASS |  |
| 158 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan103 - UTIL-EDMZ-BL-OUT-EDMZLB-IN | PASS |  |
| 159 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan104 - UTIL-EDMZ-EDMZLB-OUT-BL-IN | PASS |  |
| 160 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan105 - UTIL-EDMZ-BL-OUT-EXT-FW-IN | PASS |  |
| 161 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan10 - Util_iDMZ_PROD | PASS |  |
| 162 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan20 - Util_iDMZ_PROD_2 | PASS |  |
| 163 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan100 - UTIL-IDMZ-IDMZ-LB-OUT-BL-IN | PASS |  |
| 164 | DC-1-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan101 - UTIL-IDMZ-BL-OUT-INT-FW-IN | PASS |  |
| 165 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan200 - B2B-IDMZ-IDMZ-LB-OUT-BL-IN | PASS |  |
| 166 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan201 - B2B-IDMZ-BL-OUT-INT-FW-IN | PASS |  |
| 167 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1010 - B2B_Prod | PASS |  |
| 168 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1020 - B2B_Prod_2 | PASS |  |
| 169 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan202 - B2B-EDMZ-INTFW-OUT-BL-IN | PASS |  |
| 170 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1030 - B2B_Partner1 | PASS |  |
| 171 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1040 - B2B_Partner1_Prod_2 | PASS |  |
| 172 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan30 - Util_eDMZ_Prod | PASS |  |
| 173 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan40 - Util_eDMZ_Prod_2 | PASS |  |
| 174 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan102 - UTIL-EDMZ-INTFW-OUT-BL-IN | PASS |  |
| 175 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan103 - UTIL-EDMZ-BL-OUT-EDMZLB-IN | PASS |  |
| 176 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan104 - UTIL-EDMZ-EDMZLB-OUT-BL-IN | PASS |  |
| 177 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan105 - UTIL-EDMZ-BL-OUT-EXT-FW-IN | PASS |  |
| 178 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan10 - Util_iDMZ_PROD | PASS |  |
| 179 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan20 - Util_iDMZ_PROD_2 | PASS |  |
| 180 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan100 - UTIL-IDMZ-IDMZ-LB-OUT-BL-IN | PASS |  |
| 181 | DC-1-SL-3 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan101 - UTIL-IDMZ-BL-OUT-INT-FW-IN | PASS |  |
| 182 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan200 - B2B-IDMZ-IDMZ-LB-OUT-BL-IN | PASS |  |
| 183 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan201 - B2B-IDMZ-BL-OUT-INT-FW-IN | PASS |  |
| 184 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1010 - B2B_Prod | PASS |  |
| 185 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1020 - B2B_Prod_2 | PASS |  |
| 186 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan202 - B2B-EDMZ-INTFW-OUT-BL-IN | PASS |  |
| 187 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1030 - B2B_Partner1 | PASS |  |
| 188 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan1040 - B2B_Partner1_Prod_2 | PASS |  |
| 189 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan30 - Util_eDMZ_Prod | PASS |  |
| 190 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan40 - Util_eDMZ_Prod_2 | PASS |  |
| 191 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan102 - UTIL-EDMZ-INTFW-OUT-BL-IN | PASS |  |
| 192 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan103 - UTIL-EDMZ-BL-OUT-EDMZLB-IN | PASS |  |
| 193 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan104 - UTIL-EDMZ-EDMZLB-OUT-BL-IN | PASS |  |
| 194 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan105 - UTIL-EDMZ-BL-OUT-EXT-FW-IN | PASS |  |
| 195 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan10 - Util_iDMZ_PROD | PASS |  |
| 196 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan20 - Util_iDMZ_PROD_2 | PASS |  |
| 197 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan100 - UTIL-IDMZ-IDMZ-LB-OUT-BL-IN | PASS |  |
| 198 | DC-1-SL-4 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan101 - UTIL-IDMZ-BL-OUT-INT-FW-IN | PASS |  |
| 199 | DC-2-CL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan31 - Util_eDMZ_Prod | PASS |  |
| 200 | DC-2-CL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan41 - Util_eDMZ_Prod_2 | PASS |  |
| 201 | DC-2-CL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan11 - Util_iDMZ_PROD | PASS |  |
| 202 | DC-2-CL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan21 - Util_iDMZ_PROD_2 | PASS |  |
| 203 | DC-2-CL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan31 - Util_eDMZ_Prod | PASS |  |
| 204 | DC-2-CL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan41 - Util_eDMZ_Prod_2 | PASS |  |
| 205 | DC-2-CL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan11 - Util_iDMZ_PROD | PASS |  |
| 206 | DC-2-CL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan21 - Util_iDMZ_PROD_2 | PASS |  |
| 207 | DC-2-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan31 - Util_eDMZ_Prod | PASS |  |
| 208 | DC-2-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan41 - Util_eDMZ_Prod_2 | PASS |  |
| 209 | DC-2-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan101 - Util_Internal_FW_OUT-eDMZLB_IN | PASS |  |
| 210 | DC-2-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan102 - Util_eDMZLB_OUT-EXTFW_IN | PASS |  |
| 211 | DC-2-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan11 - Util_iDMZ_PROD | PASS |  |
| 212 | DC-2-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan21 - Util_iDMZ_PROD_2 | PASS |  |
| 213 | DC-2-SL-1 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan100 - Util_iDMZ_LB_OUT-InternalFW_IN | PASS |  |
| 214 | DC-2-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan31 - Util_eDMZ_Prod | PASS |  |
| 215 | DC-2-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan41 - Util_eDMZ_Prod_2 | PASS |  |
| 216 | DC-2-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan101 - Util_Internal_FW_OUT-eDMZLB_IN | PASS |  |
| 217 | DC-2-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan102 - Util_eDMZLB_OUT-EXTFW_IN | PASS |  |
| 218 | DC-2-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan11 - Util_iDMZ_PROD | PASS |  |
| 219 | DC-2-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan21 - Util_iDMZ_PROD_2 | PASS |  |
| 220 | DC-2-SL-2 | Interface State | Vlan Interface Status & Line Protocol == "up" | Vlan100 - Util_iDMZ_LB_OUT-InternalFW_IN | PASS |  |
| 221 | DC-1-CL-1 | Interface State | Vxlan Interface Status & Line Protocol == "up" | Vxlan1 | PASS |  |
| 222 | DC-1-CL-2 | Interface State | Vxlan Interface Status & Line Protocol == "up" | Vxlan1 | PASS |  |
| 223 | DC-1-CL-3 | Interface State | Vxlan Interface Status & Line Protocol == "up" | Vxlan1 | PASS |  |
| 224 | DC-1-CL-4 | Interface State | Vxlan Interface Status & Line Protocol == "up" | Vxlan1 | PASS |  |
| 225 | DC-1-SL-1 | Interface State | Vxlan Interface Status & Line Protocol == "up" | Vxlan1 | PASS |  |
| 226 | DC-1-SL-2 | Interface State | Vxlan Interface Status & Line Protocol == "up" | Vxlan1 | PASS |  |
| 227 | DC-1-SL-3 | Interface State | Vxlan Interface Status & Line Protocol == "up" | Vxlan1 | PASS |  |
| 228 | DC-1-SL-4 | Interface State | Vxlan Interface Status & Line Protocol == "up" | Vxlan1 | PASS |  |
| 229 | DC-2-CL-1 | Interface State | Vxlan Interface Status & Line Protocol == "up" | Vxlan1 | PASS |  |
| 230 | DC-2-CL-2 | Interface State | Vxlan Interface Status & Line Protocol == "up" | Vxlan1 | PASS |  |
| 231 | DC-2-SL-1 | Interface State | Vxlan Interface Status & Line Protocol == "up" | Vxlan1 | PASS |  |
| 232 | DC-2-SL-2 | Interface State | Vxlan Interface Status & Line Protocol == "up" | Vxlan1 | PASS |  |
| 233 | DC-1-CL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 234 | DC-1-CL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback1 - VTEP_VXLAN_Tunnel_Source | PASS |  |
| 235 | DC-1-CL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback102 - B2B_iDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 236 | DC-1-CL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback103 - B2B_Partner1_VTEP_DIAGNOSTICS | PASS |  |
| 237 | DC-1-CL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback101 - Util_eDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 238 | DC-1-CL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback100 - Util_iDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 239 | DC-1-CL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 240 | DC-1-CL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback1 - VTEP_VXLAN_Tunnel_Source | PASS |  |
| 241 | DC-1-CL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback102 - B2B_iDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 242 | DC-1-CL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback103 - B2B_Partner1_VTEP_DIAGNOSTICS | PASS |  |
| 243 | DC-1-CL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback101 - Util_eDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 244 | DC-1-CL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback100 - Util_iDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 245 | DC-1-CL-3 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 246 | DC-1-CL-3 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback1 - VTEP_VXLAN_Tunnel_Source | PASS |  |
| 247 | DC-1-CL-3 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback102 - B2B_iDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 248 | DC-1-CL-3 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback103 - B2B_Partner1_VTEP_DIAGNOSTICS | PASS |  |
| 249 | DC-1-CL-3 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback101 - Util_eDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 250 | DC-1-CL-3 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback100 - Util_iDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 251 | DC-1-CL-4 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 252 | DC-1-CL-4 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback1 - VTEP_VXLAN_Tunnel_Source | PASS |  |
| 253 | DC-1-CL-4 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback102 - B2B_iDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 254 | DC-1-CL-4 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback103 - B2B_Partner1_VTEP_DIAGNOSTICS | PASS |  |
| 255 | DC-1-CL-4 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback101 - Util_eDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 256 | DC-1-CL-4 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback100 - Util_iDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 257 | DC-1-SL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 258 | DC-1-SL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback1 - VTEP_VXLAN_Tunnel_Source | PASS |  |
| 259 | DC-1-SL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 260 | DC-1-SL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback1 - VTEP_VXLAN_Tunnel_Source | PASS |  |
| 261 | DC-1-SL-3 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 262 | DC-1-SL-3 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback1 - VTEP_VXLAN_Tunnel_Source | PASS |  |
| 263 | DC-1-SL-4 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 264 | DC-1-SL-4 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback1 - VTEP_VXLAN_Tunnel_Source | PASS |  |
| 265 | DC-1-SP-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 266 | DC-1-SP-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 267 | DC-2-CL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 268 | DC-2-CL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback1 - VTEP_VXLAN_Tunnel_Source | PASS |  |
| 269 | DC-2-CL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback101 - Util_eDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 270 | DC-2-CL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback100 - Util_iDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 271 | DC-2-CL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 272 | DC-2-CL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback1 - VTEP_VXLAN_Tunnel_Source | PASS |  |
| 273 | DC-2-CL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback101 - Util_eDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 274 | DC-2-CL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback100 - Util_iDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 275 | DC-2-SL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 276 | DC-2-SL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback1 - VTEP_VXLAN_Tunnel_Source | PASS |  |
| 277 | DC-2-SL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback101 - Util_eDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 278 | DC-2-SL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback100 - Util_iDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 279 | DC-2-SL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 280 | DC-2-SL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback1 - VTEP_VXLAN_Tunnel_Source | PASS |  |
| 281 | DC-2-SL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback101 - Util_eDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 282 | DC-2-SL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback100 - Util_iDMZ_VTEP_DIAGNOSTICS | PASS |  |
| 283 | DC-2-SP-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 284 | DC-2-SP-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - EVPN_Overlay_Peering | PASS |  |
| 285 | DC-1-CL-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-1-SP-1_Ethernet1 | PASS |  |
| 286 | DC-1-CL-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-1-SP-2_Ethernet1 | PASS |  |
| 287 | DC-1-CL-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-1-SP-1_Ethernet2 | PASS |  |
| 288 | DC-1-CL-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-1-SP-2_Ethernet2 | PASS |  |
| 289 | DC-1-CL-3 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-1-SP-1_Ethernet3 | PASS |  |
| 290 | DC-1-CL-3 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-1-SP-2_Ethernet3 | PASS |  |
| 291 | DC-1-CL-4 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-1-SP-1_Ethernet4 | PASS |  |
| 292 | DC-1-CL-4 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-1-SP-2_Ethernet4 | PASS |  |
| 293 | DC-1-SL-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-1-SP-1_Ethernet5 | PASS |  |
| 294 | DC-1-SL-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-1-SP-2_Ethernet5 | PASS |  |
| 295 | DC-1-SL-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-1-SP-1_Ethernet6 | PASS |  |
| 296 | DC-1-SL-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-1-SP-2_Ethernet6 | PASS |  |
| 297 | DC-1-SL-3 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-1-SP-1_Ethernet9 | PASS |  |
| 298 | DC-1-SL-3 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-1-SP-2_Ethernet9 | PASS |  |
| 299 | DC-1-SL-4 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-1-SP-1_Ethernet10 | PASS |  |
| 300 | DC-1-SL-4 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-1-SP-2_Ethernet10 | PASS |  |
| 301 | DC-1-SP-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-1-CL-1_Ethernet1 | PASS |  |
| 302 | DC-1-SP-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-1-CL-2_Ethernet1 | PASS |  |
| 303 | DC-1-SP-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet3 - remote: DC-1-CL-3_Ethernet1 | PASS |  |
| 304 | DC-1-SP-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet4 - remote: DC-1-CL-4_Ethernet1 | PASS |  |
| 305 | DC-1-SP-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet5 - remote: DC-1-SL-1_Ethernet1 | PASS |  |
| 306 | DC-1-SP-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet6 - remote: DC-1-SL-2_Ethernet1 | PASS |  |
| 307 | DC-1-SP-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet9 - remote: DC-1-SL-3_Ethernet1 | PASS |  |
| 308 | DC-1-SP-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet10 - remote: DC-1-SL-4_Ethernet1 | PASS |  |
| 309 | DC-1-SP-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-1-CL-1_Ethernet2 | PASS |  |
| 310 | DC-1-SP-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-1-CL-2_Ethernet2 | PASS |  |
| 311 | DC-1-SP-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet3 - remote: DC-1-CL-3_Ethernet2 | PASS |  |
| 312 | DC-1-SP-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet4 - remote: DC-1-CL-4_Ethernet2 | PASS |  |
| 313 | DC-1-SP-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet5 - remote: DC-1-SL-1_Ethernet2 | PASS |  |
| 314 | DC-1-SP-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet6 - remote: DC-1-SL-2_Ethernet2 | PASS |  |
| 315 | DC-1-SP-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet9 - remote: DC-1-SL-3_Ethernet2 | PASS |  |
| 316 | DC-1-SP-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet10 - remote: DC-1-SL-4_Ethernet2 | PASS |  |
| 317 | DC-2-CL-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-2-SP-1_Ethernet5 | PASS |  |
| 318 | DC-2-CL-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-2-SP-2_Ethernet5 | PASS |  |
| 319 | DC-2-CL-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-2-SP-1_Ethernet6 | PASS |  |
| 320 | DC-2-CL-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-2-SP-2_Ethernet6 | PASS |  |
| 321 | DC-2-SL-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-2-SP-1_Ethernet1 | PASS |  |
| 322 | DC-2-SL-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-2-SP-2_Ethernet1 | PASS |  |
| 323 | DC-2-SL-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-2-SP-1_Ethernet2 | PASS |  |
| 324 | DC-2-SL-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-2-SP-2_Ethernet2 | PASS |  |
| 325 | DC-2-SP-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-2-SL-1_Ethernet1 | PASS |  |
| 326 | DC-2-SP-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-2-SL-2_Ethernet1 | PASS |  |
| 327 | DC-2-SP-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet5 - remote: DC-2-CL-1_Ethernet1 | PASS |  |
| 328 | DC-2-SP-1 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet6 - remote: DC-2-CL-2_Ethernet1 | PASS |  |
| 329 | DC-2-SP-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet1 - remote: DC-2-SL-1_Ethernet2 | PASS |  |
| 330 | DC-2-SP-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet2 - remote: DC-2-SL-2_Ethernet2 | PASS |  |
| 331 | DC-2-SP-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet5 - remote: DC-2-CL-1_Ethernet2 | PASS |  |
| 332 | DC-2-SP-2 | LLDP Topology | lldp topology - validate peer and interface | local: Ethernet6 - remote: DC-2-CL-2_Ethernet2 | PASS |  |
| 333 | DC-1-CL-1 | IP Reachability | ip reachability test p2p links | Source: DC-1-CL-1_Ethernet1 - Destination: DC-1-SP-1_Ethernet1 | PASS |  |
| 334 | DC-1-CL-1 | IP Reachability | ip reachability test p2p links | Source: DC-1-CL-1_Ethernet2 - Destination: DC-1-SP-2_Ethernet1 | PASS |  |
| 335 | DC-1-CL-2 | IP Reachability | ip reachability test p2p links | Source: DC-1-CL-2_Ethernet1 - Destination: DC-1-SP-1_Ethernet2 | PASS |  |
| 336 | DC-1-CL-2 | IP Reachability | ip reachability test p2p links | Source: DC-1-CL-2_Ethernet2 - Destination: DC-1-SP-2_Ethernet2 | PASS |  |
| 337 | DC-1-CL-3 | IP Reachability | ip reachability test p2p links | Source: DC-1-CL-3_Ethernet1 - Destination: DC-1-SP-1_Ethernet3 | PASS |  |
| 338 | DC-1-CL-3 | IP Reachability | ip reachability test p2p links | Source: DC-1-CL-3_Ethernet2 - Destination: DC-1-SP-2_Ethernet3 | PASS |  |
| 339 | DC-1-CL-4 | IP Reachability | ip reachability test p2p links | Source: DC-1-CL-4_Ethernet1 - Destination: DC-1-SP-1_Ethernet4 | PASS |  |
| 340 | DC-1-CL-4 | IP Reachability | ip reachability test p2p links | Source: DC-1-CL-4_Ethernet2 - Destination: DC-1-SP-2_Ethernet4 | PASS |  |
| 341 | DC-1-SL-1 | IP Reachability | ip reachability test p2p links | Source: DC-1-SL-1_Ethernet1 - Destination: DC-1-SP-1_Ethernet5 | PASS |  |
| 342 | DC-1-SL-1 | IP Reachability | ip reachability test p2p links | Source: DC-1-SL-1_Ethernet2 - Destination: DC-1-SP-2_Ethernet5 | PASS |  |
| 343 | DC-1-SL-2 | IP Reachability | ip reachability test p2p links | Source: DC-1-SL-2_Ethernet1 - Destination: DC-1-SP-1_Ethernet6 | PASS |  |
| 344 | DC-1-SL-2 | IP Reachability | ip reachability test p2p links | Source: DC-1-SL-2_Ethernet2 - Destination: DC-1-SP-2_Ethernet6 | PASS |  |
| 345 | DC-1-SL-3 | IP Reachability | ip reachability test p2p links | Source: DC-1-SL-3_Ethernet1 - Destination: DC-1-SP-1_Ethernet9 | PASS |  |
| 346 | DC-1-SL-3 | IP Reachability | ip reachability test p2p links | Source: DC-1-SL-3_Ethernet2 - Destination: DC-1-SP-2_Ethernet9 | PASS |  |
| 347 | DC-1-SL-4 | IP Reachability | ip reachability test p2p links | Source: DC-1-SL-4_Ethernet1 - Destination: DC-1-SP-1_Ethernet10 | PASS |  |
| 348 | DC-1-SL-4 | IP Reachability | ip reachability test p2p links | Source: DC-1-SL-4_Ethernet2 - Destination: DC-1-SP-2_Ethernet10 | PASS |  |
| 349 | DC-1-SP-1 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-1_Ethernet1 - Destination: DC-1-CL-1_Ethernet1 | PASS |  |
| 350 | DC-1-SP-1 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-1_Ethernet2 - Destination: DC-1-CL-2_Ethernet1 | PASS |  |
| 351 | DC-1-SP-1 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-1_Ethernet3 - Destination: DC-1-CL-3_Ethernet1 | PASS |  |
| 352 | DC-1-SP-1 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-1_Ethernet4 - Destination: DC-1-CL-4_Ethernet1 | PASS |  |
| 353 | DC-1-SP-1 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-1_Ethernet5 - Destination: DC-1-SL-1_Ethernet1 | PASS |  |
| 354 | DC-1-SP-1 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-1_Ethernet6 - Destination: DC-1-SL-2_Ethernet1 | PASS |  |
| 355 | DC-1-SP-1 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-1_Ethernet9 - Destination: DC-1-SL-3_Ethernet1 | PASS |  |
| 356 | DC-1-SP-1 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-1_Ethernet10 - Destination: DC-1-SL-4_Ethernet1 | PASS |  |
| 357 | DC-1-SP-2 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-2_Ethernet1 - Destination: DC-1-CL-1_Ethernet2 | PASS |  |
| 358 | DC-1-SP-2 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-2_Ethernet2 - Destination: DC-1-CL-2_Ethernet2 | PASS |  |
| 359 | DC-1-SP-2 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-2_Ethernet3 - Destination: DC-1-CL-3_Ethernet2 | PASS |  |
| 360 | DC-1-SP-2 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-2_Ethernet4 - Destination: DC-1-CL-4_Ethernet2 | PASS |  |
| 361 | DC-1-SP-2 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-2_Ethernet5 - Destination: DC-1-SL-1_Ethernet2 | PASS |  |
| 362 | DC-1-SP-2 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-2_Ethernet6 - Destination: DC-1-SL-2_Ethernet2 | PASS |  |
| 363 | DC-1-SP-2 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-2_Ethernet9 - Destination: DC-1-SL-3_Ethernet2 | PASS |  |
| 364 | DC-1-SP-2 | IP Reachability | ip reachability test p2p links | Source: DC-1-SP-2_Ethernet10 - Destination: DC-1-SL-4_Ethernet2 | PASS |  |
| 365 | DC-2-CL-1 | IP Reachability | ip reachability test p2p links | Source: DC-2-CL-1_Ethernet1 - Destination: DC-2-SP-1_Ethernet5 | PASS |  |
| 366 | DC-2-CL-1 | IP Reachability | ip reachability test p2p links | Source: DC-2-CL-1_Ethernet2 - Destination: DC-2-SP-2_Ethernet5 | PASS |  |
| 367 | DC-2-CL-2 | IP Reachability | ip reachability test p2p links | Source: DC-2-CL-2_Ethernet1 - Destination: DC-2-SP-1_Ethernet6 | PASS |  |
| 368 | DC-2-CL-2 | IP Reachability | ip reachability test p2p links | Source: DC-2-CL-2_Ethernet2 - Destination: DC-2-SP-2_Ethernet6 | PASS |  |
| 369 | DC-2-SL-1 | IP Reachability | ip reachability test p2p links | Source: DC-2-SL-1_Ethernet1 - Destination: DC-2-SP-1_Ethernet1 | PASS |  |
| 370 | DC-2-SL-1 | IP Reachability | ip reachability test p2p links | Source: DC-2-SL-1_Ethernet2 - Destination: DC-2-SP-2_Ethernet1 | PASS |  |
| 371 | DC-2-SL-2 | IP Reachability | ip reachability test p2p links | Source: DC-2-SL-2_Ethernet1 - Destination: DC-2-SP-1_Ethernet2 | PASS |  |
| 372 | DC-2-SL-2 | IP Reachability | ip reachability test p2p links | Source: DC-2-SL-2_Ethernet2 - Destination: DC-2-SP-2_Ethernet2 | PASS |  |
| 373 | DC-2-SP-1 | IP Reachability | ip reachability test p2p links | Source: DC-2-SP-1_Ethernet1 - Destination: DC-2-SL-1_Ethernet1 | PASS |  |
| 374 | DC-2-SP-1 | IP Reachability | ip reachability test p2p links | Source: DC-2-SP-1_Ethernet2 - Destination: DC-2-SL-2_Ethernet1 | PASS |  |
| 375 | DC-2-SP-1 | IP Reachability | ip reachability test p2p links | Source: DC-2-SP-1_Ethernet5 - Destination: DC-2-CL-1_Ethernet1 | PASS |  |
| 376 | DC-2-SP-1 | IP Reachability | ip reachability test p2p links | Source: DC-2-SP-1_Ethernet6 - Destination: DC-2-CL-2_Ethernet1 | PASS |  |
| 377 | DC-2-SP-2 | IP Reachability | ip reachability test p2p links | Source: DC-2-SP-2_Ethernet1 - Destination: DC-2-SL-1_Ethernet2 | PASS |  |
| 378 | DC-2-SP-2 | IP Reachability | ip reachability test p2p links | Source: DC-2-SP-2_Ethernet2 - Destination: DC-2-SL-2_Ethernet2 | PASS |  |
| 379 | DC-2-SP-2 | IP Reachability | ip reachability test p2p links | Source: DC-2-SP-2_Ethernet5 - Destination: DC-2-CL-1_Ethernet2 | PASS |  |
| 380 | DC-2-SP-2 | IP Reachability | ip reachability test p2p links | Source: DC-2-SP-2_Ethernet6 - Destination: DC-2-CL-2_Ethernet2 | PASS |  |
| 381 | DC-1-CL-1 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 382 | DC-1-CL-2 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 383 | DC-1-CL-3 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 384 | DC-1-CL-4 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 385 | DC-1-SL-1 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 386 | DC-1-SL-2 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 387 | DC-1-SL-3 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 388 | DC-1-SL-4 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 389 | DC-1-SP-1 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 390 | DC-1-SP-2 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 391 | DC-2-CL-1 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 392 | DC-2-CL-2 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 393 | DC-2-SL-1 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 394 | DC-2-SL-2 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 395 | DC-2-SP-1 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 396 | DC-2-SP-2 | BGP | ArBGP is configured and operating | ArBGP | PASS |  |
| 397 | DC-1-CL-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.0 | PASS |  |
| 398 | DC-1-CL-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.2 | PASS |  |
| 399 | DC-1-CL-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.4 | PASS |  |
| 400 | DC-1-CL-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.6 | PASS |  |
| 401 | DC-1-CL-3 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.8 | PASS |  |
| 402 | DC-1-CL-3 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.10 | PASS |  |
| 403 | DC-1-CL-4 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.12 | PASS |  |
| 404 | DC-1-CL-4 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.14 | PASS |  |
| 405 | DC-1-SL-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.16 | PASS |  |
| 406 | DC-1-SL-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.18 | PASS |  |
| 407 | DC-1-SL-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.20 | PASS |  |
| 408 | DC-1-SL-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.22 | PASS |  |
| 409 | DC-1-SL-3 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.24 | PASS |  |
| 410 | DC-1-SL-3 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.26 | PASS |  |
| 411 | DC-1-SL-4 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.28 | PASS |  |
| 412 | DC-1-SL-4 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.30 | PASS |  |
| 413 | DC-1-SP-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.1 | PASS |  |
| 414 | DC-1-SP-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.5 | PASS |  |
| 415 | DC-1-SP-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.9 | PASS |  |
| 416 | DC-1-SP-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.13 | PASS |  |
| 417 | DC-1-SP-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.17 | PASS |  |
| 418 | DC-1-SP-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.21 | PASS |  |
| 419 | DC-1-SP-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.25 | PASS |  |
| 420 | DC-1-SP-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.29 | PASS |  |
| 421 | DC-1-SP-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.3 | PASS |  |
| 422 | DC-1-SP-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.7 | PASS |  |
| 423 | DC-1-SP-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.11 | PASS |  |
| 424 | DC-1-SP-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.15 | PASS |  |
| 425 | DC-1-SP-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.19 | PASS |  |
| 426 | DC-1-SP-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.23 | PASS |  |
| 427 | DC-1-SP-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.27 | PASS |  |
| 428 | DC-1-SP-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.0.31 | PASS |  |
| 429 | DC-2-CL-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.8 | PASS |  |
| 430 | DC-2-CL-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.10 | PASS |  |
| 431 | DC-2-CL-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.12 | PASS |  |
| 432 | DC-2-CL-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.14 | PASS |  |
| 433 | DC-2-SL-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.0 | PASS |  |
| 434 | DC-2-SL-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.2 | PASS |  |
| 435 | DC-2-SL-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.4 | PASS |  |
| 436 | DC-2-SL-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.6 | PASS |  |
| 437 | DC-2-SP-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.1 | PASS |  |
| 438 | DC-2-SP-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.5 | PASS |  |
| 439 | DC-2-SP-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.9 | PASS |  |
| 440 | DC-2-SP-1 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.13 | PASS |  |
| 441 | DC-2-SP-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.3 | PASS |  |
| 442 | DC-2-SP-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.7 | PASS |  |
| 443 | DC-2-SP-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.11 | PASS |  |
| 444 | DC-2-SP-2 | BGP | ip bgp peer state established (ipv4) | bgp_neighbor: 192.168.8.15 | PASS |  |
| 445 | DC-1-CL-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.1 | PASS |  |
| 446 | DC-1-CL-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.2 | PASS |  |
| 447 | DC-1-CL-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.1 | PASS |  |
| 448 | DC-1-CL-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.2 | PASS |  |
| 449 | DC-1-CL-3 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.1 | PASS |  |
| 450 | DC-1-CL-3 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.2 | PASS |  |
| 451 | DC-1-CL-4 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.1 | PASS |  |
| 452 | DC-1-CL-4 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.2 | PASS |  |
| 453 | DC-1-SL-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.1 | PASS |  |
| 454 | DC-1-SL-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.2 | PASS |  |
| 455 | DC-1-SL-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.1 | PASS |  |
| 456 | DC-1-SL-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.2 | PASS |  |
| 457 | DC-1-SL-3 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.1 | PASS |  |
| 458 | DC-1-SL-3 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.2 | PASS |  |
| 459 | DC-1-SL-4 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.1 | PASS |  |
| 460 | DC-1-SL-4 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.2 | PASS |  |
| 461 | DC-1-SP-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.3 | PASS |  |
| 462 | DC-1-SP-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.4 | PASS |  |
| 463 | DC-1-SP-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.5 | PASS |  |
| 464 | DC-1-SP-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.6 | PASS |  |
| 465 | DC-1-SP-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.7 | PASS |  |
| 466 | DC-1-SP-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.8 | PASS |  |
| 467 | DC-1-SP-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.9 | PASS |  |
| 468 | DC-1-SP-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.10 | PASS |  |
| 469 | DC-1-SP-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.3 | PASS |  |
| 470 | DC-1-SP-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.4 | PASS |  |
| 471 | DC-1-SP-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.5 | PASS |  |
| 472 | DC-1-SP-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.6 | PASS |  |
| 473 | DC-1-SP-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.7 | PASS |  |
| 474 | DC-1-SP-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.8 | PASS |  |
| 475 | DC-1-SP-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.9 | PASS |  |
| 476 | DC-1-SP-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.4.10 | PASS |  |
| 477 | DC-2-CL-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.1 | PASS |  |
| 478 | DC-2-CL-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.2 | PASS |  |
| 479 | DC-2-CL-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.1 | PASS |  |
| 480 | DC-2-CL-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.2 | PASS |  |
| 481 | DC-2-SL-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.1 | PASS |  |
| 482 | DC-2-SL-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.2 | PASS |  |
| 483 | DC-2-SL-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.1 | PASS |  |
| 484 | DC-2-SL-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.2 | PASS |  |
| 485 | DC-2-SP-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.5 | PASS |  |
| 486 | DC-2-SP-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.6 | PASS |  |
| 487 | DC-2-SP-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.3 | PASS |  |
| 488 | DC-2-SP-1 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.4 | PASS |  |
| 489 | DC-2-SP-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.5 | PASS |  |
| 490 | DC-2-SP-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.6 | PASS |  |
| 491 | DC-2-SP-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.3 | PASS |  |
| 492 | DC-2-SP-2 | BGP | bgp evpn peer state established (evpn) | bgp_neighbor: 192.168.12.4 | PASS |  |
| 493 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.3 | PASS |  |
| 494 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.4 | PASS |  |
| 495 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.5 | PASS |  |
| 496 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.6 | PASS |  |
| 497 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.7 | PASS |  |
| 498 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.8 | PASS |  |
| 499 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.9 | PASS |  |
| 500 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.10 | PASS |  |
| 501 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 502 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 503 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 504 | DC-1-CL-1 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 505 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.3 | PASS |  |
| 506 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.4 | PASS |  |
| 507 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.5 | PASS |  |
| 508 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.6 | PASS |  |
| 509 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.7 | PASS |  |
| 510 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.8 | PASS |  |
| 511 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.9 | PASS |  |
| 512 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.10 | PASS |  |
| 513 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 514 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 515 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 516 | DC-1-CL-2 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 517 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.5.3 | PASS |  |
| 518 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.5.4 | PASS |  |
| 519 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.5.5 | PASS |  |
| 520 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.5.6 | PASS |  |
| 521 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.5.7 | PASS |  |
| 522 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.5.8 | PASS |  |
| 523 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.5.9 | PASS |  |
| 524 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.5.10 | PASS |  |
| 525 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 526 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 527 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 528 | DC-1-CL-3 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 529 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.5.3 | PASS |  |
| 530 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.5.4 | PASS |  |
| 531 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.5.5 | PASS |  |
| 532 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.5.6 | PASS |  |
| 533 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.5.7 | PASS |  |
| 534 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.5.8 | PASS |  |
| 535 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.5.9 | PASS |  |
| 536 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.5.10 | PASS |  |
| 537 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 538 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 539 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 540 | DC-1-CL-4 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 541 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.3 | PASS |  |
| 542 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.4 | PASS |  |
| 543 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.5 | PASS |  |
| 544 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.6 | PASS |  |
| 545 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.7 | PASS |  |
| 546 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.8 | PASS |  |
| 547 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.9 | PASS |  |
| 548 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.10 | PASS |  |
| 549 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 550 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 551 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 552 | DC-1-SL-1 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 553 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.3 | PASS |  |
| 554 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.4 | PASS |  |
| 555 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.5 | PASS |  |
| 556 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.6 | PASS |  |
| 557 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.7 | PASS |  |
| 558 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.8 | PASS |  |
| 559 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.9 | PASS |  |
| 560 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.10 | PASS |  |
| 561 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 562 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 563 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 564 | DC-1-SL-2 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 565 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.5.3 | PASS |  |
| 566 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.5.4 | PASS |  |
| 567 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.5.5 | PASS |  |
| 568 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.5.6 | PASS |  |
| 569 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.5.7 | PASS |  |
| 570 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.5.8 | PASS |  |
| 571 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.5.9 | PASS |  |
| 572 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.5.10 | PASS |  |
| 573 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 574 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 575 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 576 | DC-1-SL-3 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 577 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.5.3 | PASS |  |
| 578 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.5.4 | PASS |  |
| 579 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.5.5 | PASS |  |
| 580 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.5.6 | PASS |  |
| 581 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.5.7 | PASS |  |
| 582 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.5.8 | PASS |  |
| 583 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.5.9 | PASS |  |
| 584 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.5.10 | PASS |  |
| 585 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.13.5 | FAIL | Lo1 192.168.13.5 is not in the routing table |
| 586 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.13.6 | FAIL | Lo1 192.168.13.6 is not in the routing table |
| 587 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.13.3 | FAIL | Lo1 192.168.13.3 is not in the routing table |
| 588 | DC-1-SL-4 | Routing Table | Remote Lo1 address | 192.168.13.4 | FAIL | Lo1 192.168.13.4 is not in the routing table |
| 589 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.3 | FAIL | Lo1 192.168.5.3 is not in the routing table |
| 590 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.4 | FAIL | Lo1 192.168.5.4 is not in the routing table |
| 591 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.5 | FAIL | Lo1 192.168.5.5 is not in the routing table |
| 592 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.6 | FAIL | Lo1 192.168.5.6 is not in the routing table |
| 593 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.7 | FAIL | Lo1 192.168.5.7 is not in the routing table |
| 594 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.8 | FAIL | Lo1 192.168.5.8 is not in the routing table |
| 595 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.9 | FAIL | Lo1 192.168.5.9 is not in the routing table |
| 596 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.5.10 | FAIL | Lo1 192.168.5.10 is not in the routing table |
| 597 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.13.5 | PASS |  |
| 598 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.13.6 | PASS |  |
| 599 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.13.3 | PASS |  |
| 600 | DC-2-CL-1 | Routing Table | Remote Lo1 address | 192.168.13.4 | PASS |  |
| 601 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.3 | FAIL | Lo1 192.168.5.3 is not in the routing table |
| 602 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.4 | FAIL | Lo1 192.168.5.4 is not in the routing table |
| 603 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.5 | FAIL | Lo1 192.168.5.5 is not in the routing table |
| 604 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.6 | FAIL | Lo1 192.168.5.6 is not in the routing table |
| 605 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.7 | FAIL | Lo1 192.168.5.7 is not in the routing table |
| 606 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.8 | FAIL | Lo1 192.168.5.8 is not in the routing table |
| 607 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.9 | FAIL | Lo1 192.168.5.9 is not in the routing table |
| 608 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.5.10 | FAIL | Lo1 192.168.5.10 is not in the routing table |
| 609 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.13.5 | PASS |  |
| 610 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.13.6 | PASS |  |
| 611 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.13.3 | PASS |  |
| 612 | DC-2-CL-2 | Routing Table | Remote Lo1 address | 192.168.13.4 | PASS |  |
| 613 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.3 | FAIL | Lo1 192.168.5.3 is not in the routing table |
| 614 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.4 | FAIL | Lo1 192.168.5.4 is not in the routing table |
| 615 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.5 | FAIL | Lo1 192.168.5.5 is not in the routing table |
| 616 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.6 | FAIL | Lo1 192.168.5.6 is not in the routing table |
| 617 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.7 | FAIL | Lo1 192.168.5.7 is not in the routing table |
| 618 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.8 | FAIL | Lo1 192.168.5.8 is not in the routing table |
| 619 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.9 | FAIL | Lo1 192.168.5.9 is not in the routing table |
| 620 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.5.10 | FAIL | Lo1 192.168.5.10 is not in the routing table |
| 621 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.13.5 | PASS |  |
| 622 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.13.6 | PASS |  |
| 623 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.13.3 | PASS |  |
| 624 | DC-2-SL-1 | Routing Table | Remote Lo1 address | 192.168.13.4 | PASS |  |
| 625 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.3 | FAIL | Lo1 192.168.5.3 is not in the routing table |
| 626 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.4 | FAIL | Lo1 192.168.5.4 is not in the routing table |
| 627 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.5 | FAIL | Lo1 192.168.5.5 is not in the routing table |
| 628 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.6 | FAIL | Lo1 192.168.5.6 is not in the routing table |
| 629 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.7 | FAIL | Lo1 192.168.5.7 is not in the routing table |
| 630 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.8 | FAIL | Lo1 192.168.5.8 is not in the routing table |
| 631 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.9 | FAIL | Lo1 192.168.5.9 is not in the routing table |
| 632 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.5.10 | FAIL | Lo1 192.168.5.10 is not in the routing table |
| 633 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.13.5 | PASS |  |
| 634 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.13.6 | PASS |  |
| 635 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.13.3 | PASS |  |
| 636 | DC-2-SL-2 | Routing Table | Remote Lo1 address | 192.168.13.4 | PASS |  |
| 637 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.3 | PASS |  |
| 638 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.4 | PASS |  |
| 639 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.5 | PASS |  |
| 640 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.6 | PASS |  |
| 641 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.7 | PASS |  |
| 642 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.8 | PASS |  |
| 643 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.9 | PASS |  |
| 644 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.10 | PASS |  |
| 645 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 646 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 647 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 648 | DC-1-CL-1 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 649 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.3 | PASS |  |
| 650 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.4 | PASS |  |
| 651 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.5 | PASS |  |
| 652 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.6 | PASS |  |
| 653 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.7 | PASS |  |
| 654 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.8 | PASS |  |
| 655 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.9 | PASS |  |
| 656 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.10 | PASS |  |
| 657 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 658 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 659 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 660 | DC-1-CL-2 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 661 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.4.3 | PASS |  |
| 662 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.4.4 | PASS |  |
| 663 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.4.5 | PASS |  |
| 664 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.4.6 | PASS |  |
| 665 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.4.7 | PASS |  |
| 666 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.4.8 | PASS |  |
| 667 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.4.9 | PASS |  |
| 668 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.4.10 | PASS |  |
| 669 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 670 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 671 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 672 | DC-1-CL-3 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 673 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.4.3 | PASS |  |
| 674 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.4.4 | PASS |  |
| 675 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.4.5 | PASS |  |
| 676 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.4.6 | PASS |  |
| 677 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.4.7 | PASS |  |
| 678 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.4.8 | PASS |  |
| 679 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.4.9 | PASS |  |
| 680 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.4.10 | PASS |  |
| 681 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 682 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 683 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 684 | DC-1-CL-4 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 685 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.3 | PASS |  |
| 686 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.4 | PASS |  |
| 687 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.5 | PASS |  |
| 688 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.6 | PASS |  |
| 689 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.7 | PASS |  |
| 690 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.8 | PASS |  |
| 691 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.9 | PASS |  |
| 692 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.10 | PASS |  |
| 693 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 694 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 695 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 696 | DC-1-SL-1 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 697 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.3 | PASS |  |
| 698 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.4 | PASS |  |
| 699 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.5 | PASS |  |
| 700 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.6 | PASS |  |
| 701 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.7 | PASS |  |
| 702 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.8 | PASS |  |
| 703 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.9 | PASS |  |
| 704 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.10 | PASS |  |
| 705 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 706 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 707 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 708 | DC-1-SL-2 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 709 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.4.3 | PASS |  |
| 710 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.4.4 | PASS |  |
| 711 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.4.5 | PASS |  |
| 712 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.4.6 | PASS |  |
| 713 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.4.7 | PASS |  |
| 714 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.4.8 | PASS |  |
| 715 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.4.9 | PASS |  |
| 716 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.4.10 | PASS |  |
| 717 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 718 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 719 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 720 | DC-1-SL-3 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 721 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.4.3 | PASS |  |
| 722 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.4.4 | PASS |  |
| 723 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.4.5 | PASS |  |
| 724 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.4.6 | PASS |  |
| 725 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.4.7 | PASS |  |
| 726 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.4.8 | PASS |  |
| 727 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.4.9 | PASS |  |
| 728 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.4.10 | PASS |  |
| 729 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 730 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 731 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 732 | DC-1-SL-4 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 733 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.3 | PASS |  |
| 734 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.4 | PASS |  |
| 735 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.5 | PASS |  |
| 736 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.6 | PASS |  |
| 737 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.7 | PASS |  |
| 738 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.8 | PASS |  |
| 739 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.9 | PASS |  |
| 740 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.10 | PASS |  |
| 741 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 742 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 743 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 744 | DC-1-SP-1 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 745 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.3 | PASS |  |
| 746 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.4 | PASS |  |
| 747 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.5 | PASS |  |
| 748 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.6 | PASS |  |
| 749 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.7 | PASS |  |
| 750 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.8 | PASS |  |
| 751 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.9 | PASS |  |
| 752 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.10 | PASS |  |
| 753 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.12.5 | FAIL | Lo0 192.168.12.5 is not in the routing table |
| 754 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.12.6 | FAIL | Lo0 192.168.12.6 is not in the routing table |
| 755 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.12.3 | FAIL | Lo0 192.168.12.3 is not in the routing table |
| 756 | DC-1-SP-2 | Routing Table | Remote Lo0 address | 192.168.12.4 | FAIL | Lo0 192.168.12.4 is not in the routing table |
| 757 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.3 | FAIL | Lo0 192.168.4.3 is not in the routing table |
| 758 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.4 | FAIL | Lo0 192.168.4.4 is not in the routing table |
| 759 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.5 | FAIL | Lo0 192.168.4.5 is not in the routing table |
| 760 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.6 | FAIL | Lo0 192.168.4.6 is not in the routing table |
| 761 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.7 | FAIL | Lo0 192.168.4.7 is not in the routing table |
| 762 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.8 | FAIL | Lo0 192.168.4.8 is not in the routing table |
| 763 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.9 | FAIL | Lo0 192.168.4.9 is not in the routing table |
| 764 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.4.10 | FAIL | Lo0 192.168.4.10 is not in the routing table |
| 765 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.12.5 | PASS |  |
| 766 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.12.6 | PASS |  |
| 767 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.12.3 | PASS |  |
| 768 | DC-2-CL-1 | Routing Table | Remote Lo0 address | 192.168.12.4 | PASS |  |
| 769 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.3 | FAIL | Lo0 192.168.4.3 is not in the routing table |
| 770 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.4 | FAIL | Lo0 192.168.4.4 is not in the routing table |
| 771 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.5 | FAIL | Lo0 192.168.4.5 is not in the routing table |
| 772 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.6 | FAIL | Lo0 192.168.4.6 is not in the routing table |
| 773 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.7 | FAIL | Lo0 192.168.4.7 is not in the routing table |
| 774 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.8 | FAIL | Lo0 192.168.4.8 is not in the routing table |
| 775 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.9 | FAIL | Lo0 192.168.4.9 is not in the routing table |
| 776 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.4.10 | FAIL | Lo0 192.168.4.10 is not in the routing table |
| 777 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.12.5 | PASS |  |
| 778 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.12.6 | PASS |  |
| 779 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.12.3 | PASS |  |
| 780 | DC-2-CL-2 | Routing Table | Remote Lo0 address | 192.168.12.4 | PASS |  |
| 781 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.3 | FAIL | Lo0 192.168.4.3 is not in the routing table |
| 782 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.4 | FAIL | Lo0 192.168.4.4 is not in the routing table |
| 783 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.5 | FAIL | Lo0 192.168.4.5 is not in the routing table |
| 784 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.6 | FAIL | Lo0 192.168.4.6 is not in the routing table |
| 785 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.7 | FAIL | Lo0 192.168.4.7 is not in the routing table |
| 786 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.8 | FAIL | Lo0 192.168.4.8 is not in the routing table |
| 787 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.9 | FAIL | Lo0 192.168.4.9 is not in the routing table |
| 788 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.4.10 | FAIL | Lo0 192.168.4.10 is not in the routing table |
| 789 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.12.5 | PASS |  |
| 790 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.12.6 | PASS |  |
| 791 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.12.3 | PASS |  |
| 792 | DC-2-SL-1 | Routing Table | Remote Lo0 address | 192.168.12.4 | PASS |  |
| 793 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.3 | FAIL | Lo0 192.168.4.3 is not in the routing table |
| 794 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.4 | FAIL | Lo0 192.168.4.4 is not in the routing table |
| 795 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.5 | FAIL | Lo0 192.168.4.5 is not in the routing table |
| 796 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.6 | FAIL | Lo0 192.168.4.6 is not in the routing table |
| 797 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.7 | FAIL | Lo0 192.168.4.7 is not in the routing table |
| 798 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.8 | FAIL | Lo0 192.168.4.8 is not in the routing table |
| 799 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.9 | FAIL | Lo0 192.168.4.9 is not in the routing table |
| 800 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.4.10 | FAIL | Lo0 192.168.4.10 is not in the routing table |
| 801 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.12.5 | PASS |  |
| 802 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.12.6 | PASS |  |
| 803 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.12.3 | PASS |  |
| 804 | DC-2-SL-2 | Routing Table | Remote Lo0 address | 192.168.12.4 | PASS |  |
| 805 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.3 | FAIL | Lo0 192.168.4.3 is not in the routing table |
| 806 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.4 | FAIL | Lo0 192.168.4.4 is not in the routing table |
| 807 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.5 | FAIL | Lo0 192.168.4.5 is not in the routing table |
| 808 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.6 | FAIL | Lo0 192.168.4.6 is not in the routing table |
| 809 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.7 | FAIL | Lo0 192.168.4.7 is not in the routing table |
| 810 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.8 | FAIL | Lo0 192.168.4.8 is not in the routing table |
| 811 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.9 | FAIL | Lo0 192.168.4.9 is not in the routing table |
| 812 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.4.10 | FAIL | Lo0 192.168.4.10 is not in the routing table |
| 813 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.12.5 | PASS |  |
| 814 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.12.6 | PASS |  |
| 815 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.12.3 | PASS |  |
| 816 | DC-2-SP-1 | Routing Table | Remote Lo0 address | 192.168.12.4 | PASS |  |
| 817 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.3 | FAIL | Lo0 192.168.4.3 is not in the routing table |
| 818 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.4 | FAIL | Lo0 192.168.4.4 is not in the routing table |
| 819 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.5 | FAIL | Lo0 192.168.4.5 is not in the routing table |
| 820 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.6 | FAIL | Lo0 192.168.4.6 is not in the routing table |
| 821 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.7 | FAIL | Lo0 192.168.4.7 is not in the routing table |
| 822 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.8 | FAIL | Lo0 192.168.4.8 is not in the routing table |
| 823 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.9 | FAIL | Lo0 192.168.4.9 is not in the routing table |
| 824 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.4.10 | FAIL | Lo0 192.168.4.10 is not in the routing table |
| 825 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.12.5 | PASS |  |
| 826 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.12.6 | PASS |  |
| 827 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.12.3 | PASS |  |
| 828 | DC-2-SP-2 | Routing Table | Remote Lo0 address | 192.168.12.4 | PASS |  |
| 829 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.4.3 | PASS |  |
| 830 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.4.4 | PASS |  |
| 831 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.4.5 | PASS |  |
| 832 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.4.6 | PASS |  |
| 833 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.4.7 | PASS |  |
| 834 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.4.8 | PASS |  |
| 835 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.4.9 | PASS |  |
| 836 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.4.10 | PASS |  |
| 837 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 838 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 839 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 840 | DC-1-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-1 - 192.168.4.3 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 841 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.4.3 | PASS |  |
| 842 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.4.4 | PASS |  |
| 843 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.4.5 | PASS |  |
| 844 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.4.6 | PASS |  |
| 845 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.4.7 | PASS |  |
| 846 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.4.8 | PASS |  |
| 847 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.4.9 | PASS |  |
| 848 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.4.10 | PASS |  |
| 849 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 850 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 851 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 852 | DC-1-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-2 - 192.168.4.4 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 853 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.4.3 | PASS |  |
| 854 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.4.4 | PASS |  |
| 855 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.4.5 | PASS |  |
| 856 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.4.6 | PASS |  |
| 857 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.4.7 | PASS |  |
| 858 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.4.8 | PASS |  |
| 859 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.4.9 | PASS |  |
| 860 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.4.10 | PASS |  |
| 861 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 862 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 863 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 864 | DC-1-CL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-3 - 192.168.4.5 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 865 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.4.3 | PASS |  |
| 866 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.4.4 | PASS |  |
| 867 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.4.5 | PASS |  |
| 868 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.4.6 | PASS |  |
| 869 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.4.7 | PASS |  |
| 870 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.4.8 | PASS |  |
| 871 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.4.9 | PASS |  |
| 872 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.4.10 | PASS |  |
| 873 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 874 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 875 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 876 | DC-1-CL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-CL-4 - 192.168.4.6 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 877 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.4.3 | PASS |  |
| 878 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.4.4 | PASS |  |
| 879 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.4.5 | PASS |  |
| 880 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.4.6 | PASS |  |
| 881 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.4.7 | PASS |  |
| 882 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.4.8 | PASS |  |
| 883 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.4.9 | PASS |  |
| 884 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.4.10 | PASS |  |
| 885 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 886 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 887 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 888 | DC-1-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-1 - 192.168.4.7 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 889 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.4.3 | PASS |  |
| 890 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.4.4 | PASS |  |
| 891 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.4.5 | PASS |  |
| 892 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.4.6 | PASS |  |
| 893 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.4.7 | PASS |  |
| 894 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.4.8 | PASS |  |
| 895 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.4.9 | PASS |  |
| 896 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.4.10 | PASS |  |
| 897 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 898 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 899 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 900 | DC-1-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-2 - 192.168.4.8 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 901 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.4.3 | PASS |  |
| 902 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.4.4 | PASS |  |
| 903 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.4.5 | PASS |  |
| 904 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.4.6 | PASS |  |
| 905 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.4.7 | PASS |  |
| 906 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.4.8 | PASS |  |
| 907 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.4.9 | PASS |  |
| 908 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.4.10 | PASS |  |
| 909 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 910 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 911 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 912 | DC-1-SL-3 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-3 - 192.168.4.9 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 913 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.4.3 | PASS |  |
| 914 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.4.4 | PASS |  |
| 915 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.4.5 | PASS |  |
| 916 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.4.6 | PASS |  |
| 917 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.4.7 | PASS |  |
| 918 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.4.8 | PASS |  |
| 919 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.4.9 | PASS |  |
| 920 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.4.10 | PASS |  |
| 921 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 922 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 923 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 924 | DC-1-SL-4 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SL-4 - 192.168.4.10 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 925 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.4.3 | PASS |  |
| 926 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.4.4 | PASS |  |
| 927 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.4.5 | PASS |  |
| 928 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.4.6 | PASS |  |
| 929 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.4.7 | PASS |  |
| 930 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.4.8 | PASS |  |
| 931 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.4.9 | PASS |  |
| 932 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.4.10 | PASS |  |
| 933 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 934 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 935 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 936 | DC-1-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-1 - 192.168.4.1 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 937 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.4.3 | PASS |  |
| 938 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.4.4 | PASS |  |
| 939 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.4.5 | PASS |  |
| 940 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.4.6 | PASS |  |
| 941 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.4.7 | PASS |  |
| 942 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.4.8 | PASS |  |
| 943 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.4.9 | PASS |  |
| 944 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.4.10 | PASS |  |
| 945 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.12.5 | FAIL | 100% packet loss |
| 946 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.12.6 | FAIL | 100% packet loss |
| 947 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.12.3 | FAIL | 100% packet loss |
| 948 | DC-1-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-1-SP-2 - 192.168.4.2 Destination: 192.168.12.4 | FAIL | 100% packet loss |
| 949 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.3 | FAIL | 100% packet loss |
| 950 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.4 | FAIL | 100% packet loss |
| 951 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.5 | FAIL | 100% packet loss |
| 952 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.6 | FAIL | 100% packet loss |
| 953 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.7 | FAIL | 100% packet loss |
| 954 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.8 | FAIL | 100% packet loss |
| 955 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.9 | FAIL | 100% packet loss |
| 956 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.4.10 | FAIL | 100% packet loss |
| 957 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.12.5 | PASS |  |
| 958 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.12.6 | PASS |  |
| 959 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.12.3 | PASS |  |
| 960 | DC-2-CL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-1 - 192.168.12.5 Destination: 192.168.12.4 | PASS |  |
| 961 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.3 | FAIL | 100% packet loss |
| 962 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.4 | FAIL | 100% packet loss |
| 963 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.5 | FAIL | 100% packet loss |
| 964 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.6 | FAIL | 100% packet loss |
| 965 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.7 | FAIL | 100% packet loss |
| 966 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.8 | FAIL | 100% packet loss |
| 967 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.9 | FAIL | 100% packet loss |
| 968 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.4.10 | FAIL | 100% packet loss |
| 969 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.12.5 | PASS |  |
| 970 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.12.6 | PASS |  |
| 971 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.12.3 | PASS |  |
| 972 | DC-2-CL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-CL-2 - 192.168.12.6 Destination: 192.168.12.4 | PASS |  |
| 973 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.3 | FAIL | 100% packet loss |
| 974 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.4 | FAIL | 100% packet loss |
| 975 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.5 | FAIL | 100% packet loss |
| 976 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.6 | FAIL | 100% packet loss |
| 977 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.7 | FAIL | 100% packet loss |
| 978 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.8 | FAIL | 100% packet loss |
| 979 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.9 | FAIL | 100% packet loss |
| 980 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.4.10 | FAIL | 100% packet loss |
| 981 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.12.5 | PASS |  |
| 982 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.12.6 | PASS |  |
| 983 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.12.3 | PASS |  |
| 984 | DC-2-SL-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-1 - 192.168.12.3 Destination: 192.168.12.4 | PASS |  |
| 985 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.3 | FAIL | 100% packet loss |
| 986 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.4 | FAIL | 100% packet loss |
| 987 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.5 | FAIL | 100% packet loss |
| 988 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.6 | FAIL | 100% packet loss |
| 989 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.7 | FAIL | 100% packet loss |
| 990 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.8 | FAIL | 100% packet loss |
| 991 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.9 | FAIL | 100% packet loss |
| 992 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.4.10 | FAIL | 100% packet loss |
| 993 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.12.5 | PASS |  |
| 994 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.12.6 | PASS |  |
| 995 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.12.3 | PASS |  |
| 996 | DC-2-SL-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SL-2 - 192.168.12.4 Destination: 192.168.12.4 | PASS |  |
| 997 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.3 | FAIL | 100% packet loss |
| 998 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.4 | FAIL | 100% packet loss |
| 999 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.5 | FAIL | 100% packet loss |
| 1000 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.6 | FAIL | 100% packet loss |
| 1001 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.7 | FAIL | 100% packet loss |
| 1002 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.8 | FAIL | 100% packet loss |
| 1003 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.9 | FAIL | 100% packet loss |
| 1004 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.4.10 | FAIL | 100% packet loss |
| 1005 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.12.5 | PASS |  |
| 1006 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.12.6 | PASS |  |
| 1007 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.12.3 | PASS |  |
| 1008 | DC-2-SP-1 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-1 - 192.168.12.1 Destination: 192.168.12.4 | PASS |  |
| 1009 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.3 | FAIL | 100% packet loss |
| 1010 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.4 | FAIL | 100% packet loss |
| 1011 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.5 | FAIL | 100% packet loss |
| 1012 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.6 | FAIL | 100% packet loss |
| 1013 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.7 | FAIL | 100% packet loss |
| 1014 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.8 | FAIL | 100% packet loss |
| 1015 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.9 | FAIL | 100% packet loss |
| 1016 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.4.10 | FAIL | 100% packet loss |
| 1017 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.12.5 | PASS |  |
| 1018 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.12.6 | PASS |  |
| 1019 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.12.3 | PASS |  |
| 1020 | DC-2-SP-2 | Loopback0 Reachability | Loopback0 Reachability | Source: DC-2-SP-2 - 192.168.12.2 Destination: 192.168.12.4 | PASS |  |
