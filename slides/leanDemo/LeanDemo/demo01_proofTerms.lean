variable (P Q R : Prop)

-- Example 01
--                ⊢ P ∧ Q → Q ∧ P
theorem conj_comm : P ∧ Q → Q ∧ P :=
    fun t => ⟨t.right, t.left⟩

-- Example 02
-- ⊢ P ∨ Q → Q ∨ P
theorem disj_comm : P ∨ Q → Q ∨ P := sorry

-- Example 03 [I Combinator]
-- ⊢ P → P
example : P → P := sorry

-- Example 04 [K Combinator]
-- ⊢ P → Q → P
example : P → (Q → P) := sorry

-- Example 05 [S Combinator]
-- ⊢ (P → Q → R) → ((P → Q) → P → R)
theorem scomb : (P → Q → R) → ((P → Q) → P → R) := sorry

-- Example 06 [Composition]
-- P → Q, Q → R ⊢ P → R
theorem composition {P Q R : Prop} (f : P → Q) (g : Q → R) :
                                    P → R :=
    fun wp : P => g (f wp)

-- Example 07 [Modus Tollens]
-- P → Q, ¬Q ⊢ ¬P
-- P → Q, Q → ⊥ ⊢ P → ⊥
theorem modusTollens (f : P → Q) (n : ¬Q) : ¬P :=
    composition f n

-- Example 08 [Intuitionistic Contrapositive]
-- P → Q ⊢ ¬Q → ¬P
theorem icontra (f : P → Q) : ¬Q → ¬P := sorry

-- Example 09 [∧ssociative]
-- (P ∧ Q) ∧ R ⊢ P ∧ (Q ∧ R)
theorem conj_assoc (t : (P ∧ Q) ∧ R) : P ∧ (Q ∧ R) := sorry

-- Example 10 [∨ssociative]
-- (P ∨ Q) ∨ R ⊢ P ∨ (Q ∨ R)

-- Example 11 [Currying]
-- ⊢ (P ∧ Q → R) ↔ (P → Q → R)
theorem curry : (P ∧ Q → R) ↔ (P → Q → R) := sorry


theorem dual_hom : ((((P → Q) → Q) → Q) → Q) → ((P → Q) → Q) :=
    by
        intro f₁
        intro g₁
        apply f₁
        intro f₂
        apply f₂
        exact g₁

#print dual_hom

-- P**** -> P**
example : ((((P → Q) → Q) → Q) → Q) → ((P → Q) → Q) :=
    λ f g => f (λ h => h g)

-- P*** -> P*
example : (((P → Q) → Q) → Q) → (P → Q) :=
    λ f g => f (λ h => h g)

-- P** -> P
example : ((P → Q) → Q) → P :=
    λ f => _ -- Not intuitionistically provable!
             -- It would imply DNE via Q = ⊥

-- P -> P**
example : P → ((P → Q) → Q) :=
    λ p f => f p
