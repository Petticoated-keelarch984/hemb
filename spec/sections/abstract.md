## TASK 6 — ABSTRACT

This document specifies HeMB (Heterogeneous Media Bonding), a sub-IP
protocol that bonds multiple physically incompatible communication
bearers into a single virtual bearer using Random Linear Network
Coding (RLNC).  HeMB addresses the problem of reliable message
delivery across environments where the surviving communication
channels — LoRa mesh radio, Iridium satellite SBD, APRS/AX.25, SMS,
and GSM ring signals — share no common protocol stack and differ in
latency by up to three orders of magnitude.  The protocol distributes
RLNC-coded symbols across N bearers such that any K of N symbols from
any bearer combination reconstruct the original payload, with
cost-weighted allocation ensuring free bearers are exhausted before
paid bearers receive symbols.  HeMB does not claim novelty in RLNC or
multipath transmission as individual concepts; its contribution is
their integration into a sub-IP bearer bonding protocol operating
across non-IP bearers with latency ratios exceeding 100:1 and
unbounded cost differentials — a combination unaddressed by prior
systems.

---
