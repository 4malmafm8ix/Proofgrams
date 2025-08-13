-- Tutorial 03 :: Intuitionistic First Order Predicate Logic
variable (P : Prop)
variable (α : Type)
variable (F G H : α → Prop)

theorem forall_exists : (∀ x : α, F x) → ∃ x : α, F x :=
  by
    intro f
    -- Can't use f though...
    -- Some difference between type theory and logic expositions...
    sorry

--                             ∀ x      ¬F(x) → ¬ ∃ x      F(x)
theorem forallNot_notExists : (∀ x : α, ¬F x) → ¬ ∃ x : α, F x :=
  by
    intro f
    intro t
    apply Exists.elim t
    intro a
    apply f

--                          ⊢  ¬ ∃ x     F(x)  →  ∀ x      ¬F(x)
theorem notExists_forallNot : (¬ ∃ x : α, F x) → (∀ x : α, ¬F x) :=
  by
    intro f
    intro a
    intro p
    have w : ∃ x, F x
      := Exists.intro a p
    exact f w

--                         ⊢  ¬ ∃ x      F(x) ↔  ∀ x      ¬F(x)
theorem deMorgan_notExists : (¬ ∃ x : α, F x) ↔ (∀ x : α, ¬F x) :=
  by
    apply Iff.intro
      (notExists_forallNot α F)
      (forallNot_notExists α F)

--                                ⊢ (∀ x, F x → G x) → (∀ x, F x) → (∀ x, G x)
theorem forall_distribute_implies : (∀ x, F x → G x) → (∀ x, F x) → (∀ x, G x) :=
  by
    intro f1
    intro f2
    intro a
    exact (f1 a) (f2 a)

--           ∀ x      (F x ∨ G x) → H x,      ∀ x      ¬(H x) ⊢  ∀ x      ¬ F x
example (f : ∀ x : α, (F x ∨ G x) → H x) (g : ∀ x : α, ¬(H x)) : ∀ x : α, ¬ F x :=
  by
    intro a
    intro h
    have t : F a ∨ G a :=
      Or.intro_left (G a) h
    exact (g a) ((f a) (t))

--
theorem forall_distribute_conj (f : ∀ x : α, F x ∧ G x) : (∀ x : α, F x) ∧ (∀ x : α, G x) :=
  by
    apply And.intro
    intro a
    exact (f a).left
    intro a
    exact (f a).right

--
theorem forall_factor_conj (p : (∀ x : α, F x) ∧ (∀ x : α, G x)) : ∀ x : α, F x ∧ G x :=
  by
    intro a
    have wfa : F a :=
      (p.left) a
    have wga : G a :=
      (p.right) a
    exact And.intro wfa wga

--
theorem forall_conj : (∀ x : α, F x) ∧ (∀ x : α, G x) ↔ ∀ x : α, F x ∧ G x :=
  by
    apply Iff.intro
    exact forall_factor_conj α F G
    exact forall_distribute_conj α F G

--
example : (∀ x : α, P → F x) ↔ P → ∀ x : α, F x :=
  by
    apply Iff.intro
    intro f
    intro p
    intro a
    exact (f a) p
    intro g
    intro a
    intro p
    exact (g p) a

--
example (t : ∃ x : α, (P → F x)) : P → ∃ x : α, F x :=
  by
    intro wp
    apply Exists.elim t
    intro a
    intro f
    exact Exists.intro a (f wp)

--
example (t : ∃ x : α, ¬F x) : ¬∀ x : α, F x :=
  by
    intro f
    apply Exists.elim t
    intro a
    intro w
    exact w (f a)

--
example : (∀ x : α, ¬F x) ↔ (¬∃ x : α, F x) :=
  by
    apply Iff.intro
    intro f
    intro t
    apply Exists.elim t
    intro a
    intro w
    exact (f a) w
    intro g
    intro a
    intro w
    exact g (Exists.intro a w)

--
example : (∀ x : α, F x → P) ↔ (∃ x : α, F x) → P :=
  by
    apply Iff.intro
    intro f
    intro t
    apply Exists.elim t
    intro a
    intro fa
    exact (f a) fa
    intro t
    intro a
    intro fa
    exact t (Exists.intro a fa)

--
example (t : ∃ x : α, (F x → G x)) : (∀ x : α, F x) → (∃ x : α, G x) :=
  by
    intro f
    apply Exists.elim t
    intro a
    intro i
    exact Exists.intro a (i (f a))

--
theorem exists_to_notforallnot (t : ∃ x : α, F x) : (¬∀ x : α, ¬ F x) :=
  by
    intro f
    apply Exists.elim t
    intro a
    intro w
    exact (f a) w

--
theorem forall_to_notexistsnot (f : ∀ x : α, F x) : (¬ ∃ x : α, ¬ F x) :=
  by
    intro t
    apply Exists.elim t
    intro a
    intro g
    exact g ( f a)
