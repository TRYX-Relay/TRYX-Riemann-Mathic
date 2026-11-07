# Riemann Prime-Crease MATHIC · V6

Successor to V5 with exact bounded certification, finite test outcomes, and formal proof reported at their respective scopes. The bent-path domain remains enforced in Lean. Relative coordinates are the active construction. Lyrics describe the adjacent mathematics and evidence.

## Proof

**Theorem.** Each admitted matched prime dyad has parent-normalized midpoint 1/2. In the declared common Euclidean unit frame, the reference dyad has endpoints 0 and 1, and its perpendicular crease is X = 1/2. A family shares that absolute crease when its retained parent midpoints coincide at 1/2 in this chart (PC5). The prime-spectrum readout along that crease recovers exactly the zeta zeros on it, preserving position and multiplicity. Separately, the aggregate prime transform recovers every nontrivial zeta zero at its original position.

**1. Prime admission and the shared vertex.** PC1 identifies the surviving labels as exactly the primes. PC4 gives prime-only membership in the admitted EZPR records. These arithmetic results come from the historical Zipper MATHIC. For an admitted matched dyad, the parent-normalized readings are ξ and 1−ξ. Matching gives ξ = 1−ξ, hence ξ = 1/2. In the declared unit frame the reference dyad has ξ = X. Equal normalized readings across different parents allow distinct absolute midpoints. The prime label is retained separately from the vertex address.

In the Euclidean realization, a point equidistant from the unit endpoints 0 and 1 satisfies X²+Y² = (1−X)²+Y². This gives X = 1/2 at every altitude. The crease is perpendicular to the original dyad. Its shared vertex is v = 1/2, and its signed coordinate is Y, with Y = 0 at the bend. The map C(Y) = v+iY has the exact inverse Y = Im C(Y). The turned line has one free coordinate. The positive bent path has one distance parameter t ≥ 0. For t < 1/2 the input is t on the X leg. For t ≥ 1/2 the input is C(t−1/2) on the turned leg. Thus the bend is t = 1/2, and the turned-leg zeta calculation is exactly F(Y) at t = 1/2+Y for Y ≥ 0. The signed crease chart C also admits Y < 0. Lean enforces t ≥ 0 in the bent-path input type; the signed chart is a separate definition.

> **Lyric · Prime admission and the vertex**  
> The survival rule keeps the primes.  
> Equal readings meet at half in their own parent.  
> In the declared unit frame the crease turns at that half.  
> The vertex is zero in Y. Each prime keeps its name.

**2. Prime spectrum and local closure.** For s = X+iY, the mode of prime p is p^(−s) = p^(−X) exp(−iY log p). All prime modes use the same Y. For X > 1, their Euler product equals ζ(s). Continuing that function analytically and evaluating on the crease gives F(Y) = ζ(C(Y)) = ζ(1/2+iY).

A root of F gives a zeta zero at C(Y). Conversely, a zeta zero on the crease has the unique address Y = Im ρ, and C(Y) = ρ. If ρ = C(Y₀) has multiplicity m, write ζ(s) = (s−ρ)^m g(s), with g(ρ) ≠ 0. Then F(Y) = i^m (Y−Y₀)^m g(C(Y)), so the multiplicity is preserved. This closes the readout on the entire declared Y line. The order is taken in the local holomorphic extension in Y.

> **Lyric · Spectrum and local closure**  
> Each prime turns at its own rate, log p.  
> The same Y carries every phase.  
> Continue the product from where it converges.  
> Read the crease, recover the height, and keep the order of each zero.

**3. Aggregate recovery and infinite addressing.** In X > 1, logarithmic differentiation of the Euler product gives D(s) = Σ_p Σ_(k≥1) (log p) p^(−ks) = −ζ′(s)/ζ(s). Its meromorphic continuation has a pole at each nontrivial zero ρ. The factorization above gives D(s) = −m/(s−ρ)−g′(s)/g(s), so the pole is at the original ρ and its residue is −m. Where ζ is nonzero in the critical strip, the quotient is holomorphic. Thus the pole correspondence covers the full nontrivial zero family. For each pole, the relative address (Y,d) = (Im ρ, Re ρ−1/2) recovers the original point as ρ = C(Y)+d.

> **Lyric · Aggregate and return**  
> Sum the prime powers with their log weights.  
> A pole keeps the zero's place. Its residue gives minus its order.  
> Keep the height and the offset together.  
> Return both, and the original point comes back.

**Proof return.** The turned leg agrees exactly with the zeta readout for Y ≥ 0. The signed crease readout recovers its entire zero family, with multiplicity. Full-strip recovery uses the original address (Y,d). Lean verifies that exact recovery using only Y for the full strip-zero family is equivalent to universal placement at X = 1/2. This last statement is a proved equivalence. In addition, the reviewed contour certificate proves that exactly one simple zero occurs in its stated rectangle and lies on the crease. See Stanza 7.

> **Lyric · Proof return**  
> At the bend, the turned leg gives the same readout.  
> The signed line returns its zeros.  
> The full address brings back the original point.  
> Compare the two returns without dropping what each one carries.

## Counter-question FAQ

- **Does the construction actually use bent Y?** Yes. The path ends its X leg at the shared vertex and starts its Y leg there. On the turned leg, the input is C(Y) with X fixed at 1/2. Lean checks this identity in `bent_zeta_readout`.
- **Where else can a zero of the bent-Y calculation occur?** Each root of the readout is already on that line, with a unique Y address and preserved multiplicity. This is the proved local closure in Move 2.
- **Does infinite addressing already recover every original nontrivial zero?** Yes. Move 3 gives exact recovery using the full relative address (Y,d). This item stays closed.
- **Is there a second variable inside the turned line?** Y is its sole variable. The retained d belongs to the separate full-strip recovery record. For all signed heights, the comparison is between the original point and the crease point returned by C(Y), as checked by `y_only_exact_iff`. The positive bent leg and the signed crease chart agree for Y ≥ 0.
- **Is comparing the counts at every height a new challenge?** It is the same full-family equality stated as a count. See Stanza 8. The eight stanzas below record the distinct challenge outcomes and the duplicate.

## Disproof attempts

Stanzas 1–5 are deductions in the stated model. Stanza 6 is a negative control. Stanza 7 records an exact bounded proof, the replay that supports it, and separate finite numerical checks. Stanza 8 records an equivalent formulation.

**Stanza 1 · Break prime admission or move the midpoint.** Try to admit a nonprime or place a matched dyad away from its parent-normalized half. **Ruled out.** PC1–PC4 determine the admitted labels, and ξ = 1−ξ gives ξ = 1/2. Absolute X = 1/2 follows in the declared unit frame. For a family of parents, PC5 requires their midpoints to coincide at 1/2 in the common chart.

> **Lyric 1**  
> Offer a composite to the admission rule. The survivor rule excludes it.  
> Ask a matched pair to meet away from its own half. The readings disagree.

**Stanza 2 · Break the bend or introduce a second free coordinate.** Try to shift the relative origin away from the vertex or give one point on the turned line two altitude addresses. **Ruled out.** C(0) = v and Im C(Y) = Y. The two legs share the vertex, and the turned line has one free coordinate.

> **Lyric 2**  
> Move the origin and the reference changes. In this frame zero stays at the vertex.  
> Read the height back. Each point on the turned line gives one Y.

**Stanza 3 · Lose a zero in either recovery.** Try to lose a crease zero, change its multiplicity, or lose an original nontrivial zero in the aggregate. **Ruled out in each stated domain.** The Y inverse and local factorization preserve the crease zeros. The poles and residues of D, together with the full relative address, preserve the original zeros and their multiplicities.

> **Lyric 3**  
> Follow a crease zero out and back. Its place and order return.  
> Read the aggregate pole at its own address. The residue keeps the order.

**Stanza 4 · Break prime-spectrum agreement.** Compare the analytically continued prime formula with the classical zeta readout on the crease. **Exact agreement.** The Euler product gives the same function on X > 1, and uniqueness of analytic continuation carries that equality to the crease.

> **Lyric 4**  
> Begin where the Euler product converges.  
> Continue the same function to the crease and read its value there.

**Stanza 5 · Manufacture cancellation by rotating the output.** Rotate the whole complex output and test whether a nonzero value can become zero. **Ruled out.** For real θ, |exp(iθ) ζ(s)|² = |ζ(s)|².

> **Lyric 5**  
> Turn the whole output through any angle.  
> Its squared magnitude stays put. A nonzero value stays nonzero.

**Stanza 6 · Hide displacement through mirror balance.** Test whether opposite offsets can cancel in the aggregate while each remains nonzero. **The control defeats that shortcut.** A pair d,−d has signed sum zero for every d. Signed pair balance cannot certify cancellation at each original address.

> **Lyric 6**  
> The left and right offsets can cancel in the sum.  
> Read them one at a time and each can still be nonzero.

**Stanza 7 · Challenge the bounded certificate and finite controls.**

**Proved by the reviewed contour certificate.** In the rectangle 0.495 ≤ X ≤ 0.505, 14.1297 ≤ Y ≤ 14.1397, the 128 rational enclosures bound the zeta image of the boundary and exclude zero. The reviewed image has winding number one. Zeta is holomorphic throughout the rectangle, so the argument principle counts one zero with multiplicity. That zero is simple. The rectangle is invariant under s ↦ 1−conj(s), which preserves nontrivial zeta zeros. Its unique zero is therefore fixed by that reflection and has X = 1/2.

**Replay passed.** All 128 boundary enclosures reproduced exactly in the same implementation. The source review checked the arithmetic and remainder bounds. The result certifies the stated rectangle.

**Finite controls passed.** The November 3 record reports 290 passes across midpoint examples, relative-coordinate recovery, endpoint round trips, and output rotation. The reported residual near 1/2 + 14.134725141737 i is approximately 1.826 × 10⁻¹². That residual is a numerical observation. The contour argument supplies the exact zero count and placement.

> **Lyric 7**  
> One hundred twenty-eight enclosures hold the boundary clear.  
> One turn counts one simple zero inside the frame.  
> The mirror keeps the frame, and its only zero stays on half.  
> Two hundred ninety controls passed on the cases they tested.

**Stanza 8 · Challenge by counting at every height.** Compare the full pole count and the crease-zero count, including multiplicities, using the same finite window and endpoint convention in both counts. **Duplicate of the full RH claim.** Since crease zeros are already included with matching multiplicities, equality at every cutoff is equivalent to equality of the two families.

> **Lyric 8**  
> Count both families in the same window, with multiplicity.  
> Every crease zero already belongs to the full count.  
> Equal counts at every height would give the same full claim.

## Performance return

1. Match the endpoint readings: ξ = 1−ξ gives ξ = 1/2 in the parent frame.
2. At t = 1/2 the turned coordinate is 0. At t = 1/2+Y, for Y ≥ 0, substitution returns C(Y).
3. Read the same input through zeta on the turned leg and through F(Y). Lean checks equality in `bent_zeta_readout` and the exact zero correspondence in `readout_exact`.
4. Decode (Y,d) as C(Y)+d and compare with the signed crease return C(Y). The original point is recovered by the full address. The comparison reports d.
5. The eight challenge stanzas retain their outcomes and scopes. The reviewed contour supplies an exact bounded placement result. Its replay and the 290 controls are historical passes.

## Sources

The historical half-fold theorem supports the Euclidean geometry. The current comparison and readout use relative coordinates.

- [Historical Zipper MATHIC, PC1–PC7](https://github.com/TRYX-Relay/TRYX-MATHIC/blob/main/archive/riemann/local-closure/261030-v1/MATHIC.txt)
- [Historical Euclidean support: Half-Fold and Perpendicular-Line Theorem](https://github.com/TRYX-Relay/TRYX-MATHIC/blob/main/archive/riemann/frontier-formulas/261027-v1/HALF_FOLD_CRITICAL_LINE_THEOREM_261019_V1/THEOREM.md)
- [Prime-Trace Correspondence](https://github.com/TRYX-Relay/TRYX-MATHIC/blob/main/archive/riemann/frontier-formulas/261027-v1/ENIAD_PRIME_ZERO_CORRESPONDENCE_261018_V1/THEOREM.md)
- [Relative-Coordinate Addendum](https://github.com/TRYX-Relay/TRYX-MATHIC/blob/main/archive/riemann/research/261105-depositional-layer-v1/RELATIVE_COORDINATE_ADDENDUM.md)
- [November 3 reconciliation and challenge record](https://github.com/TRYX-Relay/TRYX-MATHIC/tree/main/archive/riemann/frontier-formulas/261103-reconciliation-mathic-v1)

- [October 30 contour audit findings](https://github.com/TRYX-Relay/TRYX-MATHIC/blob/main/archive/riemann/theorems/261030-perspective-memory-successor-v1/FINDINGS.txt)
