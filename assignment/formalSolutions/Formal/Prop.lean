variable (A B C : Prop)

-- Prove each of the following theorems of minimal logic.
-- You may write the proof term explicitly, or use
-- Lean's native tactics to help author the proof term.

-- Replace "sorry" with either an explicit proof term
-- or a tacitc proof generating a proof term.

-- Question 1
theorem Q1 (f : A → B → C) : B → A → C :=
  λ b =>
    λ a =>
      (f a) b

-- Question 2
theorem Q2 (t : A ∧ (B ∧ C)) : (C ∧ A) ∧ B :=
  And.intro (And.intro (t.right.right)
                       (t.left))
            (t.right.left)

-- Question 3
theorem Q3 (t: A ∨ B) : B ∨ A :=
  Or.elim t (λ a => Or.intro_right B a)
            (λ b => Or.intro_left A b)

-- Question 4
theorem Q4 (f : A → ¬B) : B → ¬A :=
  λ b =>
    λ a =>
      (f a) b

-- Question 5
theorem Q5 (f : A ∧ B → C) : A → B → C :=
  λ a =>
    λ b =>
      f ⟨a, b⟩

-- Question 6
theorem Q6 (f : A → B → C) : A ∧ B → C :=
  λ ab =>
    (f ab.left) ab.right

-- Question 7
theorem Q7 (t : ¬A ∨ ¬B) : ¬(A ∧ B) :=
  λ ab =>
    Or.elim t (λ na => na ab.left)
              (λ nb => nb ab.right)

-- Question 8
theorem Q8 (t : ¬A ∧ ¬B) : ¬(A ∨ B) :=
  λ ab =>
    Or.elim ab (λ a => t.left a)
               (λ b => t.right b)

-- Question 9
theorem Q9 (f : A → B) (nb : ¬B) : ¬A :=
  λ a =>
    nb (f a)

-- Question 10
theorem Q10 (t : (A ∧ B) ∨ (A ∧ C)) : A ∧ (B ∨ C) :=
  Or.elim t (λ ab => ⟨ab.left,Or.intro_left C ab.right⟩)
            (λ ac => ⟨ac.left,Or.intro_right B ac.right⟩)
