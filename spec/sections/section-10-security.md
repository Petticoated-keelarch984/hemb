## TASK 3 — SECTION 10: SECURITY CONSIDERATIONS

### 10.  Security Considerations

#### 10.1.  Payload Confidentiality

   HeMB does not provide encryption.  The protocol encodes plaintext
   payloads into RLNC-coded symbols; an adversary intercepting K or
   more linearly independent symbols on any combination of bearers can
   reconstruct the original payload.

   Implementations SHOULD apply end-to-end encryption before HeMB
   encoding.  The reference implementation [MESHSAT2026] uses
   AES-256-GCM encryption applied before RLNC encoding.  Encrypting
   before coding is the correct ordering: coded symbols of ciphertext
   reveal nothing about the plaintext beyond what an adversary could
   learn from intercepting the minimum K coded symbols and performing
   Gaussian elimination — which yields the ciphertext, not the
   plaintext.

#### 10.2.  RLNC Pollution Attacks

   An adversary capable of injecting frames on any bearer can inject
   RLNC-coded symbols with crafted coefficients.  If the injected
   symbols are linearly dependent on legitimate symbols, decoding will
   produce an incorrect result without detection if the only integrity
   check is the 8-bit CRC in the HeMB frame header.  CRC-8 (ITU-T
   polynomial 0x07) provides a detection probability of approximately
   1/256 against deliberate manipulation — insufficient for untrusted
   bearers.

   Implementations handling untrusted bearers SHOULD add per-symbol
   HMAC verification or use authenticated encryption (e.g.,
   AES-256-GCM) at the application layer such that corrupt or
   malicious symbols are detected and discarded before entering the
   reassembly buffer.  CRC-8 is sufficient for bit-error detection on
   trusted bearers (e.g., authenticated Meshtastic channels, SIM-locked
   cellular) but MUST NOT be relied upon for adversarial integrity.

#### 10.3.  Reassembly Buffer Exhaustion

   An adversary sending HeMB frames with many distinct stream_id values
   can fill the reassembly buffer.  Each active stream_id consumes
   memory proportional to the number of received symbols.  The default
   implementation limits concurrent streams to 256 (8-bit stream_id
   space) and applies an adaptive timeout of three times the maximum
   bearer latency in the bond group.

   Implementations SHOULD impose a configurable maximum stream count
   (RECOMMENDED default: 16 concurrent streams).  Implementations
   SHOULD implement rate limiting on HeMB frame ingress per source
   bearer.  Buffer exhaustion events SHOULD be logged and reported to
   the management plane.

#### 10.4.  Replay Attacks

   The HeMB extended header provides an 8-bit stream_id and a 16-bit
   generation_id, yielding a 24-bit combined namespace.  After 2^24
   generations on the same stream, identifiers wrap.  An adversary
   replaying previously captured coded symbols within the reassembly
   timeout window could cause the reassembler to merge old and new
   symbols, resulting in incorrect decoding.

   Implementations on untrusted bearers SHOULD include a monotonic
   generation counter or wall-clock timestamp in the extended header
   flags field and SHOULD reject frames whose generation counter falls
   outside the expected window.  On trusted bearers with short
   reassembly timeouts (e.g., 750 milliseconds for LoRa + TCP), the
   replay window is sufficiently narrow that this risk is low.

#### 10.5.  Bearer Authentication

   HeMB frames carry no sender authentication field.  Bearer-level
   addressing provides implicit source identification on most bearers:
   Meshtastic node IDs, Iridium IMEIs, AX.25 callsigns, and SMS
   originating phone numbers.  However, these identifiers are spoofable
   on some bearers (particularly LoRa mesh, where any node can
   transmit).

   Applications requiring sender authentication SHOULD apply
   application-layer digital signatures (e.g., Ed25519) before HeMB
   encoding.  The reference implementation [MESHSAT2026] provides an
   optional Ed25519 signing service with hash-chain audit logging.

#### 10.6.  Coefficient Linear Dependence

   When using random coefficients over GF(256) with K source segments,
   the probability that a given coded symbol is linearly dependent on
   the existing K-1 independent symbols is at most K/256.  For K=4,
   this probability is approximately 1.6%.  This is the expected
   behavior of RLNC; the reassembler discards rank-deficient symbols
   and waits for the next independent one.

   An adversary observing the coefficient vector (transmitted in the
   frame header) can deliberately construct linearly dependent symbols,
   preventing decoding.  This reduces to the pollution attack described
   in Section 10.2.  The mitigation is the same: per-symbol
   authentication on untrusted bearers.

---
