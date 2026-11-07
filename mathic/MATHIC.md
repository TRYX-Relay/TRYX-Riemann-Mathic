---
title: "Prime Crease Verified Local Closure MATHIC Version 8.1"
author: "Virgil Lee Gattenby"
date: "6 November 2026"
lang: en-US
---

# A Verified local closure

**Author: Virgil Lee Gattenby. Version 8.1, 6 November 2026.**

**Local closure is proved for the admitted prime-record model and the signed crease readout.** The result covers every member of those declared domains. It is a universally quantified theorem within the model, not a finite-height observation or a completed infinite scan.

## Explicit closure theorem and proof

Let S be the prime-survivor set of Section B. For every p in S, assume an identified parent interval with endpoints aₚ < bₚ and an event xₚ. Its two relative readings are tₚ and uₚ. Assume incidence tₚ + uₚ = 1, matching tₚ = uₚ, and location xₚ = aₚ + (bₚ − aₚ)tₚ. For absolute placement, assume every parent midpoint is ½ in the common frame. Define the signed crease C(Y) = ½ + iY and F(Y) = ζ(C(Y)). These symbols and domains are developed in Section B.

**Conclusion 1 — entire admitted prime family.**

$$\forall p\in S,\qquad t_p=u_p=\frac12,\qquad x_p=\frac12.$$

**Proof.** For arbitrary p, incidence and matching give 2tₚ = 1. Location then gives xₚ = (aₚ + bₚ)/2 = ½. Since p was arbitrary, the conclusion holds for the entire admitted family. Retaining p in the pair (p, ½) recovers its prime identity. $\square$

**Conclusion 2 — exact signed-crease zero family.** For every real Y, F(Y) = 0 exactly when C(Y) is a zeta zero. Every zeta zero with real part ½ has the unique address Y = Im ρ, and the readout preserves its analytic multiplicity.

$$\{C(Y):Y\in\mathbb R,\ F(Y)=0\}=\{\rho:\zeta(\rho)=0,\ \Re\rho=\tfrac12\}.$$

**Proof.** The forward implication is the definition of F. For the reverse implication, Re ρ = ½ gives ρ = C(Im ρ). Equality of C-values forces equality of imaginary parts, so the address is unique. The affine analytic substitution has derivative i ≠ 0 and preserves the order of vanishing, as proved in Theorem 8. $\square$

**Closure status: PROVED for both declared families.** Every admitted prime event satisfies the midpoint conclusion; every signed-crease zero is recovered exactly with multiplicity. The nonnegative bent path joins this crease at B(½) = C(0), and B(½ + Y) = C(Y) for Y ≥ 0. The combined certificate in Section C assembles these results with retained prime identities.

**Full-zero scope.** For an arbitrary original nontrivial zero, the exact recovery identity is ρ = C(Im ρ) + d with d = Re ρ − ½. Recovery from Y alone for every original zero holds if and only if d vanishes for every such zero. Section D proves this equivalence. The two proved conclusions above do not assert its universal premise.

For each admitted prime record, incidence and matching force its unique parent-relative midpoint. In a shared chart whose parent midpoints equal one-half, every such event has absolute X = ½. The positive bent path turns at B(½) = C(0) = ½ and agrees with the crease chart at distance ½ + Y for Y ≥ 0. The signed chart C(Y) = ½ + iY covers both signs of Y.

The readout F(Y) = ζ(C(Y)) returns exactly the critical-line zeta zeros, at their original positions and with their multiplicities preserved. The retained prime labels remain distinct even when their admitted events share a coordinate. Theorems 1–9 below supply the full mathematical chain; Section C ends with the combined local closure certificate.

**Verification.** One self-contained file, PrimeCrease.lean, contains the arithmetic, geometric, analytic, and V8 local-closure declarations. It imports Mathlib and has no local proof-file imports. This exact consolidated file compiled successfully with warnings treated as errors using the pinned Lean and Mathlib environment. Its project also passed the one-module `lake build`. All printed axiom reports contain only propext, Classical.choice, and Quot.sound. Theorems 4–6 retain their written proofs; the formal correspondence table identifies the compiled coverage.

**Why the scope is local closure.** The prime-record theorem quantifies over records satisfying incidence, matching, and location. The readout theorem quantifies over roots of F on its declared signed crease. The aggregate separately recovers every original nontrivial zero with address (Y,d), where d = Re ρ − ½. The exact identity ρ = C(Y) + d retains d. It becomes recovery from Y alone precisely when d = 0. None of the model’s admission conditions is proved for every original zeta zero, and none of the recovery identities derives d = 0 for all those zeros. This is the exact reason the established local closure is not asserted as a proof of the full Riemann hypothesis. Section D proves the equivalence explicitly; the counter-question answers are retained.

Version 8 retains the nine theorem proofs, all eighteen counter-questions, and all eight disproof tests. It adds the combined local closure certificate and incorporates the later successful Lean execution record. Relative coordinates are the active mechanism.

# B Definitions and admission hypotheses

Let $\mathbb N_0=\{0,1,2,\ldots\}$. Define the composite candidate set and surviving labels by

$$\mathcal C=\{uv:u,v\in\mathbb N_0,\ u\ge2,\ v\ge2\},\qquad S=\mathbb N_0\setminus(\{0,1\}\cup\mathcal C).$$

A prime is an integer at least two with no proper positive divisor. A label $p\in S$ identifies a number. Its record also retains participant and parent identities, endpoints, event location, and the inherited state claimed as recoverable. Equal labels or event locations do not merge record identities.

For an identified parent with real endpoints $a<b$, put $L=b-a>0$. The event at $x$ has parent-relative readings

$$t=\frac{x-a}{L},\qquad u=\frac{b-x}{L}.$$

**Incidence** is $t+u=1$. **Matching** is the additional admission condition $t=u$. The location relation is $x=a+Lt$. Arithmetic selection determines the labels. A matched record supplies the geometric premises for its event. For a whole-family conclusion, each surviving label must have such a record.

The **parent crease** is $(a+b)/2$. Normalized half means $t=u=1/2$. A **common frame** puts the parents in one X chart and requires their midpoints to coincide at the chosen absolute reference. In the unit frame that reference is $X=1/2$.

In the analytic realization write $s=X+iY$, where $i^2=-1$. Define the **signed crease chart** by $C(Y)=1/2+iY$, for real $Y$. It is distinct from the composite set $\mathcal C$. The **positive bent path** has distance parameter $\tau\ge0$ and is

$$B(\tau)=\begin{cases}\tau,&0\le\tau<1/2,\\ C(\tau-1/2),&\tau\ge1/2.\end{cases}$$

Its vertex is $B(1/2)=C(0)=1/2$. The positive Y leg has $Y\ge0$. The signed chart includes both signs of Y.

The **Riemann zeta function** is initially $\zeta(s)=\sum_{n=1}^{\infty}n^{-s}$ for $X>1$, with its meromorphic continuation elsewhere. The **open critical strip** is $0<X<1$. Its zeta zeros form $Z$. For a zero $\rho$, its multiplicity is the order of vanishing of the holomorphic function at $\rho$. The **Riemann hypothesis** asserts $\Re\rho=1/2$ for every $\rho\in Z$. [4]

The **readout** is $F(Y)=\zeta(C(Y))$. For real Y it reads the signed crease. Multiplicity is measured in its local holomorphic extension to a complex Y parameter.

The **aggregate transform** is the meromorphic continuation of the prime-power series in Theorem 9. At an original zero define its full relative address and decoder by

$$A(\rho)=(Y,d)=(\Im\rho,\Re\rho-1/2),\qquad R_Z(Y,d)=C(Y)+d.$$

The **same-height comparison** is the difference between the original zero and $C(Y)$. It will be derived directly in Section D. **Infinite addressing** means specifying the family and proving an assertion for an arbitrary member, giving a universally quantified statement. The address includes every component needed for the claimed recovery.

**Exact inherited-state recovery** uses an encoder $K$ and decoder $R_H$ with $R_H(K(h))=h$ on the declared inherited-state domain. **Valid recursion** means that inherited records preserve their matching conditions and each newly admitted record satisfies those conditions. Coverage of all primes is a separate quantified premise unless established by a constructor.

# C The theorem chain

## Theorem 1 Prime survivor equivalence

For every $n\in\mathbb N_0$, membership $n\in S$ is equivalent to primality.

$$n\in S\quad\Longleftrightarrow\quad n\text{ is prime}.$$

**Proof.** A survivor is at least two and has no factorization $n=uv$ with $u,v\ge2$. If $n$ had a proper divisor $2\le u<n$, then $n=uv$ with integer $v\ge2$, contradicting survival. Conversely, a prime is at least two. A factorization with both factors at least two would give a proper divisor, since $v\ge2$ implies $u<n$. Thus every prime survives. The integer was arbitrary. $\square$

## Theorem 2 Unique matched midpoint

For real $a<b$, the incidence, matching, and location equations have exactly one solution for $t,u,x$.

$$t+u=1,\quad t=u,\quad x=a+(b-a)t\quad\Longrightarrow\quad t=u=\frac12,\quad x=\frac{a+b}{2}.$$

**Proof.** Substitute $u=t$ into incidence to obtain $2t=1$. Substitute $t=1/2$ into the location relation. Conversely, these values satisfy all three equations. This proves existence and uniqueness. $\square$

## Theorem 3 Local prime-family closure

Suppose each $p\in S$ has an admitted record satisfying Theorem 2. Every prime event lies at its identified parent midpoint, and no such event lies strictly to either side of that midpoint.

$$\forall p\in S,\qquad x_p=\frac{a_p+b_p}{2}.$$

**Proof.** Theorem 1 identifies the label family as exactly the primes. Apply Theorem 2 to an arbitrary member's record. Either strict inequality contradicts the displayed equality. Since the member was arbitrary, the result covers the whole admitted family. $\square$

**Common-frame corollary.** If every parent midpoint equals $1/2$ in the same chart, every admitted event has absolute $X=1/2$. Substitution into Theorem 3 proves the claim. Equal normalized readings across different parents alone allow different absolute midpoints.

**Identity corollary.** The projection from $\{(p,1/2):p\in S\}$ to $S$ that retains $p$ is bijective, with inverse $p\mapsto(p,1/2)$. The projection onto the coordinate alone merges distinct labels, including 2 and 3. The record retains the distinction.

## Theorem 4 Affine preservation

Let $f(x)=\alpha x+\beta$ with real $\alpha\ne0$. Transport the event and both endpoints by this same map. Midpoint placement is preserved.

$$x=\frac{a+b}{2}\quad\Longrightarrow\quad f(x)=\frac{f(a)+f(b)}2.$$

**Proof.** Distribute the affine map over the displayed midpoint expression. The new endpoint difference is $\alpha(b-a)\ne0$. Reorder the endpoints as $a'=\min(f(a),f(b))$ and $b'=\max(f(a),f(b))$. Their length is $|\alpha|(b-a)>0$. If $\alpha>0$, the two normalized readings are preserved. If $\alpha<0$, they exchange roles. Matching survives in both cases. Retained identities stay in the records. $\square$

## Theorem 5 Recursive preservation

Let $G_0$ consist of valid matched records. Suppose every $G_{n+1}$ contains only inherited records whose validity is preserved and new records satisfying incidence, matching, and location. Then every record in every finite stage, and every record in their union, is valid.

$$\forall n\in\mathbb N_0\ \forall q\in G_n,\qquad q\text{ satisfies matching}.$$

**Proof.** The base stage is valid by hypothesis. At a successor stage, inherited records remain valid by preservation, and new records are valid by admission. Induction gives validity for all finite stages. Any member of the union belongs to a finite stage and therefore is valid. $\square$

To infer prime-family coverage for the generated union, also establish that every $p\in S$ labels a record in some $G_n$. Preservation alone establishes validity of the records that enter.

## Theorem 6 Recoverable carry is injective

Suppose $K:\mathcal H\to\mathcal E$ and $R_H:K(\mathcal H)\to\mathcal H$ satisfy exact recovery on all inherited states. Then $K$ is injective.

$$R_H\circ K=\operatorname{id}_{\mathcal H}\quad\Longrightarrow\quad K\text{ is injective}.$$

**Proof.** If $K(h)=K(j)$, apply the same decoder to both sides. Exact recovery gives $h=R_H(K(h))=R_H(K(j))=j$. An enlarged successor may retain extra experience alongside this recoverable inherited component. $\square$

This is Theorem 6 of this MATHIC and the paper. Its statement and proof are supplied here. The same-height zeta comparison below is a separate algebraic identity.

## Theorem 7 The turned leg and signed chart

In the common Euclidean unit frame, the perpendicular bisector of endpoints 0 and 1 is $X=1/2$. The signed chart is injective, has range $\{s:\Re s=1/2\}$, and agrees with the positive bent path after the turn.

$$X^2+Y^2=(1-X)^2+Y^2\quad\Longleftrightarrow\quad X=\frac12.$$

$$B(1/2+Y)=C(Y)\quad(Y\ge0),\qquad \Im C(Y)=Y.$$

**Proof.** Expanding the squared-distance equality gives $2X=1$, and substitution proves the converse. The definitions give $B(1/2)=C(0)$. For $Y\ge0$, the turned branch at distance $1/2+Y$ evaluates to $C(Y)$. Taking imaginary parts recovers Y, proving injectivity. Every point of real part $1/2$ equals $C(\Im s)$, proving the range statement. Each leg of the path uses one distance parameter. $\square$

## Theorem 8 Exact critical-line readout

The zeros of $F$ with real Y correspond bijectively to the zeros of $\zeta$ on the signed crease, preserving original positions and multiplicities.

$$F(Y)=\zeta(C(Y))=\zeta(1/2+iY).$$

**Proof.** A root of F maps to a zeta zero at $C(Y)$. Conversely, a crease zero has unique address $Y=\Im\rho$, and $C(Y)=\rho$. At $\rho=C(Y_0)$ with order $m\ge1$, holomorphy gives a local factorization $\zeta(s)=(s-\rho)^m g(s)$, with g holomorphic and $g(\rho)\ne0$. In the complex extension of the Y parameter,

$$F(Y)=i^m(Y-Y_0)^m g(C(Y)).$$

The cofactor at $Y_0$ is nonzero, so the order remains m. This proves exact crease readout with multiplicity. $\square$

For a prime p, $p^{-s}=p^{-X}\exp(-iY\log p)$. All prime modes use this same Y. The Euler product equals $\zeta(s)$ on $X>1$; analytic continuation gives the function evaluated above. [4]

## Theorem 9 Original-zero recovery

In the open critical strip, the poles of the continued aggregate transform are precisely the original nontrivial zeros. Each pole is simple, and its residue is the negative of the zero's multiplicity.

$$D(s)=\sum_p\sum_{k\ge1}(\log p)p^{-ks}=-\frac{\zeta'(s)}{\zeta(s)}\qquad(\Re s>1).$$

**Proof.** Logarithmic differentiation of the absolutely convergent Euler product gives the displayed series identity in its convergence domain. The quotient supplies meromorphic continuation. Now let $\rho$ be an arbitrary zero anywhere in the open critical strip. The function is holomorphic in the strip and belongs to the analytic continuation on $\mathbb C\setminus\{1\}$. It is nonzero at $s=2$, so the identity theorem excludes identical vanishing on the strip. Thus its zero is isolated and has finite order $m\ge1$. The local order-of-vanishing theorem supplies

$$\zeta(s)=(s-\rho)^m g(s),\qquad g(\rho)\ne0,$$

where g is holomorphic near this arbitrary $\rho$. Choose a smaller neighborhood where g is nonzero. Differentiating this factorization yields

$$D(s)=-\frac{m}{s-\rho}-\frac{g'(s)}{g(s)}.$$

The second term is holomorphic in that neighborhood. The first gives a simple pole at the original $\rho$ with residue $-m$. At any point in the strip where $\zeta$ is nonzero, the quotient is holomorphic. This proves both directions of the correspondence. The factorization applies to arbitrary zeros independently of their real coordinates. $\square$ [4]

## Combined verified local closure certificate

Assume an admitted prime-record model with the endpoints, incidence, matching, and location conditions of Section B. Assume its parent midpoints coincide at ½ in the common chart. Use the nonnegative bent-path domain and signed crease chart defined there. Then:

1. For every prime p, its admitted event satisfies tₚ = uₚ = ½ and xₚ = ½. No admitted event lies strictly on either side of its parent midpoint.
2. The normalized labelled family is exactly {(p,½) : p is prime}. Projection retaining p recovers the prime identity. Equal event coordinates do not identify distinct records.
3. The vertex satisfies B(½) = C(0) = ½. For every Y ≥ 0, B(½ + Y) = C(Y). For every real Y, Im C(Y) = Y.
4. For every real Y, F(Y) = 0 if and only if ζ(C(Y)) = 0. Conversely, every zeta zero whose real part is ½ has a unique real Y address under C. The original position and zero multiplicity are preserved.

In particular, the two no-leak conclusions are

$$\forall p\in S,\quad x_p=\frac12,$$

$$\{C(Y):Y\in\mathbb R,\ F(Y)=0\}=\{\rho:\zeta(\rho)=0,\ \Re\rho=\tfrac12\},$$

with the second equality respecting multiplicity through the local analytic order.

**Proof.** Fix an arbitrary prime p. Theorem 1 puts p in S. The admitted record supplies the hypotheses of Theorem 2, so its two normalized readings equal ½ and its event equals its parent midpoint. The shared-midpoint hypothesis makes that event xₚ = ½. Either strict off-midpoint inequality contradicts the equality. Since p was arbitrary, this holds for every prime record; Theorem 3 states the family conclusion. The identity corollary supplies the label-preserving bijection. Theorem 7 supplies the vertex, positive turned-leg identity, and signed-chart inverse. For an arbitrary real Y, the definition of F gives the displayed vanishing equivalence. Theorem 8 proves that every crease zero is returned, its Y is unique, and its analytic order is unchanged. These implications prove both set inclusions and the multiplicity statement. No enumeration is used. $\square$

**Closure return.** Prime selection, matched midpoint placement, the common-frame vertex, the one-parameter turned leg, exact signed-crease readout, and label-preserving recovery satisfy the conclusions above throughout their declared domains. This is the verified local closure claimed by this MATHIC.

# D Address recovery and the closure criterion

## Full-address identity

For an arbitrary original zero, its full relative address recovers its original position.

$$R_Z(A(\rho))=C(\Im\rho)+(\Re\rho-1/2)=\rho.$$

**Proof.** Write $\rho=X+iY$. Then $(1/2+iY)+(X-1/2)=X+iY$. Theorem 9 identifies the pole at that original point and recovers multiplicity as the negative residue. The retained address reconstructs the point from its two real components. $\square$

## Same-height comparison

The displacement from the crease at the retained height is exactly the real offset.

$$\rho-C(\Im\rho)=\Re\rho-1/2=d.$$

**Proof.** Subtract $1/2+iY$ from $X+iY$. The imaginary components cancel, leaving $X-1/2$. In particular, this comparison vanishes at an address exactly when the original real coordinate is $1/2$. $\square$

## Full-strip equivalence

Exact recovery from Y alone for every original nontrivial zero is equivalent to the Riemann hypothesis.

$$\bigl[\forall\rho\in Z,\ C(\Im\rho)=\rho\bigr]\quad\Longleftrightarrow\quad\bigl[\forall\rho\in Z,\ \Re\rho=1/2\bigr].$$

**Proof.** The same-height identity shows that the two returns agree at a given zero exactly when $d=0$ at that zero. Quantify this pointwise equivalence over Z. Theorem 8 then supplies the unique Y address and multiplicity on the crease. $\square$

Theorems 1–3 close the admitted prime-record model. Theorem 8 closes the crease readout on its declared domain. Theorem 9 and the full-address identity recover the original zero family. The displayed full-strip equivalence is the precise universal placement criterion. The present derivation retains d and establishes no universal theorem that d vanishes.

# E Bounded contour application and evidence

## Proposition Reflection fixes a unique zero

Let U be a region in the open critical strip invariant under $J(s)=1-\overline{s}$. If U contains exactly one distinct zeta zero, that zero has real part $1/2$.

**Proof.** Zeta's functional equation and conjugation symmetry preserve its zeros in the open critical strip under J. The image of the unique zero is another zero in U. Uniqueness makes it the same point, giving $\rho=1-\overline\rho$ and $\Re\rho=1/2$. $\square$ [4]

## Reported rectangle application

The archived review reports the rectangle $0.495\le X\le0.505$, $14.1297\le Y\le14.1397$, with 128 rational boundary enclosures excluding zero and an image winding number of one. Under those enclosure and winding guarantees, the argument principle counts exactly one zero with total multiplicity one, since zeta is holomorphic in the rectangle. Thus the zero is simple. The rectangle is reflection-invariant, so the proposition fixes that zero on the critical line. [5, 6]

**Reproduction status.** The exact contour certificate and its executable verifier have not been retrieved in this workspace. The application above is carried from the pinned review and depends on its reported guarantees. This V8.1 editorial successor performs no fresh enclosure replay. The proof from those guarantees to the bounded conclusion is explicit above.

**Reported replay and finite controls.** The source record reports exact replay of 128 boundary enclosures in the same implementation and 290 separate finite control passes. It reports a residual of approximately $1.826\times10^{-12}$ near $1/2+14.134725141737i$. These are historical reported outcomes. The numerical residual supplies a finite observation; the stated contour guarantees supply the bounded zero count. [5]

# F Cross-examination and disproof tests

The identifiers q.1–q.18 preserve the paper's question list. The identifiers t.1–t.8 preserve the distinct challenge outcomes. Each answer points to a statement in this version.

## f.1 Counter-questions

### q.1 Which labels survive? 

-   The surviving labels are exactly the primes. Excluding zero, one, and every product of two integers at least two removes precisely the nonprime candidates. [Theorem 1]

### q.2 Where does a matched prime dyad sit on X? 

-   Within its own parent span, the matched event sits halfway between the endpoints. Its normalized coordinate is ½.
-   The absolute coordinate is also ½ when the parent midpoint is ½ in the shared X chart. [Theorems 2 and 7]

### q.3 What fixes the bend and its direction? 

-   In the unit frame, the points equally distant from 0 and 1 form the perpendicular bisector X = ½. The turned leg follows that line. [Theorem 7]

### q.4 Where is the shared vertex? 

-   The vertex is the same point in both descriptions. Its coordinate on the unit X segment is ½. Its signed Y coordinate is 0. [Theorem 7]

### q.5 Does the join make a grid or add a free coordinate? 

-   One distance parameter follows the path from the X leg through the bend and along the turned leg. Once on the turned leg, only Y varies. [Theorem 7]

### q.6 Can a returned Y-line zero be placed elsewhere? 

-   Each zero returned by the Y readout maps to exactly one point, ½ + iY. On Y ≥ 0, the positive bent path returns the same point as the signed chart. [Theorems 7--8]

### q.7 Can the crease readout lose, displace, or miscount a crease zero? 

-   Taking the imaginary part of the returned point recovers its Y address.
-   The affine substitution contributes a nonzero factor to the local zero expansion, so the order of vanishing stays the same. [Theorem 8]

### q.8 Do the prime modes share Y? 

-   Yes. Every prime uses the same height Y. The factor exp(−iY log p) gives each prime its own phase rate log p. [Theorem 8]

### q.9 Does the prime spectrum reproduce classical zeta there? 

-   The Euler product equals ζ(s) where Re s \> 1. Continue that function analytically, then evaluate it at ½ + iY. [Theorem 8, source 4]

### q.10 Does the aggregate recover original zeros and their multiplicities? 

-   In the open critical strip, the continued transform has a pole at each original nontrivial zero and nowhere else.
-   The pole location gives the original zero. The negative of its residue gives the zero's multiplicity. [Theorem 9]

### q.11 Does infinite addressing reach all original nontrivial zeros? 

-   Yes. The full address stores the height Y and the real offset d. Adding d to the crease point at height Y recovers the original zero. [Theorem 9 and Section D]

### q.12 What does the offset measure, and where does the comparison cancel? 

-   The offset d is the signed difference between the original real coordinate and ½. Compare both points at the same Y.
-   The comparison gives zero precisely when the original point is already on the crease. [Section D]

### q.13 What does the same-height comparison retain? 

-   The height $Y$ identifies the crease point. The offset $d$ retains the real displacement needed to recover the original zero. [Section D]

### q.14 Can rotation of the whole output create a zero? 

-   No. Multiplying the output by a unit complex phase leaves its magnitude unchanged, so a nonzero value stays nonzero. [t.5]

### q.15 Does signed mirror balance certify each address? 

-   No. Two opposite offsets can sum to zero while each is nonzero. A signed sum alone cannot establish placement at each address. [t.6]

### q.16 What did the contour prove, and what checks passed? 

-   Under the contour guarantees reported in Section E, the argument principle counts exactly one simple zero in the specified rectangle. Reflection symmetry puts it at X = ½.
-   The record reports an exact replay of 128 boundary enclosures in the same implementation and 290 separate finite control passes. The exact certificate and verifier remain pending retrieval. [Section E, source 5]

### q.17 Is counting poles and line zeros at every height a new objection? 

-   With the same signed height window and multiplicities, every crease zero is already included in the full count.
-   Equality at every cutoff would exclude any extra off-crease zero. This is the counting form of the same full-family condition. [t.8]

### q.18 What does the readout establish outside its domain? 

-   The readout identifies every zeta zero on its own crease. The full transform separately recovers each original zero's height and offset.
-   Recovery from Y alone agrees with full recovery exactly when the offset vanishes at that address. [Theorems 8–9 and Section D]


## f.2 Disproof attempts and outcomes

### t.1 Admit a nonprime or displace a matched event

- **Attempt.** Find a surviving label that is not prime, or place a matched event away from its own parent midpoint.
- **Resolution.** Theorem 1 characterizes the survivors exactly. Theorem 2 forces the midpoint from incidence and matching. Theorem 3 applies this to each admitted prime record. Absolute X = ½ additionally uses the stated common-frame condition. These deductions close the challenge within those premises.

### t.2 Move the vertex or add a free coordinate to the turned leg

- **Attempt.** Give the vertex a different relative origin in the same fixed chart, or assign two Y addresses to one point on the turned leg.
- **Resolution.** Theorem 7 gives $B(1/2)=C(0)=1/2$ and $\Im C(Y)=Y$. The latter identity supplies a unique inverse. Changing the reference would change the chart. Within the declared chart, the vertex and inverse are fixed.

### t.3 Lose an original zero or its multiplicity

- **Attempt.** Lose or move a crease zero under F, change its order, or lose an original nontrivial zero under D.
- **Resolution.** Theorem 8 gives exact crease recovery and unchanged order. Theorem 9 gives the original pole location and residue $-m$ for every original nontrivial zero. The full decoder restores its original position from $(Y,d)$. The address retains both components for that recovery.

### t.4 Break agreement with the classical zeta readout

- **Attempt.** Obtain a different value from the continued prime expression at the same crease input.
- **Resolution.** The Euler product equals zeta for $\Re s>1$. Analytic continuation carries that function identity to the crease. Theorem 8 evaluates that same function there. This is the analytic identity used by the construction, with its convergence domain stated.

### t.5 Create cancellation by rotating a nonzero output

- **Attempt.** Multiply the entire output by a complex phase and make a nonzero value vanish.
- **Resolution.** For real $\theta$ and complex z, $|e^{i\theta}|=1$, hence

$$|e^{i\theta}z|^2=|z|^2.$$

The squared magnitude vanishes precisely when z vanishes. Output rotation preserves zero status.

### t.6 Infer individual placement from mirror cancellation

- **Attempt.** Infer that both real offsets vanish because their signed sum is zero.
- **Resolution.** The pair $(d,-d)$ sums to zero for every real d. For example, $d=1/4$ gives a zero sum with two nonzero offsets. Thus the attempted inference fails. A sum of squares would satisfy $d^2+(-d)^2=0$ exactly when $d=0$, but universal vanishing of that sum needs its own proof.

### t.7 Challenge the bounded result and reported finite checks

- **Attempt.** Determine whether the rectangle result and the finite controls have the same mathematical force.
- **Resolution.** Section E proves placement from reflection-invariant uniqueness, and derives uniqueness from the reported contour guarantees. The historical record reports 128 enclosure replays and 290 finite controls. The exact certificate and verifier remain pending retrieval. This successor preserves this dependency and reports no new replay. The bounded argument applies to its stated rectangle.

### t.8 Compare the full and crease counts at every cutoff

- **Attempt.** Count poles of D and zeros of F, with multiplicity, in the same finite height window.
- **Convention.** For each $T>0$, use the signed open window $-T<\Im\rho<T$ in the full strip and $-T<Y<T$ on the crease. Both counts exclude their endpoints. Let $N_Z(T)$ and $N_F(T)$ denote these counts.
- **Resolution.** Theorems 8 and 9 make each crease zero a member of the full family with the same multiplicity. If every original zero lies on the crease, the counts are equal for every cutoff. Conversely, any off-crease zero contributes positive multiplicity to the full count at each cutoff strictly above its absolute height, while the crease count remains a subset. Thus equality at all cutoffs excludes every such zero.

$$[\forall T>0,\ N_Z(T)=N_F(T)]\quad\Longleftrightarrow\quad[\forall\rho\in Z,\ \Re\rho=1/2].$$

This is the counting form of the full-strip equivalence in Section D. It retains its status as the same universal placement condition.

# G Formal correspondence and review status

The consolidated PrimeCrease.lean uses a nonnegative subtype for bent-path distance and a separate real input for the signed chart. The arithmetic and analytic namespaces and the V8 certificate namespace are defined in that single file. It compiled successfully with Lean 4.34.0-rc2, the pinned Mathlib revision, and warnings treated as errors. The one-module Lake build also passed. All nine cached dependency checkouts matched the package manifest; library build products were reused. The included logs record both commands. [2, 3]

| Statement in V8 and V8.1 | Declaration in the consolidated source |
|---|---|
| Theorem 1 | `TryxZipper.survivor_iff_prime` |
| Theorems 2 and 3 | `matched_progress`, `midpoint`, `local_closure`, `cancelled_family_closure` |
| Common-frame placement | `shared_parent`, `TryxPrimeCrease.common_crease` |
| Theorems 4–6 | Written proofs in this MATHIC and Sections F–H of the paper |
| Theorem 7 | `unit_bisector`, `bentPath_vertex`, `bentPath_after_turn`, `crease_injective`, `crease_range` |
| Theorem 8 | `bent_zeta_readout`, `readout_exact`, `readout_preserves_analytic_order` |
| Theorem 9 | `prime_spectrum_agrees`, `aggregate_agrees`, `aggregate_simple_pole_iff`, `aggregate_residue_form` |
| Full-address recovery and universal equivalence | `decode_encode`, `y_only_exact_iff`, `full_coverage_iff_placement` |
| Rotation and mirror controls | `rotation_preserves_energy`, `signed_mirror_control` |

The local theorem names in the left column refer to complete statements in this document. The declaration names in the right column identify the relevant formal sources. The prior compilation receipt is evidence about those source files and their recorded environment.

**Retained reconciliation.** The original six-theorem development is restored. Every q.1–q.18 question and t.1–t.8 test is retained. The composite set and signed chart have distinct notation. The arbitrary-zero factorization in Theorem 9 is explicit. Historical PC labels have been replaced by the corresponding stated theorems. The same-height comparison is derived here. The counting window and the contour reproduction dependency are explicit. Historical source terminology is confined to source titles and code identifiers.

**Version status.** V8.1 adds an explicit closure theorem and proof at the opening, with its quantified premises, two proved conclusions, and full-zero scope stated together. It changes no Lean source or theorem premise and claims no new compiler run. The locked V8 source and verification logs are retained byte for byte. This V8 edition consolidates the inherited arithmetic and analytic proofs and the new certificate declarations into one self-contained PrimeCrease.lean. The consolidation preserves theorem statements and proofs while removing local imports between proof files. The reconciled 27-page paper integrates the earlier proof and reference repairs. V7 and its published source bytes remain retained; this document does not automatically replace their GitHub or ledger listings.

# H Sources

[1] Virgil Lee Gattenby. *Euler-Zeno in Prime Relatives with Prime Crease*. Historical integrated paper, 6 November 2026. [Pinned PDF](https://github.com/TRYX-Relay/TRYX-MATHIC/blob/857dd12a75e7278146775698de72f0e1d783c169/archive/riemann/paper/261106-prime-crease-integrated-v1/PAPER.pdf) · [Pinned full text](https://github.com/TRYX-Relay/TRYX-MATHIC/blob/857dd12a75e7278146775698de72f0e1d783c169/archive/riemann/paper/261106-prime-crease-integrated-v1/PAPER.txt).

[2] Virgil Lee Gattenby. PrimeCrease.lean. Consolidated V8 proof source, included in this package. This is the sole Lean source file supplied for execution.

[3] SINGLE_LEAN_VERIFICATION.md and the included compiler and Lake build logs, 6 November 2026. They record fresh verification of the exact consolidated source.

[4] National Institute of Standards and Technology. *NIST Digital Library of Mathematical Functions*. [Definition and continuation, §25.2](https://dlmf.nist.gov/25.2) · [Reflection formulas, §25.4](https://dlmf.nist.gov/25.4) · [Zeros, §25.10](https://dlmf.nist.gov/25.10) · [Euler products and Dirichlet series, §27.4](https://dlmf.nist.gov/27.4).

[5] [Pinned October 30 contour review](https://github.com/TRYX-Relay/TRYX-MATHIC/blob/ab33aa82607bda4bcc2ed041e418fb9e1dabb45a/archive/riemann/theorems/261030-perspective-memory-successor-v1/FINDINGS.txt) · [Pinned November 3 challenge record](https://github.com/TRYX-Relay/TRYX-MATHIC/blob/ab33aa82607bda4bcc2ed041e418fb9e1dabb45a/archive/riemann/frontier-formulas/261103-reconciliation-mathic-v1/README.md). These are the retrieved reports for the numerical application. The exact certificate and executable verifier remain pending retrieval.

[6] Lars V. Ahlfors. *Complex Analysis*. 3rd ed. McGraw-Hill, 1979. Chapter 4, Theorem 18, argument principle. [Digitized edition](https://mccuan.math.gatech.edu/courses/6321/lars-ahlfors-complex-analysis-third-edition-mcgraw-hill-science_engineering_math-1979.pdf).

[7] Virgil Lee Gattenby. [Prime Crease MATHIC V6 predecessor](https://github.com/TRYX-Relay/TRYX-MATHIC/blob/857dd12a75e7278146775698de72f0e1d783c169/archive/riemann/prime-crease/261106-v6/MATHIC.md). Preserved source lineage for the construction, questions, and eight challenge outcomes.

[8] *Riemann package audit and fresh Lean verification*, 6 November 2026. Included as LEAN_VERIFICATION_CURRENT.md in publication package v1.3, alongside lean-compile.log and lake-build.log. Both commands exited with code 0. No independent second-kernel check or new contour replay is claimed.

[9] Virgil Lee Gattenby. *Euler-Zeno in Prime Relatives with Prime Crease*. Reconciled 27-page successor, 6 November 2026. [Pinned paper and source index](https://github.com/TRYX-Relay/TRYX-MATHIC/blob/b7f9752a0708b1dbc580401cebd7d4d60e0b25ed/archive/riemann/paper/261106-prime-crease-reconciled-v2/README.md).

[10] The V8 certificate declarations are included in the sole PrimeCrease.lean file under namespace TryxVerifiedLocalClosureV8. All four compiled with warnings treated as errors.
