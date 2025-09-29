variable (P Q R S T : Prop)
variable (α : Type)
variable (F G H : α → Prop)

----------------------------------------------------------------------
----------------------------------------------------------------------
--    Propositional Logic Examples (In order of appearance in notes)
----------------------------------------------------------------------
----------------------------------------------------------------------

-- Program composition
--                       P → Q       Q → R  : P → R
theorem composition (f : P → Q) (g : Q → R) : P → R :=
  λ p : P =>
    g (f p)

-- I combinator
theorem Icombinator : P → P :=
  λ p : P =>
    p

-- S combinator
theorem Scombinator : (P → (Q → R)) → ((P → Q) → (P → R)) :=
  λ f =>
    λ g =>
      λ p =>
        (f p) (g p)

-- K Combinator
theorem Kcombinator : P → (Q → P) :=
  λ p : P =>
    λ q : Q =>
      p


-- ∧-comm
theorem conj_comm (t : P ∧ Q) : Q ∧ P :=
  And.intro (And.right t)
            (And.left t)

-- And Assoc
theorem conj_assoc (t : (P ∧ Q) ∧ R) : P ∧ (Q ∧ R) :=
  And.intro (And.left (And.left t))
            (And.intro (And.right (And.left t))
                       (And.right t))


-- Currying
--                 (P ∧ Q) → R  ⊢ P → (Q → R)
theorem curry (f : (P ∧ Q) → R) : P → (Q → R) :=
  λ p : P =>
    λ q : Q =>
      f (And.intro p q)

theorem uncurry (f :  P → (Q → R)) :  (P ∧ Q) → R :=
  λ t : P ∧ Q =>
    (f (And.left t)) (And.right t)

-- curry ∘ uncurry ≅ id i.e. logically equivalent.
theorem curry_equiv : (P ∧ Q) → R ↔ P → (Q → R) :=
  Iff.intro
    -- (P ∧ Q) → R ⊢ P → (Q → R)
    (curry P Q R)
    -- P → (Q → R) ⊢ (P ∧ Q) → R
    (uncurry P Q R)


theorem disj_comm (t : P ∨ Q) : Q ∨ P :=
  by
    apply Or.elim t
    -- case left
    intro p
    apply Or.intro_right
    exact p
    -- case right
    intro q
    apply Or.intro_left
    exact q

theorem disj_assoc (t : (P ∨ Q) ∨ R) : P ∨ (Q ∨ R) :=
  by
    apply Or.elim t
    -- left case
    intro s
    apply Or.elim s
      -- left case of left case
    intro p
    apply Or.intro_left
    exact p
      -- right case of left case
    intro q
    apply Or.intro_right
    apply Or.intro_left
    exact q
    --right case
    intro r
    apply Or.intro_right
    apply Or.intro_right
    exact r


-- Modus tollens
theorem modus_tollens (f : P → Q) (nq : ¬Q) : ¬P :=
  λ p : P =>
    nq (f p)

-- Contraposition
theorem icontraposition (f : P → Q) : ¬Q → ¬P :=
  λ w : ¬Q =>
    modus_tollens P Q f w


----------------------------------------------------------------------
----------------------------------------------------------------------
--        Predicate Logic Examples
----------------------------------------------------------------------
----------------------------------------------------------------------

theorem universal_mp (f1 : ∀ x : α, F x → G x) (f2 : ∀ x : α, F x) :
  ∀ x : α, G x :=
    by
      intro a
      have w1 : F a := f2 a
      have w2 : G a := (f1 a) w1
      exact w2
