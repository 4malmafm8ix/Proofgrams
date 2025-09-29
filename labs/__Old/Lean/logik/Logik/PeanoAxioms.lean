-- What is the minimal working example for PA in L∃∀N?
inductive ℕ where
  | zero : ℕ
  | succ : ℕ → ℕ
  deriving Repr

open ℕ

def succ_not_zero : ∀ x : ℕ, succ x ≠ zero :=
  by
    intro x h
    injection h

def zero_or_notzero : ∀ x : ℕ, (x = zero) ∨ (x ≠ zero) :=
  by
    intro n
    -- Proof of "∀ x : ℕ, P(x)" is a function from ℕ to P(x)
    -- for each natural number x. In Lean we can write a function
    -- out of an inductive type by pattern matching.
    match n with
    | zero   => apply Or.intro_left
                rfl
    | succ m => apply Or.intro_right
                exact succ_not_zero m

    -- One can also write a proof by induction.
    -- But this never actually uses the IH
    -- induction n with
    -- | zero      => apply Or.intro_left
    --                rfl
    -- | succ n ih => apply Or.elim ih
    --                intro h₁
    --                apply Or.intro_right
    --                exact succ_not_zero n
    --                intro h₃
    --                apply Or.intro_right
    --                exact succ_not_zero n

def nat_to_peano (n : Nat) : ℕ :=
  match n with
  | 0   => zero
  | n+1 => succ (nat_to_peano (n))

instance : OfNat ℕ n where
  ofNat := nat_to_peano n

def add (m n : ℕ) : ℕ :=
  match n with
  | 0   => m
  | succ n => succ (add m n)

instance : Add ℕ where
  add := add

theorem add_zero : ∀ m : ℕ, m + 0 = m :=
  by
    intro a
    rfl

theorem add_succ : ∀ m n : ℕ, m + (succ n) = succ (m + n) :=
  by
    intro a b
    rfl

def mul (m n : ℕ) : ℕ :=
  match n with
  | 0   => 0
  | succ n => add (mul m n) m

instance : Mul ℕ where
  mul := mul

theorem PA5 (m : ℕ) : m * 0 = 0 := by rfl
theorem PA6 (m n : ℕ) : m * (succ n) = (m * n) + m := by rfl

theorem mul_zero : ∀ m : ℕ, m * 0 = 0 :=
  by
    intro a
    rfl

theorem mul_succ : ∀ m n : ℕ, m * (succ n) = (m * n) + m :=
  by
    intro a b
    rfl

-- Define < predicate
def lt (m n : ℕ) := (∃ x : ℕ, n = m + succ x)

instance : LT ℕ where
  lt := lt

-- Define ≤ predicate
def leq (m n : ℕ) := (∃ x : ℕ, n = m + x)

instance : LE ℕ where
  le := leq

-- Define division predicate
def divides (m n : ℕ) := (m ≠ 0) ∧ (∃ x : ℕ, n = m * x)

-- This seems to conflict with the | notation in pattern matching.
--infix:50 " | " => divides

theorem two_div_four : divides (2:ℕ) (4:ℕ) :=
  by
    apply And.intro
    -- 2 ≠ 0
    intro t₁
    injection t₁
    -- 4 = 2 * 2
    apply Exists.intro 2
    rfl

-- Divisibility is reflexive
theorem divisibility_reflexive : ∀ x : ℕ, 0 < x → divides x x :=
  by
    intro a
    intro t₁
    sorry

-- Multiplication is associative
theorem mul_assoc : ∀ x y z : ℕ, (x*y)*z = x * (y*z) :=
  by
    sorry

-- Divisibility is transitive
theorem divisibility_transitive :
  ∀ x y z : ℕ, (divides x y) → (divides y z) → (divides x z) :=
    by
      intro a b c
      intro t₁ t₂
      have ⟨u₁, wu₁⟩ := t₁
      have ⟨u₂, wu₂⟩ := t₂
      apply And.intro u₁
      apply Exists.elim wu₁
      intro d t₃
      apply Exists.elim wu₂
      intro e t₄
      exists d*e
      calc c
      _ = b * e   := t₄
      _ = (a*d)*e := by rw [t₃]
      _ = a*(d*e) := by rw [mul_assoc]

#print divisibility_transitive

-- Divisibility is anti-symmetric
theorem divisibility_asymm :
  ∀ x y : ℕ, (divides x y) → (divides y x) → x = y :=
  by
    intro a b
    intro t₁ t₂
    sorry
