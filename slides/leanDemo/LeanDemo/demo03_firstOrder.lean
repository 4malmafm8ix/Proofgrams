-- Curry Howard for First Order Predicate Logic.
-- We did not describe the type theory interpretation
-- of higher order logics. However, we can use the
-- BHK to understand how to prove FoL statements in lean.

-- Predicates
-- Recall we defined predicates on the natural numbers to be
-- functions which take in terms and return propositions.
-- For example:
-- even : Nat -> Prop
-- For each n : Nat, we get a prop (even n) : Prop.

-- For the purposes of these lectures let's suppose we
-- have some type α and predicates F G H on that type.
variable (α : Type)         -- Type to quantify over.
variable (a b c t u v : α)  -- Term variables of type α.
variable (F G H : α → Prop) -- Predicates on that type.

-- ∀x Fx → Gx, Fa ⊢ Ga
-- How do we make use of ∀ x (Fx → Gx)? This is a function!
-- Recall the BHK definition of ∀:
--        a proof of ∀x:α, Px is an algorithm that, applied to
--        any object t : α returns a proof of Pt
-- In other words we use ∀x :α, Fx as a function on α
-- to return proofs that terms in α satisfy F.
theorem ex1 (f : ∀ x : α, F x → G x) (t : F a) : G a := sorry

-- ∀x (Fx → Gx), ∀x Fx ⊢ ∀x Gx
-- We can use the function interpretation to construct
-- a proof of ∀x Gx as well. Now we are writing a function.
-- This means we need to show an arbitrary element of a:α
-- must satisfy the predicate G.
theorem ex2 (f : ∀ x : α, F x → G x) (g : ∀ x: α, G x) :
  ∀ x : α, G x := sorry

-- ∀x(Fx → Gx), ∀x(Gx → Hx) ⊢ ∀x(Fx → Hx)
theorem ex3 (f: ∀ x : α, F x → G x) (g : ∀ x : α, G x → H x) :
  ∀ x : α, F x → H x := sorry

-- ∀x (F x → G x), ¬G t ⊢ ∃x ¬F x
-- How are we to prove a statement ∃x : α, F x?
-- The BHK defines it as follows:
--        a proof of ∃x:α, F x consists of a term
--        t : α and a proof p : F t showing t satisfies
--        the predicate F.
-- Exists.intro thus takes two inputs:
--    The first is a term of type α
--    The second is a proof that term satisfies the predicate.
theorem ex4 (f: ∀x : α, F x → G x) (w : ¬G t) :
  ∃x : α, ¬F x := sorry

-- ∀x(F x → G x), ∃ x F x ⊢ ∃ x : G x
-- If we want to use a hypotheses with an ∃ claim; then
-- we need to pull out the term and the proof is satisfies
-- the predicate. This can happen in two ways:
-- (1) We can use "apply Exists.elim t" where t : ∃x :α, F x
-- (2) We can use "rcases t with ⟨t₁,p₁⟩" where t₁ and p₁ are
-- names of the term and proof respectively.
theorem ex5 (f : ∀x : α, F x → G x) (t : ∃ x, F x) :
  ∃ x, G x := sorry

theorem ex6 (t : (∃x : α, F x) ∨ (∃ x : α, G x)) :
  ∃ x : α, (F x ∨ G x) := sorry

theorem ex7 (t : ¬∃x :α, F x) :
  ∀x:α, ¬(F x) := sorry
