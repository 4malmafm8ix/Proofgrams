namespace Formal.List
variable (α : Type)

inductive List α where
  | null : List α
  | cons : (a : α) →  (as : List α) → List α

open List

-- This function counts the cons' to compute length.
def length (as : List α) : Nat :=
  match as with
  | null => 0
  | cons _ as => 1 + (length as)

def append (as bs : List α) : List α :=
  match as with
  | null      => bs
  | cons a as => cons a (append as bs)





-- Don't write any code after this end Formal.list line.
-- Or else Lean won't know what you're talking about!
end Formal.List
