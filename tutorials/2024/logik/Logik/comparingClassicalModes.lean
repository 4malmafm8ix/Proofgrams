-- Proofs comparing LEM, DNE, and Peirce's Law
variable (P Q R S T : Prop)

--                              P ∨ ¬P  ⊢ ((P → Q) → P) → P
theorem lem_implies_peirce (t : P ∨ ¬P) : ((P → Q) → P) → P :=
  by
    intro f1
    apply Or.elim t
    intro wp
    exact wp
    intro wnp
    have f2 : P → Q :=
      λ x : P => False.elim (wnp x) -- Ex Falso
    apply False.elim                -- ∴ Intuitionistically equivalent.
    exact wnp (f1 f2)

--                           P ∨ ¬P  ⊢ ¬¬P → P
theorem lem_implies_dne (t : P ∨ ¬P) : ¬¬P → P :=
  by
    intro wnnp
    apply Or.elim t
    intro wp
    exact wp
    intro wnp
    apply False.elim    -- Ex Falso
    exact wnnp wnp      -- ∴ Intuitionistically equivalent.

--                      ⊢ ¬¬(P ∨ ¬P)
theorem cant_refute_lem : ¬¬(P ∨ ¬P) :=
  by
    intro f
    have wnp : ¬P :=
      λ wp : P =>
        f (Or.intro_left (¬P) wp)
    have bs : False :=
      f (Or.intro_right P wnp)
    exact bs

theorem cantt_refute_lem : ¬¬(P ∨ ¬P) :=
  λ g : ¬(P ∨ ¬P) =>
    g (Or.intro_right (P)
                      (λ x : P =>
                        g (Or.intro_left (¬P) x)))

--                            ¬¬(P ∨ ¬P)) → (P ∨ ¬P)  ⊢ P ∨ ¬P
theorem dne_implies_lem (f : (¬¬(P ∨ ¬P)) → (P ∨ ¬P)) : P ∨ ¬P :=
  by
    exact f (cant_refute_lem P)

-- Peirce's Law is: ∀ P Q : Prop, ((P → Q) → P) → P
-- The following theorem uses the instance Q = False
--                              (¬P → P) → P) : ¬¬P → P
theorem peirce_implies_dne (f : (¬P → P) → P) : ¬¬P → P :=
  by
    intro g
    have h : ¬P → P :=
      λ wnp : ¬P =>
        False.elim (g wnp)
    exact f h
