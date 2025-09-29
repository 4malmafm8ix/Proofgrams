inductive ℕ where
  | zero : ℕ
  | succ : ℕ → ℕ

open ℕ

theorem PA1 : ∀ x : ℕ, ¬(zero = succ x) :=
  by
    intro a t
    injection t

theorem PA2 : ∀ m n : ℕ, (succ m) = (succ n) → m = n :=
  by
    intro m n t
    injection t

theorem one_neq_two : (succ zero) ≠ succ (succ zero) :=
  by
    intro t
    have h : zero = succ zero
      := PA2 zero (succ zero) t
    exact PA1 zero h

def add (m n : ℕ) : ℕ :=
  match n with
    | zero   => m
    | succ n => succ (add m n)

instance : Add ℕ where
  add := add

theorem PA3 (m : ℕ) : m + zero = m := by rfl
theorem PA4 (m n : ℕ) : m + (succ n) = succ (m + n) := by rfl

-- PA ⊢ 2 + 1 = 3
theorem two_plus_one : (succ (succ zero)) + succ zero = succ (succ (succ zero)) :=
  by
    --rw [PA4,PA3]
    rfl

theorem succ_eq_plusone : ∀ x : ℕ, succ x = x + (succ zero) :=
  by
    intro a
    rfl

-- PA ⊢ zero + zero = zero
theorem basestep : zero + zero = zero :=
  by
    rw [PA3]

-- PA, 0 + n = n ⊢ 0 + succ n = succ n
theorem inductionstep {n : ℕ} (t : zero + n = n) : zero + (succ n) = succ n :=
  by
    rw [PA4, t]

-- PA ⊢ ∀ x : ℕ, 0 + succ x = succ x
theorem zero_add : ∀ x : ℕ, zero + x = x :=
  by
    intro k
    induction k with
    | zero      =>  rfl
    | succ k ih =>  rw [PA4, ih]

def mul (m n : ℕ) : ℕ :=
  match n with
  | zero   => zero
  | succ n => add (mul m n) m

instance : Mul ℕ where
  mul := mul

theorem PA5 (m : ℕ) : m * zero = zero := by rfl
theorem PA6 (m n : ℕ) : m * (succ n) = (m * n) + m := by rfl

example: (succ (succ (succ zero))) * (succ (succ zero)) = (succ (succ (succ ( succ (succ (succ zero)))))) :=
  by
    rfl

theorem mul_one : ∀ x : ℕ, x * (succ zero) = x :=
  by
    intro a
    rw [PA6,PA5,zero_add]

theorem mul_one' : ∀ x : ℕ, x * (succ zero) = x :=
  by
    intro a
    calc a * (succ zero)
      _ = a := by rw [PA6,PA5,zero_add]
