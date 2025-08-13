-- Tutorial 04 :: Classical First Order Predicate Logic
variable (P : Prop)
variable (α : Type)
variable (F G : α → Prop)


-- Some helpers from tutorial03

theorem notExists_to_forallNot (f :¬∃ x : α, F x) : ∀ x : α, ¬F x :=
  by
    intro a
    intro fa
    exact f (Exists.intro a fa)

-- These proofs use some classical mode of reasoning.
-- Notice that they are all proving an existence statement.
open Classical

--
example (f : P → ∃ x : α, F x) : ∃ x : α, (P → F x) :=
  byContradiction
    (by
      intro w
      sorry)

--
example (f : ¬∀ x : α, F x) : ∃ x : α, ¬F x :=
  byContradiction
    (by
      intro w
      have g : ∀ x : α, F x :=
        (by
          intro a
          have h : F a :=
            byContradiction
              (by
                intro w1
                have w2 : ∃ x : α, ¬F x :=
                  Exists.intro a w1
                exact w w2)
          exact h)
      exact f g)




--
example (f : ∀ x : α, F x ∨ G x) : (∀ x : α, F x) ∨ (∃ x : α, G x) :=
  by
    sorry

--
example (f : (∀ x : α, F x) → (∃ x : α, G x)) : ∃ x : α, (F x → G x) :=
  by
    sorry

--
theorem notforallnot_to_exists (f : ¬∀ x : α, ¬ F x) : (∃ x : α, F x) :=
  by
    sorry

--
theorem notexistsnot_to_forall (f : ¬ ∃ x : α, ¬ F x) : (∀ x : α, F x) :=
  by
    sorry
