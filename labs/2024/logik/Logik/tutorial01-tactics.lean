-- Tutorial 01 :: Minimal logic exercises with tactics.
variable (P Q R S T : Prop)

--                 (P ∧ Q) → R  ⊢ P → (Q → R)
theorem curry (f : (P ∧ Q) → R) : P → (Q → R) :=
  by
    intro p q
    exact f (And.intro p q)

--                   P → (Q → R)  ⊢ (P ∧ Q) → R
theorem uncurry (f : P → (Q → R)) : (P ∧ Q) → R :=
  by
    intro h
    exact (f h.left) h.right

--                 P → (Q → R) ⊣⊢ (P ∧ Q) → R
theorem currying : P → (Q → R)  ↔ (P ∧ Q) → R :=
  by
    apply Iff.intro
    apply uncurry
    apply curry

--                                   ¬P ∨ ¬Q  ⊢ ¬(P ∧ Q)
theorem deMogran_notConj_factor (t : ¬P ∨ ¬Q) : ¬(P ∧ Q) :=
  by
    intro h
    apply Or.elim t
    intro np
    exact np h.left
    intro nq
    exact nq h.right

--                     ¬(P ∨ Q) ⊢ ¬P ∧ ¬Q
--                              ⊢ ¬(P ∨ Q) → ¬P ∧ ¬Q
theorem deMorgan_notDisj_expand : ¬(P ∨ Q) → ¬P ∧ ¬Q :=
  by
    intro h
    apply And.intro
    intro p
    have t1 := Or.intro_left Q p
    exact h t1
    intro q
    have t2 := Or.intro_right P q
    exact h t2

--                      ¬P ∧ ¬Q ⊢ ¬(P ∨ Q)
--                              ⊢ ¬P ∧ ¬Q → ¬(P ∨ Q)
theorem deMorgan_notDisj_factor : ¬P ∧ ¬Q → ¬(P ∨ Q) :=
  by
    intro t1 t2
    apply Or.elim t2
    intro p
    exact t1.left p
    intro q
    exact t1.right q

--                       ⊢ ¬(P ∨ Q) ↔ ¬P ∧ ¬Q
theorem deMorgan_notDisj : ¬(P ∨ Q) ↔ ¬P ∧ ¬Q :=
  by
    apply Iff.intro
    exact deMorgan_notDisj_expand P Q
    exact deMorgan_notDisj_factor P Q

--                            P → Q,      Q → R  ⊢ P → R
theorem impl_composition (f : P → Q) (g : Q → R) : P → R :=
  by
    intro p
    exact g (f p)

--                P ∨ Q,      P → R,      Q → S  ⊢ R ∨ S
theorem case (t : P ∨ Q) (f : P → R) (g : Q → S) : R ∨ S :=
  by
    apply Or.elim t
    intro p
    exact Or.intro_left S (f p)
    intro q
    exact Or.intro_right R (g q)

--                         P → Q,       ¬Q  ⊢ ¬P
theorem modus_tollens (f : P → Q) (nq : ¬Q) : ¬P :=
  λ wp : P =>
    nq (f wp)

--            ¬R ∨ ¬S,      P → R,      Q → S  ⊢ ¬P ∨ ¬Q
example (t1 : ¬R ∨ ¬S) (f : P → R) (g : Q → S) : ¬P ∨ ¬Q :=
  by
    cases t1 with
    | inr h2 => have nq : ¬Q := modus_tollens Q S g h2
                apply Or.intro_right (¬P) nq
    | inl h1 => have np : ¬P := modus_tollens P R f h1
                apply Or.intro_left (¬Q) np


--                         P,       ¬P  ⊢ ¬B
theorem minimal_falso (p : P) (np : ¬P) : ¬B :=
  by
    intro b
    exact np p

--                        P → Q       P → ¬Q  ⊢ ¬P
theorem lesser_falso (f : P → Q) (g : P → ¬Q) : ¬P :=
  by
    intro p
    exact (g p) (f p)

--                             P  ⊢ ¬¬P
theorem double_neg_intro (wp : P) : ¬¬P :=
  by
    intro h
    exact h wp

--                       ¬¬¬P  ⊢ ¬P
theorem minmial_dne (f : ¬¬¬P) : ¬P :=
  by
    intro h1
    apply f
    exact double_neg_intro P h1
