namespace Formal.List

inductive List (α : Type) where
  | null : List α
  | cons : (a : α) →  (as : List α) → List α
  deriving Repr

open List

-- This function appends one list onto another.
def append {α : Type} (as bs : List α) : List α :=
  match as with
  | null      => bs
  | cons a as => cons a (append as bs)

-- This type class allows for the infix ++
instance {α : Type} : Append (List α) where
  append := append

-- The following two theorems are mere computations
-- from the definition of append.
def null_append {α : Type} :
  ∀ xs : List α, ((null : List α) ++ xs) = xs :=
    by
      intro as
      rfl

def cons_append {α : Type} :
  ∀ x : α, ∀ xs ys : List α, ((cons x xs) ++ ys) = (cons x (xs ++ ys)) :=
    by
      intro a as bs
      rfl

-- Question 1
theorem append_null {α : Type} :
  ∀ xs : List α, (xs ++ null) = xs :=
    by
      intro as
      induction as with
      | null         => rfl
      | cons a as ih => rw [cons_append,ih]

-- We cons an element to the head of a list.
-- We snoc an element to the end of a list.
def snoc {α : Type} : List α → α → List α
  | null, a      => cons a null
  | cons x xs, a => cons x (snoc xs a)

-- Question 2
theorem snoc_append {α : Type} :
  ∀ a : α, ∀ (as bs : List α),
    ((snoc as a) ++ bs) = (as ++ (cons a bs)) :=
  by
    intro a as bs
    induction as with
    | null         => --rw [snoc,null_append,cons_append,null_append]
                      --simp [snoc,null_append,cons_append]
                      rfl
    | cons x xs ih => simp [snoc,cons_append,ih]

def reverse {α : Type} : List α -> List α
| null      => null
| cons x xs => snoc (reverse xs) x

-- Question 3
theorem reverse_snoc {α : Type} :
  ∀ a : α, ∀ as : List α,
    reverse (snoc as a) = cons a (reverse as) :=
    by
      intro a as
      induction as with
      | null         => --rw [snoc,reverse,reverse,reverse,snoc]
                        --simp [snoc,reverse]
                        rfl
      | cons k ks ih => --rw [snoc,reverse,ih,snoc,reverse]
                        simp [snoc,reverse,ih]

-- Question 4
theorem snoc_reverse {α : Type} :
  ∀ a : α, ∀ as : List α,
    snoc (reverse as) a = reverse (cons a as) :=
    by
      intro a as
      rfl

-- Question 5
theorem rev_rev {α : Type} :
  ∀ xs : List α,
  reverse (reverse xs) = xs :=
    by
      intro as
      induction as with
      | null         => rw [reverse,reverse]
      | cons x xs ih => rw [reverse,snoc_reverse,reverse,reverse_snoc,ih]


-- Don't write any code after this end Formal.list line.
-- Or else Lean won't know what you're talking about!
end Formal.List
