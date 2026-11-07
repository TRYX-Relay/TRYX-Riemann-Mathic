# Half-fold and perpendicular-line theorem

Identifier: HALF_FOLD_CRITICAL_LINE.261019.V1
Date: 2026-10-19
Status: PROVED UNDER THE STATED EUCLIDEAN HYPOTHESES; NOT A PROOF OF RH.

## Definition and scope
The connected construction is a unit segment, its endpoint-matching half-fold, and a variable perpendicular displacement. The half-length and right angle belong to this construction together. Zero is the chosen coordinate origin; one is the segment length; one-half is its midpoint coordinate. These are declared geometric structures, not geometry inferred from three bare scalar symbols.

## Hypotheses
Work in an oriented Euclidean plane with orthonormal vectors e,f and origin O. Let U=O+e, so OU has unit length. A fold means planar reflection in a straight crease H, required to exchange O and U. Choose f as the positive perpendicular direction. The same length unit is used on both axes.

## Theorem
There is exactly one such reflection crease. It is H={O+(1/2)e+t f : t in R}. Its intersection M with OU satisfies OM=MU=1/2 and H is perpendicular to OU. Under the complex coordinate map C(O+x e+y f)=x+i y, H maps bijectively onto Re(s)=1/2.

## Proof
For any X=O+x e+y f on a reflection crease exchanging O and U, reflection fixes X and preserves distance. Thus ||X-O||^2=||X-U||^2. Expanding gives x^2+y^2=(x-1)^2+y^2, hence 2x=1. Every point of H therefore has x=1/2; since H is a straight line, it must be that entire perpendicular bisector. Conversely the reflection R(O+x e+y f)=O+(1-x)e+y f fixes precisely x=1/2, preserves Euclidean distances, and exchanges O and U. This proves existence and uniqueness. Its intersection with y=0 is M=O+(1/2)e, so both half-segments have length 1/2. Their direction e is perpendicular to f because e dot f=0. Every point P_t=M+t f has C(P_t)=1/2+i t. Conversely every complex s with Re(s)=1/2 is C(P_t) for the unique t=Im(s). QED.

## Scale and origin corollary
For a nonzero segment vector v=U-O of length L and unit perpendicular f, define normalized coordinates x=((X-O) dot (v/L))/L and y=((X-O) dot f)/L. The same proof places its endpoint-matching crease at x=1/2. Its physical half-length is L/2. Uniform nonzero scaling and transported frames preserve this normalized relation. In crease-centered coordinates u=x-1/2, that same crease has u=0: coordinate zero and normalized one-half describe the same locus in different frames.

## Zeta connection
Define F(t)=zeta(1/2+i t), for real t. The constructed point P_t is a Riemann zeta zero exactly when F(t)=0. This statement defines the restriction and its zero criterion; it does not assert that every t is a zero.
RH requires the additional universal assertion: for every rho with 0<Re(rho)<1 and zeta(rho)=0, rho belongs to C(H). This assertion is not established by the geometric proof. No independent prime-to-zero assignment or native ENIAD execution is asserted here.

## Audit boundaries
- The right angle proved is between crease and segment, not a physical 90-degree dihedral folding angle.
- Endpoint matching and Euclidean reflection are explicit hypotheses; a freely chosen bend has no unique midpoint constraint.
- The perpendicular displacement t is free; a half-length does not determine it.
- A plane and metric are assumed; emergence of the plane from a bare distinction is not proved here.
- Exact rational regression checks supplement, but do not replace, the algebraic proof for all real x,y,t.

## Provenance
Formalizes the owner's connected half-leg/right-angle/variable-leg explanation in this conversation. Reuses the endpoint-matching scope of TRYX_CREASE_COORDINATE_REFLECTED_PATH_THEOREM_261017_V1/THEOREM.md. Preserves earlier records; publication does not promote this geometric result into RH.

