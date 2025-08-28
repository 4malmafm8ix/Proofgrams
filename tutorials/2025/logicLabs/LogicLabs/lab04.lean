-- These examples are copied from Lab04
variable (P : Prop)
-- Notice that first order logic examples require a few more variables.
variable (α : Type)         -- Type to quantify over
variable (F G H : α → Prop) -- Predicates on that type

-- We haven't talked a lot about the type theoretic interpretation of first
-- order logic. However, the BHK tells us enough about how to think about the
-- quantifiers in a type theoretic way.

-- To prove ∃ x : α, F x
-- Exists.intro (term, a, of type α) (proof of F a)
-- To use (t : ∃ x : α, F x)
-- apply Exists.elim t

-- To prove ∀ x : α, F x
-- "intro a" will introduce an arbitrary a : α, your left to prove F a for that a.
-- To use (f : ∀ x : α, F x)
-- One requires an (a : α) and the one can apply f to get a term of type (F a)

-- Chapter 4 of Theorem Proving in Lean 4 has more details on quantifiers in Lean.

theorem Q1 (f : ∀ x : α, F x → G x) : (∀ x : α, F x) → (∀ x : α, G x) :=
  sorry

theorem Q2 (f : ∀ x : α, (F x ∨ G x) → H x) (t : ∀ x : α, ¬H x) : ∀ x : α, ¬F x :=
  sorry

theorem Q3 (t : ∀ x : α, F x ∧ G x) : (∀ x : α, F x) ∧ (∀ x : α, G x) :=
  sorry

theorem Q4 (t : (∀ x : α, F x) ∧ (∀ x : α, G x)) : ∀ x : α, F x ∧ G x :=
  sorry

theorem Q5 (f : ∀ x : α, P → F x) : P → ∀ x : α, F x :=
  sorry

theorem Q6 (f : P → ∀ x : α, F x) : ∀ x : α, P → F x :=
  sorry

theorem Q7 (t : ∃ x : α, P → F x) : P → ∃ x : α, F x :=
  sorry

theorem Q8 (t : ∃ x : α, ¬F x) : ¬∀ x : α, F x :=
  sorry

theorem Q9 (f : ∀ x : α, ¬F x) : ¬∃ x : α, F x :=
  sorry

theorem Q10 (f : (∃ x : α, F x) → P) : ∀ x : α, F x → P :=
  sorry

theorem Q11 (t : ∃ x : α, F x → G x) : (∀ x : α, F x) → (∃ x : α, G x) :=
  sorry

theorem Q12 (f : ∀ x : α, F x) : ¬∃ x : α, ¬F x :=
  sorry

theorem Q13 (t : ∃ x : α, F x) : ¬∀ x : α, ¬F x :=
  sorry

theorem Q14 (f : ∀ x : α, F x → ¬G x) : ¬∃ x : α, F x ∧ G x :=
  sorry

theorem Q15 : (∃ x : α, F x ∨ G x) ↔ ((∃ x : α, F x) ∨ (∃ x : α, G x)) :=
  sorry

theorem Q16 (f₁ : ∀ x : α, F x ∨ G x) (f₂ : ∀ x : α, ¬G x) : ∀ x : α, F x :=
  sorry

-- The remaining theorems may require classical modes of reasoning.
-- We will open Pandora's Box... I mean the classical namespace.
open Classical -- Beware!

theorem Q17 (f : ¬∀ x : α, F x) : ∃ x : α, ¬ F x :=
  sorry

theorem Q18 (f : ¬∀ x : α, ¬F x) : ∃ x : α, F x :=
  sorry

theorem Q19 (f : ¬∃ x : α, ¬F x) : ∀ x : α, F x :=
  sorry
