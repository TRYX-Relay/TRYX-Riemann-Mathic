# Bounded contour certificate and replay

The certificate covers the rectangle 0.495 ≤ Re s ≤ 0.505, 14.1297 ≤ Im s ≤ 14.1397. It contains 128 rational boundary image enclosures. The geometry verifier checks continuity, exclusion of zero and winding number one. Arithmetic replay recomputes each disk and compares the exact rational outputs.

## Run from the extracted packet root

Use Python 3.9 or later. Only the standard library is needed.

```sh
python3 evidence/contour/replay.py --check-inputs
python3 evidence/contour/replay.py
```

The first command checks source hashes, certificate identity and exact geometry; it does not replay arithmetic disks. The second recomputes all 128 disks, taking several minutes on the reviewed host. New results go to `evidence/contour/replay-results`; use `--output` for another directory. Default commands preserve the saved evidence.

For a launcher check, `--segments 1` recomputes only the first disk. Its result explicitly records that full replay was not performed.

## Included evidence

- [Certificate](ENIAD_ZETA_REFINED_CONTOUR_261018_V1/CERTIFICATE.json)
- [Geometry verifier](ENIAD_ZETA_REFINED_CONTOUR_261018_V1/VERIFY.py)
- [Arithmetic implementation](ENIAD_ZETA_DISK_261018_V1/ZETA.py) and local dependencies
- [Uniform input disk bound](ENIAD_ZETA_DISK_261018_V1/BOUND_PROOF.md)
- [Saved full replay](../performance-2026-11-07/CONTOUR_RESULTS.json) and [geometry result](../performance-2026-11-07/GEOMETRY_RESULTS.json)
- [Portable launcher validation](PORTABILITY_CHECK.json)

Certificate SHA-256: `e399e1d4b2ed2d006174e7a55366e6ca501c2dc88d29388003adc5164c6218da`.

The launcher reads the exact arithmetic source bytes and defers type annotations for Python 3.9 compatibility. Arithmetic operations are unchanged. Generator provenance records describe the original preparation; this repair does not claim to generate a new certificate.

Under the reviewed analytic bounds and argument principle, the rectangle contains exactly one simple zero. Reflection-invariant uniqueness fixes its real part at one-half. This is a known-first-zero calibration in the retained implementation, not a native prediction, independent new enclosure implementation or universal RH conclusion.
