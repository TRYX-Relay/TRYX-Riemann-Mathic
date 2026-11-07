# Single Lean source verification

6 November 2026. Result: PASS.

The package contains exactly one file with the .lean extension: lean/PrimeCrease.lean. Its contents consolidate the previous arithmetic, analytic, and V8 certificate declarations while retaining their namespaces, theorem statements, and proofs. Internal imports of LocalClosure and PrimeCrease were removed; all remaining imports are Mathlib modules.

Fresh compilation of this exact consolidated source, with warnings treated as errors, exited with code 0. The standard one-module lake build also exited with code 0 and completed 3,731 jobs using cached dependency build products. All nine dependency checkouts matched the package manifest. No proof source was edited after these successful runs.

[Compiler output](verification/lean-compile.log) · [Lake build output](verification/lake-build.log)

The environment was Lean 4.34.0-rc2 and the exact Mathlib revision pinned in lakefile.toml. This was a fresh compilation of the consolidated module with reused library artifacts, not a clean network installation of every dependency. A host launcher compatibility shim allowed the official Lean executable to locate itself; it did not alter proof content or compiler options.

All printed axiom reports list only propext, Classical.choice, and Quot.sound. The compiled source has no sorry, admit, or custom axiom declarations. Mathematical scope is that of the formal statements and their hypotheses. Written Theorems 4–6 are not promoted to compiled formalizations by this receipt. No independent second-kernel check or new contour replay was performed.

The MATHIC PDF was rebuilt for the single-source edition. The README and reproduction commands now reference the sole proof file. Earlier split-source verification notes and logs were removed from this successor to avoid contradictory build instructions.
