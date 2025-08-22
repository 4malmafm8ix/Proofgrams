inductive ℕ where
  | zero : ℕ
  | succ : ℕ → ℕ
  deriving Repr

open ℕ

def add (m n : ℕ) : ℕ :=
  match n with
  | zero   => m
  | succ k => succ (add m k)

instance : Add ℕ where
  add := add

def mul (m n : ℕ) : ℕ :=
  match n with
  | zero    => zero
  | succ k  => (mul m k) + m

instance : Mul ℕ where
  mul := mul

-- Axioms of Peano Arithmetic
theorem PA3 (m : ℕ) : m + zero = m := by rfl
theorem PA4 (m n : ℕ) : m + (succ n) = succ (m + n) := by rfl
theorem PA5 (m : ℕ) : m * zero = zero := by rfl
theorem PA6 (m n : ℕ) : m * (succ n) = (m * n) + m := by rfl

-- For each of the theorems below, replace "sorry" with a tactic proof.

-- Question 1
theorem zero_add : ∀ x : ℕ, zero + x = x :=
  by
    sorry

-- Question 2
theorem zero_mul : ∀ x : ℕ, zero * x = zero :=
  by
    sorry

-- Question 3
theorem mul_one : ∀ x : ℕ, x * (succ zero) = x :=
  by
    sorry

-- Question 4
theorem succ_add : ∀ x y : ℕ, (succ x) + y = succ (x + y) :=
  by
    sorry

-- Question 5
theorem succ_mul : ∀ x y : ℕ, (succ x) * y = x * y + y :=
  by
    sorry

-- Question 6
theorem add_assoc : ∀ x y z : ℕ, (x + y) + z = x + (y + z) :=
  by
    sorry

-- Question 7
theorem add_comm : ∀ x y z : ℕ, x + y = y + x :=
  by
    sorry

-- Question 8
theorem mul_add : ∀ x y z : ℕ, x * (y + z) = x * y + x * z :=
  by
    sorry

-- Question 9
theorem mul_comm : ∀ x y : ℕ, x * y = y * x :=
  by
    sorry

-- Question 10
theorem mul_assoc : ∀ x y z : ℕ, (x * y) * z = x * (y * z) :=
  by
    sorry

-- We now add ≤ predicate to our formal description of ℕ
def leq (m n : ℕ) := (∃ x : ℕ, n = m + x)
-- Since it's defined using the ∃ quantifier, you will need
-- to use the corresponding ∃ terms/tactics in Lean.

instance : LE ℕ where
  le := leq

-- Question 11
theorem leq_refl : ∀ x : ℕ, x ≤ x :=
  by
    sorry

-- Question 12
theorem zero_leq : ∀ x : ℕ, zero ≤ x :=
  by
    sorry

-- Question 13
theorem leq_succ : ∀ x : ℕ, x ≤ succ x :=
  by
    sorry

-- Question 14
theorem leq_trans : ∀ x y z : ℕ, (x ≤ y) ∧ (y ≤ z) → x ≤ z :=
  by
    sorry

-- Question 15
theorem leq_antisymm : ∀ x y : ℕ, (x ≤ y) ∧ (y ≤ x) → x = y :=
  by
    sorry
