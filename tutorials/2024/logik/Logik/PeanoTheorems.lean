import Logik.PeanoAxioms

open ℕ

-- PA ⊢ 1 + 1 = 2
theorem quickMaf : (succ 0) + (succ 0) = succ (succ 0) :=
  by
    rw [add_succ, add_zero]

-- PA ⊢ 3 ≠ 1

-- PA ⊢ ∀ x : ℕ, x + 1 = succ x
theorem plusone_eq_succ : ∀ x : ℕ, x + (succ 0) = succ x :=
  by
    intro a
    rw [add_succ, add_zero]

-- Thoughts while writing proofs:
--    [ ] :: Start with the lefthand side, use theorems to rewrite goal.
--    [ ] ::

-- PA ⊢ ∀ x : ℕ, 0 + x = x
theorem zero_add : ∀ x : ℕ, 0 + x = x :=
  by
    intro a
    induction a with
    | 0         => rw [add_zero]
    | succ a ih => rw [add_succ,ih]

-- PA ⊢ ∀ x : ℕ, x * 1 = x
theorem mul_one : ∀ x : ℕ, x * (succ zero) = x :=
  by
    intro a
    rw [mul_succ,mul_zero,zero_add]

-- PA ⊢ ∀ x : ℕ, 0 * x = 0
theorem zero_mul : ∀ x : ℕ, zero * x = zero :=
  by
    intro k
    induction k with
    | zero      => rfl
    | succ k ih => rw [mul_succ,add_zero,ih]

-- PA ⊢ ∀ x : ℕ, 1 * x = x
theorem one_mul : ∀ x : ℕ, (succ zero) * x = x :=
  by
    intro a
    induction a with
    | zero      => rw [mul_zero]
    | succ a ih => rw [mul_succ,add_succ,add_zero,ih]

-- PA ⊢ ∀ x y : ℕ, (succ y) + x = succ (y + x)
theorem succ_add : ∀ x y : ℕ, (succ y) + x = succ (y + x) :=
  by
    intro a b
    induction a with
    | zero      => rw [add_zero,add_zero]
    | succ a ih => rw [add_succ,add_succ,ih]

-- PA ⊢ ∀ x y z: ℕ, (y + z) + x = y + (z + x)
theorem add_assoc : ∀ x y z : ℕ, (y + z) + x = y + (z + x) :=
  by
    intro a b c
    induction a with
    | zero      => rw [add_zero, add_zero]
    | succ a ih => rw [add_succ,add_succ,add_succ,ih]

-- PA ⊢ ∀ x y : ℕ, y + x = x + y
theorem add_comm : ∀ x y : ℕ, x + y = y + x :=
  by
    intro a b
    induction a with
    | zero      => rw [add_zero,zero_add]
    | succ a ih => rw [add_succ,succ_add,ih]

-- Challenges
-- PA ⊢ ∀ x y : ℕ, (succ y) * x = (y * x) + x
theorem succ_mul : ∀ x y : ℕ, (succ y) * x = (y * x) + x :=
  by
    intro a b
    induction a with
    | zero      => rw [add_zero, mul_zero,mul_zero]
    | succ a ih => rw [mul_succ,add_succ,add_succ,ih,
                       mul_succ, add_assoc, add_comm a b,
                       ← add_assoc]

-- PA ⊢ ∀ x y z : ℕ, x*(y + z) = x*y + x*z mul_ldistr_add
theorem mul_ldistr_add : ∀ x y z : ℕ, x*(y + z) = x*y + x*z :=
  by
    intro a b c
    induction a with
    | zero      => rw [zero_mul, zero_mul, zero_mul, zero_add]
    | succ a ih => rw [succ_mul,succ_mul,succ_mul,
                       ih,add_assoc, ←add_assoc c (a*c) b,
                       add_comm (a*c) b,add_assoc,←add_assoc]

-- PA ⊢ ∀ x y z : ℕ, (y + z)*x = y*x + z*x mul_rdistr_add
theorem mul_rdistr_add : ∀ x y z : ℕ, (y + z)*x = y*x + z*x :=
  by
    intro a b c
    induction a with
    | zero      => rw [mul_zero,mul_zero,mul_zero,add_zero]
    | succ a ih => sorry--rw [mul_succ, mul_succ, mul_succ,ih]



-- Challenge from Kerry to prove something "interesting".
-- Square-root of 2 not a natural number.
theorem sqrt_two_notnat : ¬ ∃ x : ℕ, x * x = succ (succ zero) :=
  by
    intro t₁
    apply Exists.elim t₁
    intro a t₂
