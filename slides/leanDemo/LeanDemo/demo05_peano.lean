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
theorem PA1 (m : ℕ) : ¬(succ m = zero) := by intro f;injection f
theorem PA2 (m n : ℕ) : succ m = succ n → m = n := by intro h;injection h

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
theorem PA3 (m : ℕ) : m + zero = m := by rfl
theorem PA4 (m n : ℕ) : m + (succ n) = succ (m + n) := by rfl
theorem PA5 (m : ℕ) : m * zero = zero := by rfl
theorem PA6 (m n : ℕ) : m * (succ n) = (m * n) + m := by rfl

theorem zero_add : ∀ x : ℕ, zero + x = x := sorry

theorem zero_mul : ∀ x : ℕ, zero * x = zero := sorry

theorem mul_one : ∀ x : ℕ, x * (succ zero) = x := sorry

theorem succ_add : ∀ x y : ℕ, (succ x) + y = succ (x + y) := sorry

theorem add_assoc : ∀ x y z : ℕ, (x + y) + z = x + (y + z) := sorry

theorem add_comm : ∀ x y : ℕ, x + y = y + x := sorry

theorem succ_mul : ∀ x y : ℕ, (succ x) * y = x * y + y := sorry

theorem mul_comm : ∀ x y : ℕ, x * y = y * x := sorry

theorem add_mul : ∀ x y z : ℕ, (y + z) * x = y * x + z * x := sorry

theorem mul_assoc : ∀ x y z : ℕ, (x * y) * z = x * (y * z) := sorry

theorem mul_add : ∀ x y z : ℕ, x * (y + z) = x * y + x * z :=
  by
    intro a b c
    induction a with
    | zero      => rw [zero_mul,zero_mul,zero_mul,zero_add]
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
    apply Exists.intro a
    rw [zero_add]

theorem lt_succ : ∀ x : ℕ, x < succ x :=
  by
    intro a
    apply Exists.intro zero
    rw [PA4,PA3]

theorem succ_lt : ∀ x y : ℕ, x < y → succ x < succ y :=
  by
    intro a b t
    obtain ⟨x, p⟩ := t
    apply Exists.intro x
    rw [succ_add,p]

theorem lt_trans : ∀ x y z : ℕ, x < y ∧ y < z → x < z :=
  by
    intro a b c
    intro t
    --obtain ⟨u, p⟩ := t.left
    rcases t.left with ⟨u,p⟩
    obtain ⟨v, q⟩ := t.right
    apply Exists.intro (u + succ v)
    rw [<-succ_add,<-add_assoc,<-p,q]
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
def divide (m n : ℕ) := (∃ k : ℕ, n = m*k) ∧ (m ≠ zero)

-- Again, declaring the type class instance gives us the
-- syntactic sugar we're used to for the divides relation.
-- You can type \ | to get the divides symbol a ∣ b
instance : Dvd ℕ where
  dvd := divide

theorem divide_reflexive : ∀ x : ℕ, x ≠ zero → x ∣ x :=
  by
    intro a t
    apply And.intro
    apply Exists.intro (succ zero)
    rw [PA6,PA5,zero_add]
    exact t

theorem divide_transitive : ∀ x y z : ℕ, x ∣ y → y ∣ z → x ∣ z :=
  by
    intro a b c
    intro p₁ p₂
    obtain ⟨ek,x⟩ := p₁
    obtain ⟨el,y⟩ := p₂
    obtain ⟨k,pk⟩ := ek
    obtain ⟨l,pl⟩ := el
    apply And.intro
    apply Exists.intro (k*l)
    rw [<-mul_assoc,<-pk,pl]
    exact x

-- To prove the anti-symmetry of divides we state
-- the following helper theorems.
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
