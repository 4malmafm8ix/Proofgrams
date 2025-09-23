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

-- Example 02
-- P → Q ⊢ ¬P ∨ Q [Material Implication]

-- Example 03 [DeMorgan's Law]
-- ¬(P ∧ Q) ⊢ ¬P ∨ ¬Q

-- Example 04
-- ¬(P → Q) ⊢ P ∧ ¬Q

-- Example 05 [ClassicalContrapositive]
-- ¬Q → ¬P ⊢ P → Q

-- Example 06 [Pierce's Law]
-- ⊢ ((P → Q) → P) → P
