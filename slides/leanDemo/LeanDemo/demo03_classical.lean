variable (P Q R : Prop)
-- We have seen that Curry Howard is an
-- equivalence between intuitionistic
-- logic and type theory. It does not
-- extend easily to classical logic.

-- One can always pretend there is a proof of
-- LEM P ∨ ¬P and have an otherwise intuitionistic
-- proof. In fact, LEM is a **theorem** in Lean.

open Classical -- Pandora's Box is now open!
#print em -- Diaconescu's theorem: AoC => LEM

-- We don't need to worry about how to "prove"
-- the law of excluded middle. Just know that
-- it can be used from the classical namespace
-- ... if you want to. Chapter 3.5 of TPiL4.

-- Within the classical name space one can:

-- Classical Method 01:
-- Or Elimination on an instance of em P.

-- Classical Method 02:
-- RAA is called byContradiction.
-- byContradiction proves P when given a
-- proof that ¬P → ⊥

-- Example 01 [Double Negation Elimination]
-- ¬¬P ⊢ P
theorem dne (nnp : ¬¬P) : P := sorry

example (nnp : ¬¬P) : P := sorry

-- Example 02
-- P → Q ⊢ ¬P ∨ Q [Material Implication]
theorem materialImplication (f : P → Q) : ¬P ∨ Q := sorry

-- Example 03 [DeMorgan's Law]
-- ¬(P ∧ Q) ⊢ ¬P ∨ ¬Q
theorem deMorgan (f : ¬(P ∧ Q)) : ¬P ∨ ¬Q := sorry

-- Example 04
-- ¬(P → Q) ⊢ P ∧ ¬Q
example (f : ¬(P → Q)) : P ∧ ¬Q := by
  sorry

-- Example 05 [ClassicalContrapositive]
-- ¬Q → ¬P ⊢ P → Q
theorem classicalContra (f : ¬Q → ¬P) : P → Q := sorry

-- Example 06 [Pierce's Law]
-- ⊢ ((P → Q) → P) → P
theorem pierceHelper {A B : Prop} (f : ¬A) : A → B := sorry

theorem pierce : ((P → Q) → P) → P := sorry

-- To a mathematician/logician trained in the Classical
-- truth value point-of-view, any Prop is either true or false.
-- From this point of view, **details** in a proof are not
-- interesting; one only cares whether or not there is some
-- proof somewhere. This is reflected in Lean's type system
-- by forcing all propositions to be definitionally equal.
theorem proofIrrel : ∀ A B : Prop,
    (λ t : A ∧ B => Or.intro_left B t.left) =
    (λ t : A ∧ B => Or.intro_right A t.right) :=
      by
        intro A B
        rfl
-- As programs, these proofs are different. One embeds into the Left
-- summand of A + B whereas the other embeds into the Right summand.
-- Extensionally, we say, these functions are not equal!
-- Nonetheless, Lean considers them equal by definition because they
-- both happen to inhabit the same A + B : Prop.
-- If A : Prop, and a : A and b : A, then a = b **by definition**

-- However, this is only true for the level Prop of the Universe.
-- As illustrated by the following not being solved by rfl.
-- Indeed, this is not a theorem as the functions are
-- different i.e. extensionally different!
theorem termRel : ∀ (A B : Type),
  (λ t : A × B => Sum.inl t.1) =
  (λ t : A × B => Sum.inr t.2) := by
    intro A B
    rfl -- Error here: not definitionally equal for Types.
