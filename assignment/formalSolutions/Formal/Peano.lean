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
theorem PA1 (m : ℕ) : ¬(succ m = zero) := by intro f;injection f
theorem PA2 (m n : ℕ) : succ m = succ n → m = n := by intro h;injection h
theorem PA3 (m : ℕ) : m + zero = m := by rfl
theorem PA4 (m n : ℕ) : m + (succ n) = succ (m + n) := by rfl
theorem PA5 (m : ℕ) : m * zero = zero := by rfl
theorem PA6 (m n : ℕ) : m * (succ n) = (m * n) + m := by rfl

-- For each of the theorems below, replace "sorry" with a tactic proof.

-- Question 1
theorem zero_add : ∀ x : ℕ, zero + x = x :=
  by
    intro a
    induction a with
    | zero      => rfl
    | succ n ih => rw [PA4, ih]

-- Question 2
theorem zero_mul : ∀ x : ℕ, zero * x = zero :=
  by
    intro a
    induction a with
    | zero      => rfl
    | succ n ih => rw [PA6,PA3,ih]

-- Question 3
theorem mul_one : ∀ x : ℕ, x * (succ zero) = x :=
  by
    intro a
    induction a with
    | zero      => rfl
    | succ n ih => rw [PA6,PA4,PA5,zero_add]

-- Question 4
theorem succ_add : ∀ x y : ℕ, (succ x) + y = succ (x + y) :=
  by
    intro a b
    induction b with
    | zero      => repeat rw [PA3]
    | succ n ih => rw [PA4,ih,PA4]

-- Question 5
theorem add_assoc : ∀ x y z : ℕ, (x + y) + z = x + (y + z) :=
  by
    intro a b c
    induction a with
    | zero      => rw [zero_add,zero_add]
    | succ n ih => rw [succ_add,succ_add,succ_add,ih]

-- Question 6
theorem add_comm : ∀ x y : ℕ, x + y = y + x :=
  by
    intro a b
    induction a with
    | zero      => rw [zero_add, PA3]
    | succ n ih => rw [succ_add,PA4,ih]

-- Question 7
theorem succ_mul : ∀ x y : ℕ, (succ x) * y = x * y + y :=
  by
    intro a b
    induction b with
    | zero      => rfl
    | succ n ih => rw [PA4,PA6 a n,PA6,ih,PA4]
                   rw [add_assoc,add_comm n a,<-add_assoc]

-- Question 8
theorem mul_comm : ∀ x y : ℕ, x * y = y * x :=
  by
    intro a b
    induction a with
    | zero      => rw [zero_mul,PA5]
    | succ n ih => rw [succ_mul,PA6,ih]

-- Question 9
theorem add_mul : ∀ x y z : ℕ, (y + z) * x = y * x + z * x :=
  by
    intro a b c
    induction a with
    | zero      => rfl
    | succ n ih => rw [PA6,ih,PA6,PA6,
                      add_assoc, add_comm (c*n),
                      add_assoc, add_comm c,
                      <-add_assoc,<-add_assoc]

-- Question 10
theorem mul_assoc : ∀ x y z : ℕ, (x * y) * z = x * (y * z) :=
  by
    intro a b c
    induction a with
    | zero      => rw [zero_mul,zero_mul,zero_mul]
    | succ n ih => rw [succ_mul,succ_mul,add_mul,ih]

-- We now add ≤ predicate to our formal description of ℕ
def leq (m n : ℕ) := (∃ x : ℕ, n = m + x)
-- Since it's defined using the ∃ quantifier, you will need
-- to use the corresponding ∃ terms/tactics in Lean.
--
-- apply Exists.intro a
-- ... This reduces the goal to a proof that a has the required
-- property.

-- To use an hypothesis of the form  t : a ≤ b
-- One can write "apply Exists.elim t"
-- Then introduce the term and proof with intro.

instance : LE ℕ where
  le := leq

-- Question 11
theorem leq_refl : ∀ x : ℕ, x ≤ x :=
  by
    intro a
    apply Exists.intro zero
    rw [PA3]

-- Question 12
theorem zero_leq : ∀ x : ℕ, zero ≤ x :=
  by
    intro a
    apply Exists.intro a
    rw [zero_add]

-- Question 13
theorem leq_succ : ∀ x : ℕ, x ≤ succ x :=
  by
    intro a
    apply Exists.intro zero.succ
    rw [PA4,PA3]

-- Question 14
theorem leq_trans : ∀ x y z : ℕ, (x ≤ y) ∧ (y ≤ z) → x ≤ z :=
  by
    intro a b c
    intro t
    apply Exists.elim t.left
    intro u hu
    apply Exists.elim t.right
    intro v hv
    apply Exists.intro (u + v)
    rw [<-add_assoc,<-hu,hv]

-- You may require the following two theorems to write
-- a proof of Question 15. These theorems: add_eq_self
-- and add_eq_zero have already been proved.
-- You may use them, or not, as is.

theorem add_eq_self : ∀ x y : ℕ, x + y = x → y = zero :=
  by
    intro a b
    intro h₁
    induction a with
    | zero      => rw [zero_add] at h₁
                   exact h₁
    | succ n ih => rw [succ_add] at h₁
                   have h₂ := PA2 (n+b) n h₁
                   exact ih h₂

theorem add_eq_zero : ∀ x y : ℕ, x + y = zero -> x = zero :=
  by
    intro a b
    intro h₁
    induction a with
    | zero      => rfl
    | succ n ih => rw [succ_add] at h₁
                   injection h₁

-- Question 15
theorem leq_antisymm : ∀ x y : ℕ, (x ≤ y) ∧ (y ≤ x) → x = y :=
  by
    intro a b
    intro t
    apply Exists.elim t.left
    intro u wu
    apply Exists.elim t.right
    intro v wv
    rw [wv,add_assoc] at wu
    have h₁ := add_eq_self b (v + u) (Eq.symm wu)
    have h₂ := add_eq_zero v u h₁
    rw [h₂,PA3] at wv
    assumption
