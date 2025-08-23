variable (A B C D : Prop)
-- Type theory as developed by Per Martin-Lof
-- is an intuitionistic theory. However, we can
-- always pretend we have a proof of LEM and use
-- that in an otherwise intutionistic proof.

-- Lean allows us to pretend we have a proof of
-- A ∨ ¬A for any A : Prop.
open Classical
#check em A

-- em is actually a theorem in Lean.
-- Section 12.6 of Theorem Proving in Lean 4
-- explains on what grounds one can *prove* LEM.
-- See the following print statement for the proof-term.
#print em

-- This means Lean4 can check theorems relying on classical
-- logic by opening the *Classical* namespace and
-- doing an Or.elim on an appropriate instance of LEM
-- Or.elim (em A) will suffice for each of these exercises.

-- Section 3.5 of TPiL4 explains more about proving classical theorems.

theorem Q1 (f : ¬(A ∧ B)) : ¬A ∨ ¬B :=
  sorry

theorem Q2 (f : A → B) : ¬A ∨ B :=
  sorry

theorem Q3 : (A → B) ∨ (B ∨ C) :=
  sorry

theorem Q4 : A → (B ∨ ¬B) :=
  sorry

theorem Q5 : (¬A → A) → A :=
  sorry

theorem Q6 (f : A → B) : (A → D) ∨ (C → B) :=
  sorry

theorem Q7 (f : ¬(A → B)) : A ∧ ¬B :=
  sorry

theorem Q8 : ((A → B) → A) → A :=
  sorry
