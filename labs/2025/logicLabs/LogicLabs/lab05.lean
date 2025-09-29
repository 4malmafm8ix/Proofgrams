-- In first order logic Peano arithmetic is defined by a signature
-- (zero,succ,+,×,=)
-- One then enforces structure with 7 axioms.
-- Type theory does things different; closer to how we actually
-- practice mathematics informally.

-- We define the type of all natural numbers.
inductive ℕ where
  | zero : ℕ
  | succ : ℕ → ℕ
  deriving Repr

open ℕ

-- Sum (+) is a function on the type ℕ.
-- That tells one how to compute a sum.
def add (m n : ℕ) : ℕ :=
  match n with
  | zero   => m
  | succ k => succ (add m k)

instance : Add ℕ where
  add := add

-- Multiplication (*) is a function on the type ℕ.
-- That tells one how to compute multiplication.
def mul (m n : ℕ) : ℕ :=
  match n with
  | zero    => zero
  | succ k  => (mul m k) + m

instance : Mul ℕ where
  mul := mul

------------------------------
-- Axioms of Peano Arithmetic.
------------------------------

-- The first two structural axioms are encoded in the
-- *inductive* type constructor.
-- If terms are made using different constructors, then
-- they are by definition different.
theorem PA1 (m : ℕ) : succ m ≠ zero := by
    intro h
    injection h
-- *inductive* constructors are injective by definition.
theorem PA2 (m n : ℕ) : (succ m) = (succ n) → m = n := by
  intro h
  injection h
-- The arithmetic axioms are simple computations
-- based on the definitions of + and * above.
theorem PA3 (m : ℕ) : m + zero = m := by rfl
theorem PA4 (m n : ℕ) : m + (succ n) = succ (m + n) := by rfl
theorem PA5 (m : ℕ) : m * zero = zero := by rfl
theorem PA6 (m n : ℕ) : m * (succ n) = (m * n) + m := by rfl

-- Induction is defined as a recursive function out of
-- an inductive data type. However, Lean4 has it wrapped
-- in a tactic which is much more familiar.

-- The following comment is to show the pattern
-- of the induction tactic in Lean4.

-- def induction_theorem : ∀ x : ℕ, P x :=
  -- by
    -- intro n

    -- Proof of "∀ x : ℕ, P(x)" is a function from ℕ to P(x)
    -- for each natural number x. One way to write such a
    -- function is my induction.

    -- induction n with
    -- -- PA, ⊢ P(0)
    -- | zero      => ... base case ...
    -- -- PA, (ih : P(k)) ⊢ P(succ k)
    -- | succ k ih => ... induction step ...


theorem Q1 : ∀ x : ℕ, zero + x = x :=
  sorry

theorem Q2 : ∀ x : ℕ, zero * x = zero :=
  sorry

theorem Q3 : ∀ x : ℕ, (succ zero) * x = x :=
  sorry

theorem Q4 : ∀ x : ℕ, (x = zero) ∨ (∃ t : ℕ, x = succ t) :=
  sorry

theorem Q5 : ∀ x : ℕ, (x = zero) ∨ (x ≠ zero) :=
  sorry

theorem Q6 : ∀ x y : ℕ, (succ y) + x = succ (y + x) :=
  sorry

theorem Q7 : ∀ x y z : ℕ, (y + z) + x = y + (z + x) :=
  sorry

theorem Q8 : ∀ x y : ℕ, x + y = y + x :=
  sorry

theorem mul_comm : ∀ x y : ℕ, x * y = y * x :=
  sorry

theorem mul_assoc : ∀ x y z : ℕ, (y * z) * x = y * (z * x) :=
  sorry

-- We now add ≤ predicate to our formal description of ℕ
def leq (m n : ℕ) := (∃ x : ℕ, n = m + x)
-- Since it's defined using the ∃ quantifier, you will need
-- to use the corresponding ∃ terms/tactics in Lean.

instance : LE ℕ where
  le := leq

theorem Q9 : ∀ x : ℕ, zero ≤ x :=
  sorry

theorem Q10 : ∀ x : ℕ, zero ≤ x → zero ≤ succ x:=
  sorry

theorem Q11 : ∀ x : ℕ, x ≤ succ x :=
  sorry

theorem Q12 : ∀ x y : ℕ, succ x ≤ succ y → x ≤ y :=
  sorry

theorem Q13 : ∀ x y z : ℕ, (x ≤ y) ∧ (y ≤ z) → x ≤ z :=
  sorry

theorem Q14 : ∀ x y : ℕ, (x ≤ y) ∧ (y ≤ x) → x = y :=
  sorry

theorem Q15 : ∀ x y : ℕ, ¬(x ≤ y) → y ≤ x :=
  sorry

-- Now we add a divisibilty relation.
def divides (m n : ℕ) := (m ≠ zero) ∧ (∃ x : ℕ, n = m * x)
-- This is also an ∃ statement.

-- Don't use the | from the keyboard as this is a
-- special character in Lean used e.g. in pattern matching.

-- This is typed "\ mid" without the space.
infix:50 " ∣ " => divides

-- Things are getting complicated enough now that it is
-- best to write an informal pencil-and-paper proof and
-- figure out which intermediate lemma will be helpful.

theorem divisibility_reflexive :
  ∀ x : ℕ, x ≠ zero → x ∣ x :=
    sorry

theorem divisibility_transitive :
  ∀ x y z : ℕ, x ∣ y → y ∣ z → x ∣ z :=
    sorry

theorem divisibility_asymm :
  ∀ x y : ℕ, x ∣ y → y ∣ x → x = y :=
    sorry
