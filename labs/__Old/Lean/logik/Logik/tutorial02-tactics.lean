-- Tutorial 02 :: Intuitionistic and Classical logic exercises explicit proof terms.
variable (P Q R S T : Prop)

-- Intuitionistic proofs
--    Intuitionistic logic is minimal logic with Ex Falso added.
--    In L∃∀N this is refered to as False.elim

--                     P         ¬P  ⊢ Q
theorem ex_falso (wp : P) (wnp : ¬P) : Q :=
  by
    apply False.elim
    exact (wnp wp)

--                                               ¬P ∨ Q  ⊢  P → Q
theorem intuitionistic_material_implication (t : ¬P ∨ Q) : P → Q :=
  by
    intro wp
    apply Or.elim t
    intro wnp
    apply False.elim
    exact wnp wp
    intro wq
    exact wq
--                                 P ∨ Q       ¬P  ⊢ Q
theorem disjunctive_syllogism (t : P ∨ Q) (n : ¬P) : Q :=
  by
    apply Or.elim t
    intro wp
    apply False.elim
    exact n wp
    intro wq
    exact wq

--      ⊢ ¬(Q → P) → (P → Q)
example : ¬(Q → P) → (P → Q) :=
  by
    intro t1 t2
    have f : Q → P := λ wq : Q => t2
    apply False.elim
    exact t1 f

--
theorem curried_exFalso : ¬P → (P → Q) :=
  by
    intro t1 t2
    apply False.elim
    exact t1 t2

open Classical -- Beware, Pandora, of opening this box...
#check em P    -- In the Classical namespace we get a proof of LEM.
#print em      -- The proof uses AoC and Diaconescu's theorem.
               -- AoC is an axiom in L∃∀N.
               -- Don't worry about; just use it :)

--          ⊢ P ∨ ¬P
theorem lem : P ∨ ¬P :=
  em P

--          ⊢ ¬¬P → P
theorem dne : ¬¬P → P :=
  by
    intro wnnp
    apply Or.elim (em P)
    intro wp
    exact wp
    intro wnp
    apply False.elim
    exact wnnp wnp

--                                   ¬(P ∧ Q)) ⊢ ¬P ∨ ¬Q
theorem deMogran_notConj_expand (f : ¬(P ∧ Q)) : ¬P ∨ ¬Q :=
  by
    apply Or.elim (em P)
    intro wp
    have wnq : ¬Q :=
      (λ wq : Q => f (And.intro wp wq))
    suffices wnq : ¬Q from (Or.intro_right (¬P) wnq)
    exact wnq
    intro wnp
    exact Or.intro_left (¬Q) wnp

-- Combining the previous theorem with converse from tutorial one...
--                                   ¬P ∨ ¬Q  ⊢ ¬(P ∧ Q)
theorem deMogran_notConj_factor (t : ¬P ∨ ¬Q) : ¬(P ∧ Q) :=
  by
    intro h
    apply Or.elim t
    intro np
    exact np h.left
    intro nq
    exact nq h.right

-- ... we obtain the proof of De Morgan's law for expanding not-And
--                         ¬(P ∧ Q) ⊣⊢ ¬P ∨ ¬Q
theorem deMorgan_notConj : ¬(P ∧ Q)  ↔ ¬P ∨ ¬Q :=
  by
    apply Iff.intro
    intro f
    exact deMogran_notConj_expand P Q f
    intro g
    exact deMogran_notConj_factor P Q g

--                                          P → Q  ⊢ ¬P ∨ Q
theorem material_implication_classical (f : P → Q) : ¬P ∨ Q :=
  by
    apply Or.elim (em P)
    intro wp
    have t1 : Q := f wp
    exact Or.intro_right (¬P) t1
    intro wnp
    exact Or.intro_left (Q) wnp

-- You were warned!
--              ⊢ (P → Q) ∨ (Q → P)
theorem pandora : (P → Q) ∨ (Q → P) :=
  by
    apply Or.elim (lem P)
    intro wp
    apply Or.intro_right (P → Q)
    exact (λ wq : Q => wp)
    intro wnp
    apply Or.intro_left (Q → P)
    intro wp
    apply False.elim
    exact wnp wp

-- Another strange theorem from the Box.
--                     (P → Q) ∧ (R → S)  ⊢ (P → S) ∨ (R → Q)
theorem pandawrah (t : (P → Q) ∧ (R → S)) : (P → S) ∨ (R → Q) :=
  by
    apply Or.elim (lem P)
    intro wp
    apply Or.intro_right (P → S)
    have f1 : R → Q :=
      λ wr : R => (t.left wp)
    exact f1
    intro wnp
    apply Or.intro_left (R → Q)
    intro wp
    apply False.elim
    exact wnp wp

--      ⊢ (¬P → P) → P
example : (¬P → P) → P :=
  by
    intro f
    apply Or.elim (lem P)
    intro wp
    exact wp
    intro wnp
    exact f wnp

--      ⊢ ¬(P → Q) ↔ P ∧ ¬Q
example : ¬(P → Q) ↔ P ∧ ¬Q :=
  by
    apply Iff.intro
    intro f1
    apply Or.elim (em P)
    have wnq : ¬Q :=
      λ wq : Q =>
        f1 (λ x : P => wq)
    intro wp
    apply And.intro
    exact wp
    exact wnq
    intro wnp
    have f2 : P → Q :=
      curried_exFalso P Q wnp
    apply False.elim
    exact f1 f2
    intro f3 f4
    exact f3.right (f4 f3.left)

--             ⊢ ((P → Q) → P) → P
theorem peirce : ((P → Q) → P) → P :=
  by
    intro f1
    apply Or.elim (em P)
    intro wp
    exact wp
    intro wnp
    have f2 : P → Q :=
      curried_exFalso P Q wnp
    apply False.elim
    exact wnp (f1 f2)
