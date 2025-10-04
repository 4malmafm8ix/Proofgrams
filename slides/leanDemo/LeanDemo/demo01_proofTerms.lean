variable (P Q R : Prop)

-- Example 01
-- ⊢ P ∧ Q → Q ∧ P
theorem conj_comm : P ∧ Q → Q ∧ P :=
    --λ t : P ∧ Q => And.intro (t.right) (t.left)
    λ t => ⟨t.right,t.left⟩

-- Example 02
-- ⊢ P ∨ Q → Q ∨ P
theorem disj_comm : P ∨ Q → Q ∨ P :=
    λ t => Or.elim t
                   (λ p => Or.intro_right Q p)
                   (λ q => Or.intro_left P q)

-- Example 03 [I Combinator]
-- ⊢ P → P
example : P → P := fun p => p

-- Example 04 [K Combinator]
-- ⊢ P → Q → P
example : P → (Q → P) :=
    λ p =>
        λ _ => p

-- Example 05 [S Combinator]
-- ⊢ (P → Q → R) → ((P → Q) → P → R)
theorem scomb : (P → Q → R) → ((P → Q) → P → R) :=
    λ f => λ g => λ p => f p (g p)

-- Example 06 [Composition]
-- P → Q, Q → R ⊢ P → R
theorem composition (f : P → Q) (g : Q → R) : P → R :=
    λ p => g (f p)

-- Example 07 [Modus Tollens]
-- P → Q, ¬Q ⊢ ¬P
-- P → Q, Q → ⊥ ⊢ P → ⊥
theorem modusTollens (f : P → Q) (n : ¬Q) : ¬P :=
    composition P Q False f n

-- Example 08 [Intuitionistic Contrapositive]
-- P → Q ⊢ ¬Q → ¬P
theorem icontra (f : P → Q) : ¬Q → ¬P :=
    λ nq => λ p => nq (f p)

-- Example 09 [∧ssociative]
-- (P ∧ Q) ∧ R ⊢ P ∧ (Q ∧ R)
theorem conj_assoc (t : (P ∧ Q) ∧ R) : P ∧ (Q ∧ R) :=
    _

-- Example 10 [∨ssociative]
-- (P ∨ Q) ∨ R ⊢ P ∨ (Q ∨ R)

-- Example 11 [Currying]
-- ⊢ (P ∧ Q → R) ↔ (P → Q → R)
theorem curry : (P ∧ Q → R) ↔ (P → Q → R) :=
    Iff.intro (λ f =>
                λ p =>
                    λ q => f ⟨p,q⟩)
              (λ f => λ t => (f t.left) t.right)
