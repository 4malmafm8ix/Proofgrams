-- Tutorial 02 :: Intuitionistic and Classical logic exercises explicit proof terms.
variable (P Q R S T : Prop)

-- Intuitionistic proofs
--    Intuitionistic logic is minimal logic with Ex Falso added.
--    In L∃∀N this is refered to as False.elim

--                     P         ¬P  ⊢ Q
theorem ex_falso (wp : P) (wnp : ¬P) : Q :=
  False.elim (wnp wp)

--                                               ¬P ∨ Q  ⊢  P → Q
theorem intuitionistic_material_implication (t : ¬P ∨ Q) : P → Q :=
  λ p : P =>
    Or.elim t
      (λ np : ¬P => False.elim (np p))
      (λ q : Q => q)

--                                 P ∨ Q       ¬P  ⊢ Q
theorem disjunctive_syllogism (t : P ∨ Q) (n : ¬P) : Q :=
  Or.elim t
    (λ p : P => False.elim (n p))
    (λ q : Q => q)

--      ⊢ ¬(Q → P) → (P → Q)
example : ¬(Q → P) → (P → Q) :=
  λ f : ¬(Q → P) =>
    λ p : P =>
      False.elim (f (λ q : Q => p))

--
theorem curried_exFalso : ¬P → (P → Q) :=
  λ wnp : ¬P =>
    λ wp : P =>
      False.elim (wnp wp)

open Classical -- Repent for this Sin!
#check em P    -- In the Classical namespace we get a proof of LEM.
#print em      -- The proof uses AoC and Diaconescu's theorem.
               -- Don't worry about; just use it :)

--          ⊢ P ∨ ¬P
theorem lem : P ∨ ¬P :=
  em P

--          ⊢ ¬¬P → P
theorem dne : ¬¬P → P :=
  λ nnp : ¬¬P =>
    Or.elim (em P)
      (λ p : P => p)
      (λ np : ¬P => False.elim (nnp np))

example : ¬¬P → P :=
  λ nnp : ¬¬P =>
    byContradiction
      (λ np : ¬P => nnp np)

--                                   ¬(P ∧ Q)) ⊢ ¬P ∨ ¬Q
theorem deMogran_notConj_expand (f : ¬(P ∧ Q)) : ¬P ∨ ¬Q :=
  Or.elim (lem P)
    (λ p : P =>
      Or.intro_right (¬P)
                     (λ q : Q =>
                      f (And.intro p q)))
    (λ np : ¬P =>
      Or.intro_left (¬Q) np)

-- Combining the previous theorem with converse from tutorial one...
--                                   ¬P ∨ ¬Q  ⊢ ¬(P ∧ Q)
theorem deMogran_notConj_factor (t : ¬P ∨ ¬Q) : ¬(P ∧ Q) :=
  λ w : P ∧ Q =>
    Or.elim t
      (λ np : ¬P =>
        np w.left)
      (λ nq : ¬Q =>
        nq w.right)

-- ... we obtain the proof of De Morgan's law for expanding not-And
--                         ¬(P ∧ Q) ⊣⊢ ¬P ∨ ¬Q
theorem deMorgan_notConj : ¬(P ∧ Q)  ↔ ¬P ∨ ¬Q :=
  Iff.intro
    (λ f : ¬(P ∧ Q) =>
      deMogran_notConj_expand P Q f)
    (λ g : ¬P ∨ ¬Q =>
      deMogran_notConj_factor P Q g)

--                                          P → Q  ⊢ ¬P ∨ Q
theorem material_implication_classical (f : P → Q) : ¬P ∨ Q :=
  Or.elim (lem P)
    (λ wp : P =>
      Or.intro_right (¬P) (f wp))
    (λ wnp : ¬P =>
      Or.intro_left Q wnp)

-- Beware openning Pandora's Box!
--              ⊢ (P → Q) ∨ (Q → P)
theorem pandora : (P → Q) ∨ (Q → P) :=
  Or.elim (lem P)
    (λ wp : P =>
      Or.intro_right (P → Q)
                     (λ wq : Q => wp))
    (λ wnp : ¬P =>
      Or.intro_left (Q → P)
                    (λ wp : P => False.elim (wnp wp)))

--                     (P → Q) ∧ (R → S)  ⊢ (P → S) ∨ (R → Q)
theorem pandawrah (t : (P → Q) ∧ (R → S)) : (P → S) ∨ (R → Q) :=
  Or.elim (lem P)
    (λ wp : P =>
      Or.intro_right (P → S)
                     (λ wr : R =>
                        t.left wp))
    (λ wnp : ¬P =>
      Or.intro_left (R → Q) (curried_exFalso P S wnp))

--      ⊢ (¬P → P) → P
example : (¬P → P) → P :=
  Or.elim (lem P)
    (λ wp : P =>
      λ f : ¬P → P =>
        wp)
    (λ wnp : ¬P =>
      λ f : ¬P → P =>
        f wnp)

--     ⊣⊢ ¬(P → Q) ↔ P ∧ ¬Q
example : ¬(P → Q) ↔ P ∧ ¬Q :=
  Iff.intro
    (λ f : ¬(P → Q) =>
      Or.elim (lem P)
        (λ wp : P =>
          And.intro wp
                    (λ wq : Q =>
                      f (λ x : P => wq)))
        (λ wnp : ¬P =>
           have t : (P → Q) := curried_exFalso P Q wnp
           False.elim (f t)))
    (λ t : P ∧ ¬Q =>
      λ f : P → Q =>
        t.right (f t.left))

--             ⊢ ((P → Q) → P) → P
theorem peirce : ((P → Q) → P) → P :=
  λ f : (P → Q) → P =>
    Or.elim (lem P)
      (λ wp : P =>
        wp)
      (λ wnp : ¬P =>
        f (λ wp : P =>
          False.elim (wnp wp)))
