-- Write formally verified proofs for Lab02.
-- Write proof-terms explicitly or use tactics.
variable (A B C D : Prop)

theorem Q1 (f : ¬A) : (C → A) → ¬C :=
  sorry

theorem Q2 (t : A ∧ ¬B) : ¬(A → B) :=
  sorry

theorem Q3 (f : A → C) (g : B → D) (t : ¬C ∨ ¬D) : ¬A ∨ ¬B :=
  sorry

theorem Q4 (wa : A) (wna : ¬A) : ¬B :=
  sorry

theorem Q5 (f : A → B) (g : A → ¬B) : ¬A :=
  sorry

theorem Q6 (f : A → ¬B) : B → ¬A :=
  sorry

theorem Q7 (f : ¬(A ∧ B)) : A → ¬B :=
  sorry

theorem Q8 (wa : A) : ¬¬A :=
  sorry

theorem Q9 (f : ¬¬¬A) : ¬A :=
  sorry

theorem Q10 (t : ¬A ∨ ¬B) : ¬(A ∧ B) :=
  sorry

theorem Q11 (t : ¬A ∧ ¬B) : ¬(A ∨ B) :=
  sorry

theorem Q12 (t : ¬(A ∨ B)) : ¬A ∧ ¬B :=
  sorry

theorem Q13 (f : A → ¬B) : ¬(A ∧ B) :=
  sorry

theorem Q14 : ¬¬(A ∨ ¬A) :=
  sorry

-- The following theorems will need ExFalso
-- Which is "False.elim" in Lean.

theorem Q15 (a : A) (na : ¬A) : B :=
  sorry

theorem Q16 (na : ¬A) : A → B :=
  sorry

theorem Q17 (t : ¬A ∨ B) : A → B :=
  sorry

theorem Q18 (t : A ∨ B) (na : ¬A) : B :=
  sorry

theorem Q19 : ¬(B → A) → (A → B) :=
  sorry

theorem Q20 (f : A → B) (g : A → ¬B) : A → C :=
  sorry

theorem Q21 (t : A ∨ B) (na : ¬A) (nb : ¬B) : C :=
  sorry
