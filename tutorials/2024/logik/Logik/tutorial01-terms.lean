-- Tutorial 01 :: Minimal logic exercises explicit proof terms.
variable (P Q R S T : Prop)

--                 (P ∧ Q) → R  ⊢ P → (Q → R)
theorem curry (f : (P ∧ Q) → R) : P → (Q → R) :=
  λ wp : P => λ wq : Q => f (And.intro wp wq)

--                   P → (Q → R)  ⊢ (P ∧ Q) → R
theorem uncurry (f : P → (Q → R)) : (P ∧ Q) → R :=
  λ wpq : P ∧ Q =>
    (f wpq.left) (wpq.right)

--                 P → (Q → R) ⊣⊢ (P ∧ Q) → R
theorem currying : P → (Q → R)  ↔ (P ∧ Q) → R :=
  Iff.intro
    (λ f : P → (Q → R) =>
        λ wpq : P ∧ Q =>
          (f wpq.left) (wpq.right))
    (λ f : (P ∧ Q) → R =>
      λ wp : P =>
        λ wq : Q =>
          f (And.intro wp wq))

--                P → (Q → R) ⊣⊢ (P ∧ Q) → R
theorem crrying : P → (Q → R)  ↔ (P ∧ Q) → R :=
  Iff.intro
    (uncurry P Q R)
    (curry P Q R)

--                                   ¬P ∨ ¬Q  ⊢ ¬(P ∧ Q)
theorem deMogran_notConj_factor (t : ¬P ∨ ¬Q) : ¬(P ∧ Q) :=
  λ w : P ∧ Q =>
    Or.elim t
      (λ np : ¬P =>
        np w.left)
      (λ nq : ¬Q =>
        nq w.right)

--                     ¬(P ∨ Q) ⊢ ¬P ∧ ¬Q
--                              ⊢ ¬(P ∨ Q) → ¬P ∧ ¬Q
theorem deMorgan_notDisj_expand : ¬(P ∨ Q) → ¬P ∧ ¬Q :=
  λ f : ¬(P ∨ Q) =>
    And.intro (λ wp : P =>
                f (Or.intro_left Q wp))
              (λ wq : Q =>
                f (Or.intro_right P wq))

--                      ¬P ∧ ¬Q ⊢ ¬(P ∨ Q)
--                              ⊢ ¬P ∧ ¬Q → ¬(P ∨ Q)
theorem deMorgan_notDisj_factor : ¬P ∧ ¬Q → ¬(P ∨ Q) :=
  λ t1 : ¬P ∧ ¬Q =>
    λ t2 : P ∨ Q =>
      Or.elim t2
        (λ wp : P =>
          t1.left wp)
        (λ wq : Q =>
          t1.right wq)

--                       ⊢ ¬(P ∨ Q) ↔ ¬P ∧ ¬Q
theorem deMorgan_notDisj : ¬(P ∨ Q) ↔ ¬P ∧ ¬Q :=
  Iff.intro
    (deMorgan_notDisj_expand P Q)
    (deMorgan_notDisj_factor P Q)

--                            P → Q,      Q → R  ⊢ P → R
theorem impl_composition (f : P → Q) (g : Q → R) : P → R :=
  λ wp : P =>
    g (f wp)

--                P ∨ Q,      P → R,      Q → S  ⊢ R ∨ S
theorem case (t : P ∨ Q) (f : P → R) (g : Q → S) : R ∨ S :=
  Or.elim t
    (λ wp : P =>
      Or.intro_left S (f wp))
    (λ wq : Q =>
      Or.intro_right R (g wq))

--            ¬R ∨ ¬S,      P → R,      Q → S  ⊢ ¬P ∨ ¬Q
example (t1 : ¬R ∨ ¬S) (f : P → R) (g : Q → S) : ¬P ∨ ¬Q :=
  Or.elim t1
    (λ nr : ¬R =>
      Or.intro_left (¬Q)
        (λ wp : P =>
          nr (f wp)))
    (λ ns : ¬S =>
      Or.intro_right (¬P)
        (λ wq : Q =>
          ns (g wq)))

--                         P → Q,       ¬Q  ⊢ ¬P
theorem modus_tollens (f : P → Q) (nq : ¬Q) : ¬P :=
  λ wp : P =>
    nq (f wp)

--            ¬R ∨ ¬S,      P → R,      Q → S  ⊢ ¬P ∨ ¬Q
example (t1 : ¬R ∨ ¬S) (f : P → R) (g : Q → S) : ¬P ∨ ¬Q :=
  Or.elim t1
    (λ nr : ¬R =>
      Or.intro_left (¬Q)
                    (modus_tollens P R f nr))
    (λ ns : ¬S =>
      Or.intro_right (¬P)
                    (modus_tollens Q S g ns))

--                         P,       ¬P  ⊢ ¬Q
theorem minimal_falso (p : P) (np : ¬P) : ¬Q :=
  λ wq : Q =>
    np p

--                        P → Q       P → ¬Q  ⊢ ¬P
theorem lesser_falso (f : P → Q) (g : P → ¬Q) : ¬P :=
  λ wp : P =>
    (g wp) (f wp)

--                             P  ⊢ ¬¬P
theorem double_neg_intro (wp : P) : ¬¬P :=
  λ wnp : ¬P =>
    wnp wp

--                       ¬¬¬P  ⊢ ¬P
theorem minmial_dne (f : ¬¬¬P) : ¬P :=
  λ wp : P =>
    -- f (λ wnp : ¬P =>
    --     wnp wp)
    f (double_neg_intro P wp)

--
theorem scombinator : (P → (Q → R)) → ((P → Q) → (P → R)) :=
  λ f : P → (Q → R) =>
    λ g : P → Q =>
      λ w : P =>
        (f w) (g w)
