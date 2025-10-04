variable (P Q R : Prop)

-- Example 01
-- ⊢ P ∧ Q → Q ∧ P
theorem conj_comm : P ∧ Q → Q ∧ P :=
    by
        intro t
        -- By And introduction it is sufficient
        -- to prove both Q and P.
        apply And.intro
        exact t.right
        exact t.left

#print conj_comm

-- Example 02
-- ⊢ P ∨ Q → Q ∨ P
theorem disj_comm : P ∨ Q → Q ∨ P :=
    by
        intro t
        -- Or.elim _ _ _
        apply Or.elim t
        -- Second branch of ∨ elimination
        intro p
        exact Or.intro_right Q p
        -- Third branch of ∨ elimination
        intro q
        --exact Or.intro_left P q
        apply Or.intro_left P
        exact q

-- Example 03 [I Combinator]
-- ⊢ P → P
theorem icomb : P → P := by
    intro p; exact p

-- Example 04 [K Combinator]
-- ⊢ P → Q → P
theorem kcomb : P → Q → P := by
    intro p q; exact p

#print kcomb

-- Example 05 [S Combinator]
-- ⊢ (P → Q → R) → ((P → Q) → P → R)
theorem scomb : (P → Q → R) → ((P → Q) → P → R) := by
    intro f g p
    have h := f p
    have t₁ := g p
    have r := h t₁
    exact r

-- Example 06 [Composition]
-- P → Q, Q → R ⊢ P → R
theorem composition (f : P → Q) (g : Q → R) : P → R :=
    by
        intro p
        exact g (f p)

-- Example 07 [Modus Tollens]
-- P → Q, ¬Q ⊢ ¬P
-- P → Q, Q → ⊥ ⊢ P → ⊥
theorem modusTollens (f : P → Q) (n : ¬Q) : ¬P :=
    composition P Q False f n

-- Example 08 [Intuitionistic Contrapositive]
-- P → Q ⊢ ¬Q → ¬P
theorem iContra (f : P → Q) : ¬Q → ¬P :=
    λ q : ¬Q => modusTollens P Q f q

-- Example 09 [∧ssociative]
-- (P ∧ Q) ∧ R ⊢ P ∧ (Q ∧ R)
theorem conj_assoc (t : (P ∧ Q) ∧ R) : P ∧ Q ∧ R :=
    by
        apply And.intro
        exact t.left.left
        apply And.intro
        exact t.left.right
        exact t.right

-- Example 10 [∨ssociative]
-- (P ∨ Q) ∨ R ⊢ P ∨ (Q ∨ R)
theorem disj_assoc (t : (P ∨ Q) ∨ R) : P ∨ Q ∨ R := by
    apply Or.elim t
    intro t₁
    apply Or.elim t₁
    intro p
    apply Or.intro_left (Q ∨ R)
    assumption
    intro q
    apply Or.intro_right P
    apply Or.intro_left R
    assumption
    intro r
    apply Or.intro_right P
    apply Or.intro_right Q
    assumption

-- Example 11 [Currying]
-- ⊢ (P ∧ Q → R) ↔ (P → Q → R)
theorem curry : (P ∧ Q → R) ↔ (P → Q → R) := by
    apply Iff.intro
    intro f p q
    --have t := And.intro p q
    exact f (And.intro p q)
    intro f t
    have g := f t.left
    have r := g t.right
    assumption
