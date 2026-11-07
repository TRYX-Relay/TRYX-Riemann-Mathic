import Mathlib.Data.Nat.Prime.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Tactic
import Mathlib.NumberTheory.EulerProduct.DirichletLSeries
import Mathlib.NumberTheory.LSeries.Dirichlet
import Mathlib.Analysis.Analytic.Order
import Mathlib.Analysis.Meromorphic.Order
import Mathlib.Analysis.Normed.Module.Connected

/- Prime Crease verified local closure V8. Consolidated source. -/

/- Local closure of the DECLARED model, not native ENIAD realization or RH. -/
namespace TryxZipper

theorem matched_progress (t u : ℝ)
    (incidence : t + u = 1) (matching : t = u) :
    t = 1 / 2 ∧ u = 1 / 2 := by
  constructor <;> linarith

theorem midpoint (a b x t u : ℝ)
    (incidence : t + u = 1) (matching : t = u)
    (location : x = a + (b - a) * t) :
    x = (a + b) / 2 := by
  obtain ⟨ht, _⟩ := matched_progress t u incidence matching
  rw [ht] at location
  linarith

structure Model (P : Set ℕ) where
  a : ℕ → ℝ
  b : ℕ → ℝ
  x : ℕ → ℝ
  t : ℕ → ℝ
  u : ℕ → ℝ
  span : ∀ p ∈ P, a p < b p
  incidence : ∀ p ∈ P, t p + u p = 1
  matching : ∀ p ∈ P, t p = u p
  location : ∀ p ∈ P, x p = a p + (b p - a p) * t p

theorem local_closure {P : Set ℕ} (m : Model P) :
    ∀ p ∈ P, m.x p = (m.a p + m.b p) / 2 := by
  intro p hp
  exact midpoint _ _ _ _ _ (m.incidence p hp)
    (m.matching p hp) (m.location p hp)

theorem no_off_crease {P : Set ℕ} (m : Model P) (p : ℕ) (hp : p ∈ P) :
    ¬ (m.x p < (m.a p + m.b p) / 2 ∨
       (m.a p + m.b p) / 2 < m.x p) := by
  rw [local_closure m p hp]
  simp

-- The cancellation/primality correspondence remains an explicit input here.
theorem all_primes_at_parent_crease {P : Set ℕ} (m : Model P)
    (certificate : ∀ p, p ∈ P ↔ Nat.Prime p) :
    ∀ p, Nat.Prime p → m.x p = (m.a p + m.b p) / 2 := by
  intro p hp
  exact local_closure m p ((certificate p).mpr hp)

theorem shared_parent {P : Set ℕ} (m : Model P) (a b : ℝ)
    (sameA : ∀ p ∈ P, m.a p = a)
    (sameB : ∀ p ∈ P, m.b p = b) :
    ∀ p ∈ P, m.x p = (a + b) / 2 := by
  intro p hp
  simpa only [sameA p hp, sameB p hp] using local_closure m p hp

def Zipper (P : Set ℕ) : Set (ℕ × ℝ) :=
  {z | z.1 ∈ P ∧ z.2 = 1 / 2}

theorem zipper_membership {P : Set ℕ}
    (certificate : ∀ p, p ∈ P ↔ Nat.Prime p) (p : ℕ) :
    (∃ x, (p, x) ∈ Zipper P) ↔ Nat.Prime p := by
  constructor
  · rintro ⟨x, hx⟩
    exact (certificate p).mp hx.1
  · intro hp
    exact ⟨1 / 2, (certificate p).mpr hp, rfl⟩

-- Exact whole-family cancellation predicate; no enumeration.
def Survivor (n : ℕ) : Prop :=
  2 ≤ n ∧ ¬ ∃ u v : ℕ, 2 ≤ u ∧ 2 ≤ v ∧ u * v = n

theorem survivor_iff_prime (n : ℕ) : Survivor n ↔ Nat.Prime n := by
  constructor
  · rintro ⟨hn, hnone⟩
    apply Nat.prime_def_lt'.mpr
    refine ⟨hn, ?_⟩
    intro d hd hdn hdiv
    obtain ⟨v, hv⟩ := hdiv
    have hv2 : 2 ≤ v := by
      by_contra h
      have : v = 0 ∨ v = 1 := by omega
      rcases this with h0 | h1
      · simp [h0] at hv
        omega
      · simp [h1] at hv
        omega
    exact hnone ⟨d, v, hd, hv2, hv.symm⟩
  · intro hp
    refine ⟨hp.two_le, ?_⟩
    rintro ⟨u, v, hu, hv, heq⟩
    have ult : u < n := by nlinarith
    exact (Nat.prime_def_lt'.mp hp).2 u hu ult ⟨v, heq.symm⟩

theorem cancelled_family_closure (m : Model {n | Survivor n}) :
    ∀ p, Nat.Prime p → m.x p = (m.a p + m.b p) / 2 := by
  apply all_primes_at_parent_crease m
  intro p
  exact survivor_iff_prime p

#print axioms TryxZipper.cancelled_family_closure
#print axioms TryxZipper.survivor_iff_prime
end TryxZipper

/- Prime-Crease MATHIC V2. The geometric and analytic readouts are typed
separately. The final equivalence records the scope of universal placement. -/
namespace TryxPrimeCrease

open Filter Topology

theorem common_crease (m : TryxZipper.Model {n | TryxZipper.Survivor n})
    (h : ∀ p, Nat.Prime p → (m.a p + m.b p) / 2 = 1 / 2)
    (p : ℕ) (hp : Nat.Prime p) : m.x p = 1 / 2 :=
  (TryxZipper.cancelled_family_closure m p hp).trans (h p hp)

theorem unit_bisector (x y : ℝ) :
    x^2 + y^2 = (1-x)^2 + y^2 ↔ x = 1/2 := by
  constructor
  · intro h
    nlinarith only [h]
  · intro h
    rw [h]
    ring

noncomputable def crease (y : ℝ) : ℂ := ⟨1/2, y⟩

-- Distance along the bent path is nonnegative by construction.
def PathDistance := {t : ℝ // 0 ≤ t}

noncomputable def bentPath (t : PathDistance) : ℂ :=
  if t.val < 1/2 then ⟨t.val, 0⟩ else crease (t.val - 1/2)

noncomputable def turnedDistance (y : ℝ) (hy : 0 ≤ y) : PathDistance :=
  ⟨1/2 + y, by linarith⟩

theorem bentPath_start : bentPath ⟨0, le_rfl⟩ = 0 := by
  simp [bentPath]
  rfl

theorem bentPath_after_turn (y : ℝ) (hy : 0 ≤ y) :
    bentPath (turnedDistance y hy) = crease y := by
  have h : ¬ (1/2 + y < 1/2) := by linarith
  have hcoord : 1/2 + y - 1/2 = y := by ring
  simp only [bentPath, turnedDistance, h, ite_false, hcoord]

theorem bentPath_vertex :
    bentPath ⟨1/2, by norm_num⟩ = crease 0 := by
  have he : turnedDistance 0 le_rfl = ⟨1/2, by norm_num⟩ := by
    apply Subtype.ext
    simp [turnedDistance]
  rw [← he, bentPath_after_turn]

theorem crease_injective : Function.Injective crease := by
  intro a b h
  exact congrArg Complex.im h

theorem crease_range : Set.range crease = {s : ℂ | s.re = 1/2} := by
  ext s
  change (∃ y : ℝ, crease y = s) ↔ s.re = 1/2
  constructor
  · rintro ⟨y, rfl⟩
    rfl
  · intro h
    refine ⟨s.im, Complex.ext ?_ rfl⟩
    exact h.symm

open scoped BigOperators

theorem prime_spectrum_agrees (s : ℂ) (h : 1 < s.re) :
    (∏' p : Nat.Primes, (1 - (p : ℂ) ^ (-s))⁻¹) = riemannZeta s :=
  riemannZeta_eulerProduct_tprod h

noncomputable def aggregate (s : ℂ) : ℂ :=
  - deriv riemannZeta s / riemannZeta s

-- The von Mangoldt coefficients give log p at prime powers and zero elsewhere.
theorem aggregate_agrees (s : ℂ) (h : 1 < s.re) :
    LSeries (fun n ↦ (ArithmeticFunction.vonMangoldt n : ℂ)) s = aggregate s :=
  ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div h

theorem aggregate_simple_pole (s : ℂ) (ha : AnalyticAt ℂ riemannZeta s)
    (h₀ : meromorphicOrderAt riemannZeta s ≠ 0)
    (hfin : meromorphicOrderAt riemannZeta s ≠ ⊤) :
    meromorphicOrderAt aggregate s = -1 := by
  have he : aggregate = - logDeriv riemannZeta := by
    funext z
    simp [aggregate, logDeriv, neg_div]
  rw [he, ← meromorphicOrderAt_neg]
  exact meromorphicOrderAt_logDeriv_eq_neg_one ha.meromorphicAt h₀ hfin

theorem aggregate_simple_pole_iff (s : ℂ) (hs : s ≠ 1) :
    meromorphicOrderAt aggregate s = -1 ↔ riemannZeta s = 0 := by
  have hmem : s ∈ ({1} : Set ℂ)ᶜ := by simpa using hs
  have ha := analyticOn_riemannZeta s hmem
  have hbase : analyticOrderAt riemannZeta (0 : ℂ) ≠ ⊤ := by
    have hzero : AnalyticAt ℂ riemannZeta 0 := analyticOn_riemannZeta 0 (by simp)
    have hv : riemannZeta 0 ≠ 0 := by rw [riemannZeta_zero]; norm_num
    rw [hzero.analyticOrderAt_eq_zero.mpr hv]
    simp
  have hfin : meromorphicOrderAt riemannZeta s ≠ ⊤ := by
    intro ht
    rw [ha.meromorphicOrderAt_eq] at ht
    apply analyticOn_riemannZeta.analyticOrderAt_ne_top_of_isPreconnected
      (isConnected_compl_singleton_of_one_lt_rank (by simp) (1 : ℂ)).isPreconnected
      (by simp) hmem hbase
    exact (ENat.map_eq_top_iff (f := (Nat.cast : ℕ → ℤ))).mp ht
  have horder : meromorphicOrderAt riemannZeta s = 0 ↔ riemannZeta s ≠ 0 := by
    rw [ha.meromorphicOrderAt_eq, ENat.map_natCast_eq_zero, ha.analyticOrderAt_eq_zero]
  constructor
  · intro hp
    by_contra hz
    have hh := meromorphicOrderAt_logDeriv_nonneg ha.meromorphicAt (horder.mpr hz)
    have he : aggregate = - logDeriv riemannZeta := by
      funext z
      simp [aggregate, logDeriv, neg_div]
    rw [he, ← meromorphicOrderAt_neg] at hp
    rw [hp] at hh
    exact (by decide : ¬ (0 : WithTop ℤ) ≤ -1) hh
  · intro hz
    exact aggregate_simple_pole s ha (fun ho => (horder.mp ho) hz) hfin

-- A punctured-neighborhood Laurent form with analytic remainder.
theorem aggregate_residue_form (s : ℂ) (hs : s ≠ 1) (m : ℕ)
    (hm : analyticOrderAt riemannZeta s = m) :
    ∃ r : ℂ → ℂ, AnalyticAt ℂ r s ∧
      ∀ᶠ z in 𝓝[≠] s, aggregate z = -(m : ℂ) / (z - s) + r z := by
  have ha : AnalyticAt ℂ riemannZeta s :=
    analyticOn_riemannZeta s (by simpa using hs)
  obtain ⟨g, hg, hgn, hfactor⟩ := ha.analyticOrderAt_eq_natCast.mp hm
  have hEq : riemannZeta =ᶠ[𝓝[≠] s] (fun z ↦ (z - s)^m * g z) := by
    filter_upwards [hfactor.filter_mono nhdsWithin_le_nhds] with z hz
    simpa only [smul_eq_mul] using hz
  refine ⟨fun z ↦ -(deriv g z / g z), (hg.deriv.div hg hgn).neg, ?_⟩
  filter_upwards [logDeriv_congr_nhdsNE hEq,
    hg.eventually_analyticAt.filter_mono nhdsWithin_le_nhds,
    (hg.continuousAt.eventually_ne hgn).filter_mono nhdsWithin_le_nhds,
    self_mem_nhdsWithin] with z hz hgz hgnz hzs
  have hne : z - s ≠ 0 := sub_ne_zero.mpr hzs
  have hdiff : DifferentiableAt ℂ (fun w : ℂ ↦ w - s) z := by fun_prop
  have hpow := logDeriv_fun_pow hdiff m
  have hl : logDeriv (fun w : ℂ ↦ w - s) z = 1 / (z - s) := by
    have hd : HasDerivAt (fun w : ℂ ↦ w - s) 1 z := (hasDerivAt_id z).sub_const s
    rw [logDeriv_apply, hd.deriv]
  have hmul := logDeriv_fun_mul (f := fun w : ℂ ↦ (w - s)^m) z (pow_ne_zero m hne) hgnz
    (hdiff.pow m) hgz.differentiableAt
  rw [hpow, hl] at hmul
  calc
    aggregate z = -logDeriv riemannZeta z := by simp [aggregate, logDeriv, neg_div]
    _ = -logDeriv (fun w ↦ (w - s)^m * g w) z := congrArg Neg.neg hz
    _ = -(m : ℂ) / (z - s) + -(deriv g z / g z) := by
      rw [hmul, logDeriv_apply]
      ring

noncomputable def readout (y : ℝ) : ℂ := riemannZeta (crease y)

theorem bent_zeta_readout (y : ℝ) (hy : 0 ≤ y) :
    riemannZeta (bentPath (turnedDistance y hy)) = readout y := by
  rw [bentPath_after_turn y hy]
  rfl

noncomputable def stripZeros : Set ℂ :=
  {s | 0 < s.re ∧ s.re < 1 ∧ riemannZeta s = 0}

theorem readout_exact (s : ℂ) :
    (∃! y : ℝ, crease y = s ∧ readout y = 0) ↔
      s.re = 1/2 ∧ riemannZeta s = 0 := by
  constructor
  · rintro ⟨y, ⟨rfl, hz⟩, _⟩
    exact ⟨rfl, hz⟩
  · rintro ⟨hx, hz⟩
    have hc : crease s.im = s := Complex.ext hx.symm rfl
    refine ⟨s.im, ⟨hc, ?_⟩, ?_⟩
    · simpa only [readout, hc] using hz
    · intro y hy
      exact crease_injective (hy.1.trans hc.symm)

-- Exact factor transport on the complex extension of the Y coordinate.
-- The source supplies a local factorization and a nonvanishing cofactor.
theorem multiplicity_factor_transport (f g : ℂ → ℂ) (z w w₀ : ℂ) (m : ℕ)
    (h : f (z + (w - w₀) * Complex.I) =
      (z + (w - w₀) * Complex.I - z)^m * g (z + (w - w₀) * Complex.I))
    (hg : g z ≠ 0) :
    f (z + (w - w₀) * Complex.I) =
      (w - w₀)^m * (Complex.I^m * g (z + (w - w₀) * Complex.I)) ∧
      Complex.I^m * g z ≠ 0 := by
  constructor
  · rw [h]
    have he : z + (w - w₀) * Complex.I - z = (w - w₀) * Complex.I := by ring
    rw [he, mul_pow, mul_assoc]
  · exact mul_ne_zero (pow_ne_zero _ Complex.I_ne_zero) hg

noncomputable def complexCrease (w : ℂ) : ℂ := (1/2 : ℂ) + w * Complex.I

theorem complexCrease_ofReal (y : ℝ) :
    complexCrease (y : ℂ) = crease y := by
  apply Complex.ext <;> simp [complexCrease, crease, Complex.mul_re, Complex.mul_im]

theorem rotation_preserves_energy (theta : ℝ) (z : ℂ) :
    ‖Complex.exp ((theta : ℂ) * Complex.I) * z‖ ^ 2 = ‖z‖ ^ 2 := by
  simp [Complex.norm_exp, Complex.mul_re]

theorem readout_preserves_analytic_order (w : ℂ) :
    analyticOrderAt (riemannZeta ∘ complexCrease) w =
      analyticOrderAt riemannZeta (complexCrease w) := by
  have ha : AnalyticAt ℂ complexCrease w := by unfold complexCrease; fun_prop
  have hd : HasDerivAt complexCrease Complex.I w := by
    change HasDerivAt (fun z : ℂ => (1/2 : ℂ) + z * Complex.I) Complex.I w
    apply HasDerivAt.const_add
    simpa only [id_eq, one_mul] using (hasDerivAt_id w).mul_const Complex.I
  exact analyticOrderAt_comp_of_deriv_ne_zero ha
    (by rw [hd.deriv]; exact Complex.I_ne_zero)

noncomputable def encode (s : ℂ) : ℝ × ℝ := (s.im, s.re - 1/2)
noncomputable def decode (a : ℝ × ℝ) : ℂ := ⟨1/2 + a.2, a.1⟩

theorem decode_encode (s : ℂ) : decode (encode s) = s := by
  apply Complex.ext
  · change 1/2 + (s.re - 1/2) = s.re
    ring
  · rfl

theorem y_only_exact_iff (s : ℂ) :
    crease (encode s).1 = s ↔ (encode s).2 = 0 := by
  change crease s.im = s ↔ s.re - 1/2 = 0
  constructor
  · intro h
    have he : 1/2 = s.re := congrArg Complex.re h
    exact sub_eq_zero.mpr he.symm
  · intro h
    exact Complex.ext (sub_eq_zero.mp h).symm rfl

theorem full_coverage_iff_placement :
    (∀ s ∈ stripZeros, ∃! y : ℝ, crease y = s ∧ readout y = 0) ↔
    (∀ s ∈ stripZeros, s.re = 1/2) := by
  constructor
  · intro h s hs
    exact ((readout_exact s).mp (h s hs)).1
  · intro h s hs
    exact (readout_exact s).mpr ⟨h s hs, hs.2.2⟩

theorem signed_mirror_control (d : ℝ) :
    d + (-d) = 0 ∧ (d^2 + (-d)^2 = 0 ↔ d = 0) := by
  constructor
  · ring
  · constructor
    · intro h
      by_contra hn
      have hp := sq_pos_of_ne_zero hn
      nlinarith
    · rintro rfl
      norm_num

#print axioms TryxPrimeCrease.bent_zeta_readout
#print axioms TryxPrimeCrease.common_crease
#print axioms TryxPrimeCrease.prime_spectrum_agrees
#print axioms TryxPrimeCrease.aggregate_agrees
#print axioms TryxPrimeCrease.aggregate_simple_pole_iff
#print axioms TryxPrimeCrease.aggregate_residue_form
#print axioms TryxPrimeCrease.readout_exact
#print axioms TryxPrimeCrease.readout_preserves_analytic_order
#print axioms TryxPrimeCrease.multiplicity_factor_transport
#print axioms TryxPrimeCrease.full_coverage_iff_placement

end TryxPrimeCrease

namespace TryxVerifiedLocalClosureV8

theorem prime_local_closure
    (m : TryxZipper.Model {n | TryxZipper.Survivor n})
    (shared : ∀ p, Nat.Prime p → (m.a p + m.b p) / 2 = 1 / 2)
    (p : ℕ) (hp : Nat.Prime p) :
    m.t p = 1 / 2 ∧ m.u p = 1 / 2 ∧ m.x p = 1 / 2 ∧
      ¬ (m.x p < (m.a p + m.b p) / 2 ∨
         (m.a p + m.b p) / 2 < m.x p) := by
  have hs : TryxZipper.Survivor p := (TryxZipper.survivor_iff_prime p).mpr hp
  obtain ⟨ht, hu⟩ := TryxZipper.matched_progress (m.t p) (m.u p)
    (m.incidence p hs) (m.matching p hs)
  exact ⟨ht, hu, TryxPrimeCrease.common_crease m shared p hp,
    TryxZipper.no_off_crease m p hs⟩

theorem bent_local_closure (y : ℝ) (hy : 0 ≤ y) :
    TryxPrimeCrease.bentPath (TryxPrimeCrease.turnedDistance y hy) =
      TryxPrimeCrease.crease y ∧
    (TryxPrimeCrease.crease y).re = 1 / 2 ∧
    (TryxPrimeCrease.crease y).im = y ∧
    (riemannZeta (TryxPrimeCrease.bentPath (TryxPrimeCrease.turnedDistance y hy)) = 0 ↔
      TryxPrimeCrease.readout y = 0) := by
  refine ⟨TryxPrimeCrease.bentPath_after_turn y hy, rfl, rfl, ?_⟩
  rw [TryxPrimeCrease.bent_zeta_readout y hy]

theorem signed_readout_local_closure (s : ℂ) :
    (∃! y : ℝ, TryxPrimeCrease.crease y = s ∧ TryxPrimeCrease.readout y = 0) ↔
    s.re = 1 / 2 ∧ riemannZeta s = 0 :=
  TryxPrimeCrease.readout_exact s

theorem vertex_local_closure :
    TryxPrimeCrease.bentPath ⟨1 / 2, by norm_num⟩ =
      TryxPrimeCrease.crease 0 :=
  TryxPrimeCrease.bentPath_vertex

end TryxVerifiedLocalClosureV8

#print axioms TryxVerifiedLocalClosureV8.prime_local_closure
#print axioms TryxVerifiedLocalClosureV8.bent_local_closure
#print axioms TryxVerifiedLocalClosureV8.signed_readout_local_closure
#print axioms TryxVerifiedLocalClosureV8.vertex_local_closure
