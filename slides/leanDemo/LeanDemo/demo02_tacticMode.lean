variable (P Q R : Prop)

-- Example 01
-- ⊢ P ∧ Q → Q ∧ P
theorem conj_comm : P ∧ Q → Q ∧ P :=
    by
        intro t
        apply And.intro
        exact t.right
        exact t.left

#print conj_comm

-- Example 02
-- ⊢ P ∨ Q → Q ∨ P
theorem disj_comm : P ∨ Q → Q ∨ P :=
    by
        intro t
        apply Or.elim t
        intro wp
        exact Or.intro_right Q wp
        intro wq
        exact Or.intro_left P wq

-- Example 03 [I Combinator]
-- ⊢ P → P
theorem icomb : P → P := by
    sorry

-- Example 04 [K Combinator]
-- ⊢ P → Q → P
theorem kcomb : P → Q → P := by
    sorry

-- Example 05 [S Combinator]
-- ⊢ (P → Q → R) → ((P → Q) → P → R)
theorem scomb : (P → Q → R) → ((P → Q) → P → R) := by
    sorry

-- Example 06 [Composition]
-- P → Q, Q → R ⊢ P → R
theorem composition (f : P → Q) (g : Q → R) : P → R :=
    by
        sorry

-- Example 07 [Modus Tollens]
-- P → Q, ¬Q ⊢ ¬P
-- P → Q, Q → ⊥ ⊢ P → ⊥
theorem modusTollens (f : P → Q) (n : ¬Q) : ¬P := sorry

-- Example 08 [Intuitionistic Contrapositive]
-- P → Q ⊢ ¬Q → ¬P
theorem iContra (f : P → Q) : ¬Q → ¬P :=
    by
        intro wnq wp
        exact wnq (f wp)

-- Example 09 [∧ssociative]
-- (P ∧ Q) ∧ R ⊢ P ∧ (Q ∧ R)
theorem conj_assoc (t : (P ∧ Q) ∧ R) : P ∧ Q ∧ R :=
    by
        sorry

-- Example 10 [∨ssociative]
-- (P ∨ Q) ∨ R ⊢ P ∨ (Q ∨ R)
theorem disj_assoc (t : (P ∨ Q) ∨ R) : P ∨ Q ∨ R := by
    sorry

-- Example 11 [Currying]
-- ⊢ (P ∧ Q → R) ↔ (P → Q → R)
theorem curry : (P ∧ Q → R) ↔ (P → Q → R) := by
    sorry
