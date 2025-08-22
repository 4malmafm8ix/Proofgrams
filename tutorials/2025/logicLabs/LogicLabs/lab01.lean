-- We can now revisit Lab01/Lab08 to formally verify
-- our proofs with Lean.

-- For each of the theorems below you can write
-- the proof term explicitly, or you can use Lean
-- tactics to help write the proof-term.
variable (A B C D : Prop)

theorem Q1 (f : A → B → C) : B → A → C :=
  sorry

theorem Q2 (t : A ∧ B) : B ∧ A :=
  sorry

theorem Q3 (t : A ∨ B) : B ∨ A :=
  sorry

theorem Q4 (f : A ∧ B → C) : A → B → C :=
  sorry

theorem Q5 (f : A → B → C) : A ∧ B → C :=
  sorry

theorem Q6 (f : A → B) : (A → B ∨ C) :=
  sorry

theorem Q7 (f : A → B) (g : B → C) : A → C :=
  sorry

theorem Q8 (t : A ∨ B) (f : A → C) (g : B → D) : C ∨ D :=
  sorry

theorem Q9 (f : A → B) : (C → A) → (C → B) :=
  sorry

theorem Q10 (t : (A → B) ∧ (A → C)) : A → (B ∧ C) :=
  sorry

theorem Q11 (t : A ∧ (B ∨ C)) : (A ∧ B) ∨ (A ∧ C) :=
  sorry

theorem Q12 (t : (A ∧ B) ∨ (A ∧ C)) : A ∧ (B ∨ C) :=
  sorry

theorem Q13 (t : A ∨ (B ∧ C)) : (A ∨ B) ∧ (B ∨ C) :=
  sorry

theorem Q14 (t : (A ∨ B) ∧ (B ∨ C)) : A ∨ (B ∧ C) :=
  sorry
