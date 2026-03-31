# Prior Art Summary — HeMB

Three independent research passes conducted March 2026. All conclusions verified.

## Confirmed Novelty Boundary

No system found combining:
1. Sub-IP heterogeneous bearer aggregation (no IP/TCP requirement)
2. RLNC-based recovery across latency ratios exceeding 100:1
3. Cost-weighted symbol allocation

Closest prior art: US9537759B2 (MIT/DARPA, 2017) — RLNC across TCP/IP
subflows, max tested RTT ratio ~100:1.

## Five Clusters

### Cluster 1: Multipath transport (above IP)
- MPTCP [RFC8684], MP-QUIC [RFC9000]
- Require IP/TCP/UDP. No RLNC. ~1:5 latency ratio.
- **Non-threatening.**

### Cluster 2: IP-layer bonding
- GRE Tunnel Bonding [RFC8157], LACP [IEEE802.1AX], TETRA
- IP-layer or homogeneous Ethernet. No coding.
- **Non-threatening.**

### Cluster 3: Delay-tolerant overlays
- Bundle Protocol [RFC9171], Reticulum
- Sequential store-and-forward. No K-of-N coding.
- **Non-threatening.** DTN custody informs HeMB N=1 fallback.

### Cluster 4: Network-coded multipath (CRITICAL)
- US9537759B2: RLNC across TCP/IP subflows. Max ~100:1 RTT ratio.
- C-MPTCP: RLNC over MPTCP. Above IP.
- LTBA [Wu 2014]: Block FEC cellular/WiFi. Above IP. No cost model.
- Ho 2006: RLNC theoretical foundation.
- Raptor/RaptorQ [RFC5053, RFC6330]: Fountain codes.
- **All above IP. None handle non-IP bearers. None exceed 100:1.**

### Cluster 5: IoT-specific
- GDEP [Lysogor 2019]: Sequential LoRa→Iridium. No coding.
- LoRaHop [2023]: Single-bearer RLNC flooding.
- **Sequential or single-technology.**

## Verification Checklist

- [x] Three independent search passes with different query strategies
- [x] IEEE Xplore, ACM DL, Google Scholar, USPTO, EPO searched
- [x] US9537759B2 claims analyzed line-by-line
- [x] No sub-IP multi-bearer RLNC system found
- [x] No system exceeding 100:1 latency ratio with RLNC found
- [x] No cost-weighted RLNC allocation found
