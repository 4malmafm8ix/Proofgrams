-- For mathematicians to make use of the Curry Howard correspondence
-- the underlying type theory of the language needs to allow for the
-- expression of objects that mathematicians care about e.g. numbers!

-- Lean has a number of ways to express mathematical constructions.
-- These include, but are not limited to:
--    Inductive types
--    Record types
--    Type classes

-- Recall from our studies of first order logic that we defined the
-- signature of a first order language in order to encode the structure
-- that we were interested in formalising. We can think of inductive
-- types in a similar way.

-- PA : (0,s,+,×,=)
--    The terms (i) 0 and (ii) s, construct the terms of the language.
--    These are the pieces of information that an inductive type needs.
inductive ℕ where
  | zero : ℕ       -- 0 is a natural number.
  | succ : ℕ → ℕ   -- If n : ℕ, then succ n : ℕ
  deriving Repr

open ℕ
-- Lean thinks of natural numbers as the type including
-- zero
-- succ zero
-- succ (succ zero)
-- succ (succ (succ zero))
-- ⋮
-- In fact the inductive type constructor ensures these are the only
-- natural numbers and that they're all distinct.
theorem PA1 (m : ℕ) : ¬(succ m = zero) := by intro f<;>injection f
theorem PA2 (m n : ℕ) : succ m = succ n → m = n := by intro h<;>injection h

-- This leaves some of the signature PA : (0,s,+,×,=) to be defined.
-- Rather than thinking of +,× as term builders, we think of them
-- as they should be thought of: as functions!
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
@[simp]
theorem PA3 (m : ℕ) : m + zero = m := by rfl

@[simp]
theorem PA4 (m n : ℕ) : m + (succ n) = succ (m + n) := by rfl

@[simp]
theorem PA5 (m : ℕ) : m * zero = zero := by rfl

@[simp]
theorem PA6 (m n : ℕ) : m * (succ n) = (m * n) + m := by rfl

@[simp]
theorem zero_add : ∀ x : ℕ, zero + x = x :=
  by
    intro a
    induction a with
    | zero      => rfl
    | succ k ih =>
      calc
        zero + succ k
        = succ (zero + k) := by rw [PA4]
        _ = succ k        := by rw [ih]

@[simp]
theorem zero_mul : ∀ x : ℕ, zero * x = zero := sorry

@[simp]
theorem mul_one : ∀ x : ℕ, x * (succ zero) = x := sorry

@[simp]
theorem succ_add : ∀ x y : ℕ, (succ x) + y = succ (x + y) := sorry

@[simp]
theorem add_assoc : ∀ x y z : ℕ, (x + y) + z = x + (y + z) := sorry

@[simp]
theorem add_comm : ∀ x y : ℕ, x + y = y + x := sorry

@[simp]
theorem succ_mul : ∀ x y : ℕ, (succ x) * y = x * y + y :=
  by
    intro a b
    induction b with
    | zero      => rfl
    | succ k ih => rw [PA6,PA4,PA4,PA6,ih]
                    -- (ak + k) + a = (ak + a) + k
                    -- ak + (k + a) = (ak + a) + k
                   rw [add_assoc,add_comm k a]
                   -- ak + (a + k) = (ak + a) + k
                   rw [<-add_assoc]

@[simp]
theorem mul_comm : ∀ x y : ℕ, x * y = y * x := sorry

@[simp]
theorem mul_assoc : ∀ x y z : ℕ, (x * y) * z = x * (y * z) := sorry

@[simp]
theorem mul_add : ∀ x y z : ℕ, x * (y + z) = x * y + x * z :=
  by
    intro a b c
    induction a with
    | zero      => simp
    | succ n ih =>
        calc
        (succ n) * (b + c)
            = n * (b + c) + (b + c)       := by rw [succ_mul]
        _   = (n * b + n * c) + (b + c)   := by rw [ih]
        _   = n * b + (n * c + (b + c))   := by rw [add_assoc]
        _   = n*b + (((n*c) + b) + c)     := by rw [<-add_assoc (n*c)]
        _   = n*b + ((b + (n*c)) + c)     := by rw [add_comm b]
        _   = n*b + (b + ((n*c) + c))     := by rw [add_assoc]
        _   = n*b + (b + (succ n * c))    := by rw [<-succ_mul]
        _   = n*b + b + (succ n * c)      := by rw [<-add_assoc]
        _   = (succ n * b) + (succ n * c) := by rw [<-succ_mul]

@[simp]
theorem add_mul : ∀ x y z : ℕ, (y + z) * x = y * x + z * x :=
  by
    intro a b c
    rw [mul_comm, mul_comm b, mul_comm c,mul_add]

-- We can define < relation using the following
-- existential ∃ statement.
def strictLT (m n : ℕ) := ∃ k : ℕ, n = m + (succ k)
-- Declaring an instance of LT gives us the infix < symbol
-- for stating the relation strictlt.
instance : LT ℕ where
  lt := strictLT
-- Since < defined using the ∃ quantifier, you will need
-- to use the corresponding ∃ terms/tactics in Lean.

-- apply Exists.intro a
-- ... This reduces the goal to a proof that a has the required
-- property.

-- To use an hypothesis of the form  t : a ≤ b we can access
-- the two pieces of information using the following methods:
-- (i) obtain ⟨k,p⟩ := t
--    This introduces the k: b = a + succ k
--    and the proof, p, of this equation.
-- (ii) rcases t with ⟨k,p⟩ does the same thing.

theorem zero_lt_succ : ∀ x : ℕ, zero < succ x :=
  by
    intro a
    -- succ a = zero + succ ? ; a solves this.
    apply Exists.intro a
    --rw [PA4,zero_add]
    simp

theorem lt_succ : ∀ x : ℕ, x < succ x :=
  by
    intro a
    -- succ a = a + succ ? ; zero solves this.
    apply Exists.intro zero
    rfl

theorem succ_lt : ∀ x y : ℕ, x < y → succ x < succ y :=
  by
    intro a b t
    obtain ⟨k,pk⟩ := t
    -- b      = a + succ k
    -- succ b = succ a + succ ? ; solves this
    apply Exists.intro k
    --simp [pk]
    rw [succ_add,<-pk]

--                              x < y ∧ y < z → x < z
theorem lt_trans : ∀ x y z : ℕ, x < y → y < z → x < z :=
  by
    intro a b c alb blc
    obtain ⟨k,pk⟩ := alb
    obtain ⟨l,pl⟩ := blc
    -- Goal: c = a + succ ?
    -- c = b + succ l
    --   = (a + succ k) + succ l
    --   = a + (succ k + succ l)
    --   = a + succ (k + succ l)
    apply Exists.intro (k + succ l)
    simp [pk, pl]
    rw [add_comm,add_assoc]

theorem zero_or_gtzero : ∀ x : ℕ, x = zero ∨ zero < x :=
 by
  intro a
  match a with
  | zero   => apply Or.intro_left (zero < zero)
              rfl
  | succ k => apply Or.intro_right (k.succ = zero)
              exact zero_lt_succ k

-- We say a divides b if there is some other natural number
-- k such that b = ak. However, we also need the divisor
-- to be non-zero!
def natDivideNat (m n : ℕ) := (∃ k : ℕ, n = m*k) ∧ (m ≠ zero)

-- Again, declaring the type class instance gives us the
-- syntactic sugar we're used to for the divides relation.
-- You can type \ | to get the divides symbol a ∣ b
instance : Dvd ℕ where
  dvd := natDivideNat

theorem divide_reflexive : ∀ x : ℕ, x ≠ zero → x ∣ x :=
  by
    intro a anz
    apply And.intro
    -- a = a * ?
    apply Exists.intro (succ zero)
    simp
    exact anz


theorem divide_transitive : ∀ x y z : ℕ, x ∣ y → y ∣ z → x ∣ z :=
  by
    intro a b c
    intro adb bdc
    obtain ⟨p,anz⟩ := adb
    obtain ⟨k,pk⟩ := p
    obtain ⟨q,bnz⟩ := bdc
    obtain ⟨l,pl⟩ := q
    -- c = a * ?
    -- c = b * l
    --   = (a * k) * l
    --   = a * (k * l)
    apply And.intro
    apply Exists.intro (k*l)
    rw [<-mul_assoc,<-pk,pl]
    exact anz

-- To prove the anti-symmetry of divides we state
-- the following helper theorems without proof.
theorem helper : ∀ a b : ℕ, a ≠ zero → a = a*b → b = succ zero := sorry
theorem helper2 : ∀ a b : ℕ, a * b = succ zero → a = succ zero := sorry

theorem divide_antisymm : ∀ x y : ℕ, x ∣ y ∧ y ∣ x → x = y :=
  by
    intro a b t
    obtain ⟨p,anz⟩ := t.left
    obtain ⟨k,pk⟩ := p
    obtain ⟨q,bnz⟩ := t.right
    obtain ⟨l,pl⟩ := q
    rw [pk]
    rw [pk,mul_assoc] at pl
    have t1 := helper a (k*l) anz pl
    have t2 := helper2 k l t1
    rw [t2,PA6,PA5,zero_add]

#print divide_antisymm
