module

public import Mathlib.Data.Nat.Prime.Defs
public import Mathlib.Data.Real.Basic
public import Mathlib.Tactic
public import Mathlib.NumberTheory.EulerProduct.DirichletLSeries
public import Mathlib.NumberTheory.LSeries.Dirichlet
public import Mathlib.Analysis.Analytic.Order
public import Mathlib.Analysis.Meromorphic.Order
public import Mathlib.Analysis.Normed.Module.Connected

@[expose] public section

namespace TryxZipper

theorem matched_progress (t u : ℝ)
    (incidence : t + u = 1) (matching : t = u) :
    t = 1 / 2 ∧ u = 1 / 2 := by
  sorry

theorem midpoint (a b x t u : ℝ)
    (incidence : t + u = 1) (matching : t = u)
    (location : x = a + (b - a) * t) :
    x = (a + b) / 2 := by
  sorry

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
  sorry

theorem no_off_crease {P : Set ℕ} (m : Model P)
    (p : ℕ) (hp : p ∈ P) :
    ¬ (m.x p < (m.a p + m.b p) / 2 ∨
       (m.a p + m.b p) / 2 < m.x p) := by
  sorry

theorem all_primes_at_parent_crease {P : Set ℕ}
    (m : Model P)
    (certificate : ∀ p, p ∈ P ↔ Nat.Prime p) :
    ∀ p, Nat.Prime p → m.x p = (m.a p + m.b p) / 2 := by
  sorry

theorem shared_parent {P : Set ℕ} (m : Model P)
    (a b : ℝ)
    (sameA : ∀ p ∈ P, m.a p = a)
    (sameB : ∀ p ∈ P, m.b p = b) :
    ∀ p ∈ P, m.x p = (a + b) / 2 := by
  sorry

def Zipper (P : Set ℕ) : Set (ℕ × ℝ) :=
  {z | z.1 ∈ P ∧ z.2 = 1 / 2}

theorem zipper_membership {P : Set ℕ}
    (certificate : ∀ p, p ∈ P ↔ Nat.Prime p) (p : ℕ) :
    (∃ x, (p, x) ∈ Zipper P) ↔ Nat.Prime p := by
  sorry

def Survivor (n : ℕ) : Prop :=
  2 ≤ n ∧ ¬ ∃ u v : ℕ, 2 ≤ u ∧ 2 ≤ v ∧ u * v = n

theorem survivor_iff_prime (n : ℕ) :
    Survivor n ↔ Nat.Prime n := by
  sorry

theorem cancelled_family_closure (m : Model {n | Survivor n}) :
    ∀ p, Nat.Prime p → m.x p = (m.a p + m.b p) / 2 := by
  sorry

end TryxZipper

namespace TryxPrimeCrease

open Filter Topology
open scoped BigOperators

theorem common_crease
    (m : TryxZipper.Model {n | TryxZipper.Survivor n})
    (h : ∀ p, Nat.Prime p → (m.a p + m.b p) / 2 = 1 / 2)
    (p : ℕ) (hp : Nat.Prime p) :
    m.x p = 1 / 2 := by
  sorry

theorem unit_bisector (x y : ℝ) :
    x^2 + y^2 = (1-x)^2 + y^2 ↔ x = 1/2 := by
  sorry

noncomputable def crease (y : ℝ) : ℂ := ⟨1/2, y⟩

def PathDistance := {t : ℝ // 0 ≤ t}

noncomputable def bentPath (t : PathDistance) : ℂ :=
  if t.val < 1/2 then ⟨t.val, 0⟩
  else crease (t.val - 1/2)

noncomputable def turnedDistance (y : ℝ)
    (hy : 0 ≤ y) : PathDistance :=
  ⟨1/2 + y, by linarith⟩

theorem bentPath_start :
    bentPath ⟨0, le_rfl⟩ = 0 := by
  sorry

theorem bentPath_after_turn (y : ℝ) (hy : 0 ≤ y) :
    bentPath (turnedDistance y hy) = crease y := by
  sorry

theorem bentPath_vertex :
    bentPath ⟨1/2, by norm_num⟩ = crease 0 := by
  sorry

theorem crease_injective : Function.Injective crease := by
  sorry

theorem crease_range :
    Set.range crease = {s : ℂ | s.re = 1/2} := by
  sorry

theorem prime_spectrum_agrees (s : ℂ) (h : 1 < s.re) :
    (∏' p : Nat.Primes, (1 - (p : ℂ) ^ (-s))⁻¹) =
      riemannZeta s := by
  sorry

noncomputable def aggregate (s : ℂ) : ℂ :=
  - deriv riemannZeta s / riemannZeta s

theorem aggregate_agrees (s : ℂ) (h : 1 < s.re) :
    LSeries (fun n ↦ (ArithmeticFunction.vonMangoldt n : ℂ)) s =
      aggregate s := by
  sorry

theorem aggregate_simple_pole (s : ℂ)
    (ha : AnalyticAt ℂ riemannZeta s)
    (h₀ : meromorphicOrderAt riemannZeta s ≠ 0)
    (hfin : meromorphicOrderAt riemannZeta s ≠ ⊤) :
    meromorphicOrderAt aggregate s = -1 := by
  sorry

theorem aggregate_simple_pole_iff (s : ℂ) (hs : s ≠ 1) :
    meromorphicOrderAt aggregate s = -1 ↔ riemannZeta s = 0 := by
  sorry

theorem aggregate_residue_form (s : ℂ) (hs : s ≠ 1) (m : ℕ)
    (hm : analyticOrderAt riemannZeta s = m) :
    ∃ r : ℂ → ℂ, AnalyticAt ℂ r s ∧
      ∀ᶠ z in 𝓝[≠] s,
        aggregate z = -(m : ℂ) / (z - s) + r z := by
  sorry

noncomputable def readout (y : ℝ) : ℂ :=
  riemannZeta (crease y)

theorem bent_zeta_readout (y : ℝ) (hy : 0 ≤ y) :
    riemannZeta (bentPath (turnedDistance y hy)) = readout y := by
  sorry

noncomputable def stripZeros : Set ℂ :=
  {s | 0 < s.re ∧ s.re < 1 ∧ riemannZeta s = 0}

theorem readout_exact (s : ℂ) :
    (∃! y : ℝ, crease y = s ∧ readout y = 0) ↔
      s.re = 1/2 ∧ riemannZeta s = 0 := by
  sorry

theorem multiplicity_factor_transport
    (f g : ℂ → ℂ) (z w w₀ : ℂ) (m : ℕ)
    (h : f (z + (w - w₀) * Complex.I) =
      (z + (w - w₀) * Complex.I - z)^m *
        g (z + (w - w₀) * Complex.I))
    (hg : g z ≠ 0) :
    f (z + (w - w₀) * Complex.I) =
      (w - w₀)^m *
        (Complex.I^m * g (z + (w - w₀) * Complex.I)) ∧
      Complex.I^m * g z ≠ 0 := by
  sorry

noncomputable def complexCrease (w : ℂ) : ℂ :=
  (1/2 : ℂ) + w * Complex.I

theorem complexCrease_ofReal (y : ℝ) :
    complexCrease (y : ℂ) = crease y := by
  sorry

theorem rotation_preserves_energy (theta : ℝ) (z : ℂ) :
    ‖Complex.exp ((theta : ℂ) * Complex.I) * z‖ ^ 2 =
      ‖z‖ ^ 2 := by
  sorry

theorem readout_preserves_analytic_order (w : ℂ) :
    analyticOrderAt (riemannZeta ∘ complexCrease) w =
      analyticOrderAt riemannZeta (complexCrease w) := by
  sorry

noncomputable def encode (s : ℂ) : ℝ × ℝ :=
  (s.im, s.re - 1/2)

noncomputable def decode (a : ℝ × ℝ) : ℂ :=
  ⟨1/2 + a.2, a.1⟩

theorem decode_encode (s : ℂ) :
    decode (encode s) = s := by
  sorry

theorem y_only_exact_iff (s : ℂ) :
    crease (encode s).1 = s ↔ (encode s).2 = 0 := by
  sorry

theorem full_coverage_iff_placement :
    (∀ s ∈ stripZeros, ∃! y : ℝ, crease y = s ∧ readout y = 0) ↔
    (∀ s ∈ stripZeros, s.re = 1/2) := by
  sorry

theorem signed_mirror_control (d : ℝ) :
    d + (-d) = 0 ∧ (d^2 + (-d)^2 = 0 ↔ d = 0) := by
  sorry

end TryxPrimeCrease

namespace TryxVerifiedLocalClosureV8

theorem prime_local_closure
    (m : TryxZipper.Model {n | TryxZipper.Survivor n})
    (shared : ∀ p, Nat.Prime p →
      (m.a p + m.b p) / 2 = 1 / 2)
    (p : ℕ) (hp : Nat.Prime p) :
    m.t p = 1 / 2 ∧ m.u p = 1 / 2 ∧ m.x p = 1 / 2 ∧
      ¬ (m.x p < (m.a p + m.b p) / 2 ∨
         (m.a p + m.b p) / 2 < m.x p) := by
  sorry

theorem bent_local_closure (y : ℝ) (hy : 0 ≤ y) :
    TryxPrimeCrease.bentPath
      (TryxPrimeCrease.turnedDistance y hy) =
      TryxPrimeCrease.crease y ∧
    (TryxPrimeCrease.crease y).re = 1 / 2 ∧
    (TryxPrimeCrease.crease y).im = y ∧
    (riemannZeta (TryxPrimeCrease.bentPath
      (TryxPrimeCrease.turnedDistance y hy)) = 0 ↔
      TryxPrimeCrease.readout y = 0) := by
  sorry

theorem signed_readout_local_closure (s : ℂ) :
    (∃! y : ℝ, TryxPrimeCrease.crease y = s ∧
      TryxPrimeCrease.readout y = 0) ↔
    s.re = 1 / 2 ∧ riemannZeta s = 0 := by
  sorry

theorem vertex_local_closure :
    TryxPrimeCrease.bentPath ⟨1 / 2, by norm_num⟩ =
      TryxPrimeCrease.crease 0 := by
  sorry

end TryxVerifiedLocalClosureV8
