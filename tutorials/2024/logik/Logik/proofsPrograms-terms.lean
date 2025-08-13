-- 2023 Examples from Notes: proof terms.
variable (P Q R S T : Prop)

-- Conjunction examples

--                ⊢ P ∧ Q → Q ∧ P
theorem conj_comm : P ∧ Q → Q ∧ P :=
  λ t : P ∧ Q =>
    And.intro (t.right) (t.left)

theorem conj_assoc : (P ∧ Q) ∧ R → P ∧ (Q ∧ R) :=
  λ t : (P ∧ Q) ∧ R =>
    And.intro (t.left.left)
              (And.intro (t.left.right)
                         (t.right))

-- Implication examples
theorem impl_comp : (P → Q) → ((Q → R) → (P → R)) :=
  λ f1 : P → Q =>
    λ f2 : Q → R =>
      λ p : P =>
        f2 (f1 p)

theorem curry (f : (P ∧ Q) → R) : P → (Q → R) :=
  λ wp : P =>
    λ wq : Q =>
      f (And.intro wp wq)

-- Disjunction examples
theorem disj_comm (t : P ∨ Q) : Q ∨ P :=
  Or.elim t
    (λ p : P =>
      Or.intro_right Q p)
    (λ q : Q =>
      Or.intro_left P q)

theorem disj_assoc (t : (P ∨ Q) ∨ R) : P ∨ (Q ∨ R) :=
  Or.elim t
    (λ w1 : P ∨ Q =>
      Or.elim w1
        (λ w2 : P =>
          Or.intro_left (Q ∨ R) w2)
        (λ w3 : Q =>
          Or.intro_right P (Or.intro_left R w3)))
    (λ w4 : R =>
      Or.intro_right P (Or.intro_right Q w4))

-- Negation examples
theorem modus_tollens (f : P → Q) (g : ¬Q) : ¬P :=
  λ p => g (f p)

theorem contraposition : (P → Q) → (¬Q → ¬P) :=
  λ f : P → Q =>
    λ g : ¬Q =>
      λ p : P =>
        g (f p)
