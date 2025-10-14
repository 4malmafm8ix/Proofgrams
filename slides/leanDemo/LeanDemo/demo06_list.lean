namespace Formal.List

-- Lists are either (i) empty, or
-- (ii) a list with an extra element at the start.
inductive List (α : Type) where
  | null : List α
  | cons : (a : α) →  (as : List α) → List α
open List

-- This function appends one list onto another.
def append {α : Type} (as bs : List α) : List α :=
  match as with
  | null      => bs
  | cons a as => cons a (append as bs)

notation xs " ++ " ys => append xs ys

-- The following two theorems are mere computations
-- from the definition of append.
def null_append {α : Type} :
  ∀ xs : List α,
    (null ++ xs) = xs :=
      by intro as;rfl

def cons_append {α : Type} :
  ∀ x : α, ∀ xs ys : List α,
    ((cons x xs) ++ ys) = (cons x (xs ++ ys)) :=
      by intro a as bs;rfl

-- Since append is defined by pattern matching on the
-- first list; we need to do induction to prove results
-- about appending lists on the right.

-- This is analogous to how for natural numbers
-- right addition is definitional, while left
-- addition required proof.
theorem append_null {α : Type} :
  ∀ xs : List α, (xs ++ null) = xs :=
    by
      intro as
      induction as with
      | null         => rw [null_append]
      | cons k ks ih => rw [cons_append,ih]

-- If we are appending three lists together, then it
-- shouldn't matter how we bracket the lists.
theorem append_assoc {α : Type} :
  ∀ xs ys zs : List α,
    ((xs ++ ys) ++ zs) = xs ++ (ys ++ zs) :=
      by
        intro as bs cs
        induction as with
        | null         => rfl
        | cons k ks ih => rw [cons_append,cons_append,
                              ih,cons_append]

def length {α : Type} : List α → Nat
  | null      => 0
  | cons _ as => 1 + length as

theorem length_null {α : Type} :
  length (null : List α) = 0 := by rfl

theorem length_cons {α : Type} : ∀ a : α, ∀ xs : List α,
  length (cons a xs) = 1 + length xs :=
    by intro a as; rfl

#check Nat.zero_add
#check Nat.add_assoc

theorem length_append {α : Type} :
  ∀ xs ys : List α, length (xs ++ ys) = length xs + length ys :=
    by
      intro as bs
      induction as with
      | null         => rw [null_append,length_null,Nat.zero_add]
      | cons k ks ih => rw [cons_append,length_cons,
                            length_cons,ih,
                            Nat.add_assoc]

-- We cons an element to the head of a list.
-- We snoc an element to the end of a list.
def snoc {α : Type} : List α → α → List α
  | null, a      => cons a null
  | cons x xs, a => cons x (snoc xs a)

theorem snoc_append {α : Type} :
  ∀ a : α, ∀ (as bs : List α),
    ((snoc as a) ++ bs) = (as ++ (cons a bs)) :=
      sorry

theorem length_snoc {α : Type} :
  ∀ a : α, ∀ as : List α,
    length (snoc as a) = 1 + length as :=
      sorry

def reverse {α : Type} : List α -> List α
| null      => null
| cons x xs => snoc (reverse xs) x

def length_reverse_eq {α : Type} :
  ∀ as : List α,
    length (reverse as) = length as :=
      by
        intro as
        induction as with
        | null         => rw [reverse]
        | cons k ks ih => rw [reverse,length_snoc,ih,
                              length]

-- The following two theorems help prove the final theorem
-- that reverse is its own inverse i.e. rev ∘ rev = id
theorem reverse_snoc {α : Type} :
  ∀ a : α, ∀ as : List α,
    reverse (snoc as a) = cons a (reverse as) :=
      sorry

theorem snoc_reverse {α : Type} :
  ∀ a : α, ∀ as : List α,
    snoc (reverse as) a = reverse (cons a as) :=
    sorry

theorem rev_rev {α : Type} :
  ∀ xs : List α,
  reverse (reverse xs) = xs :=
    sorry

-- Don't write any code after this end Formal.list line.
-- Or else Lean won't know what you're talking about!
end Formal.List
