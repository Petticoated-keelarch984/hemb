## TASK 4 — IANA CONSIDERATIONS

### 11.  IANA Considerations

   This document has no IANA actions.

   If HeMB is advanced to the Standards Track in a future document,
   the following registrations SHOULD be requested:

   -  A two-bit "HeMB Version" registry for the version field in the
      compact and extended frame headers (initial value: 0x00).

   -  A two-bit "HeMB Flags" registry for the flags field (initial
      values: 0x00 Data, 0x01 Repair, 0x02 Ack, 0x03 Control).

   -  A "HeMB Bearer Type" registry for bearer type identifiers used
      in bearer profile descriptors.

   -  Reservation of the two-byte magic sequence 0x48 0x4D ("HM") for
      HeMB extended frame header detection.

---
