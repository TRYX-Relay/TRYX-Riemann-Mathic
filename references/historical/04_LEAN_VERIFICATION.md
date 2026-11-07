# Prime-Crease V5 post-audit Lean verification

The V4 counter-audit found that the prose restricted path distance to t ≥ 0 while Lean allowed all real inputs. V5 replaces the real input with PathDistance = {t : ℝ // 0 ≤ t}. The turned-leg constructor requires Y ≥ 0. The independent signed crease coordinate still accepts all real Y.

Both LocalClosure.lean and PrimeCrease.lean compiled from source in a fresh build directory, with warnings treated as errors. Lean 4.34.0-rc2 and Mathlib revision 85e3a25e006c35636f0e53b0e9296caca2685bc0. The reported axioms are propext, Classical.choice, and Quot.sound. The bent-readout theorem passes with the restricted domain.

To reproduce in the pinned Mathlib environment, put both source files in one directory and run there:

```sh
lake env sh -c 'export LEAN_PATH="$PWD:$LEAN_PATH"; lean -DwarningAsError=true -o LocalClosure.olean LocalClosure.lean && lean -DwarningAsError=true -o PrimeCrease.olean PrimeCrease.lean'
```
