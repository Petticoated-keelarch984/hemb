# HeMB Reference Implementation

## Codebases

### Go Bridge (meshsat/, project 27)
- **Package:** `internal/hemb/`
- **Lines:** 4,314 (13 files)
- **Tests:** 49 pass, 0 fail, 2 skip (root-only TUN)
- **Key files:** bonder.go, reassemble.go, gf256.go, rlnc.go, frame.go, tun.go, stats.go

### Go Hub (meshsat-hub/, project 35)
- **Package:** `internal/protocol/hemb_*.go`
- **Lines:** 756 (6 files)
- **Tests:** 7 pass
- **Purpose:** Decode-only reassembly for Hub-side MQTT ingestion

### Kotlin Android (meshsat-android/, project 31)
- **Package:** `hemb/`
- **Lines:** 1,871 (12 files)
- **Tests:** 11 pass
- **Latest release:** v2.6.1 (versionCode 43)

## Architecture

```
Application / Routing Layer
        |
   Bonder.Send(payload)
        |
   RLNC Encode (K segments → N symbols)
        |
   Cost-Weighted Allocation
   (free bearers first, then paid)
        |
   ┌────┴────┐
   Bearer 0   Bearer 1  ...  Bearer N-1
   (LoRa)     (SBD)          (SMS)
```

Receive path:
```
   Bearer → IsHeMBFrame() → parseSymbolFromFrame()
        → ReassemblyBuffer.AddSymbol()
        → TryDecode (Gaussian elimination GF(256))
        → DeliverFn(payload)
```

## Key Design Decisions

1. **N=1 zero overhead**: Single bearer → raw passthrough, no header, no RLNC
2. **Global stream ID counter**: Prevents collisions across ephemeral bonders
3. **Generation cleanup after decode**: Frees stream+gen ID for reuse
4. **Adaptive timeout**: 3× max bearer latency, clamped [10s, 10min]
5. **Package isolation**: Zero imports from routing/reticulum packages
