variable (A B C : Prop)

-- Prove each of the following theorems of minimal logic.
-- You may write the proof term explicitly, or use
-- Lean's native tactics to help author the proof term.

-- Replace "sorry" with either an explicit proof term
-- or a tacitc proof generating a proof term.

-- Question 1
theorem Q1 (f : A → B → C) : B → A → C :=
  sorry

-- Question 2
theorem Q2 (t : A ∧ (B ∧ C)) : (C ∧ A) ∧ B :=
  sorry

-- Question 3
theorem Q3 (t: A ∨ B) : B ∨ A :=
  sorry

-- Question 4
theorem Q4 (f : A → ¬B) : B → ¬A :=
  sorry

-- Question 5
theorem Q5 (f : A ∧ B → C) : A → B → C :=
  sorry

-- Question 6
theorem Q6 (f : A → B → C) : A ∧ B → C :=
  sorry

-- Question 7
theorem Q7 (t : ¬A ∨ ¬B) : ¬(A ∧ B) :=
  sorry

-- Question 8
theorem Q8 (t : ¬A ∧ ¬B) : ¬(A ∨ B) :=
  sorry

-- Question 9
theorem Q9 (f : A → B) (nb : ¬B) : ¬A :=
  sorry

-- Question 10
theorem Q10 (t : (A ∧ B) ∨ (A ∧ C)) : A ∧ (B ∨ C) :=
  sorry
