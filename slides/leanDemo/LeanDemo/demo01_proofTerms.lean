variable (P Q R : Prop)

-- Example 01
-- ⊢ P ∧ Q → Q ∧ P

-- Example 02
-- ⊢ P ∨ Q → Q ∨ P

-- Example 03 [I Combinator]
-- ⊢ P → P

-- Example 04 [K Combinator]
-- ⊢ P → Q → P

-- Example 05 [S Combinator]
-- ⊢ (P → Q → R) → ((P → Q) → P → R

-- Example 06 [Composition]
-- P → Q, Q → R ⊢ P → R

-- Example 07 [Modus Tollens]
-- P → Q, ¬Q ⊢ ¬P

-- Example 08 [Intuitionistic Contrapositive]
-- P → Q ⊢ ¬Q → ¬P

-- Example 09 [∧ssociative]
-- (P ∧ Q) ∧ R ⊢ P ∧ (Q ∧ R)

-- Example 10 [∨ssociative]
-- (P ∨ Q) ∨ R ⊢ P (Q ∨ R)

-- Example 11 [Currying]
-- ⊢ (P ∧ Q → R) ↔ (P → Q → R)
