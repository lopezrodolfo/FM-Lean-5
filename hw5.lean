-- Math 494 Homework #5
-- Rodolfo Lopez
-- The analogue of "false" for Types is called "empty".
def neg (A : Type) := A → empty
notation (name := myneg) `¬` x := neg x

open nat
open sum
open list

/- Define a function "allp" which takes a list and a Boolean-valued predicate on elements of that list, and returns true if (and only if) all elements of the list satisfy that predicate. -/
def allp {A : Type} (P : A → bool) : list A → bool 
| [] := tt
| (a :: A) := if P a then allp A else ff

-- Define a function that "shuffles" two lists together, alternating one element from each list starting from the first.  Thus, for instance, shuffle [1,2,3,4] [10,11,12,13] = [1,10,2,11,3,12,4,13].  If one list is longer than the other, include the remaining elements at the end.
def shuffle {A : Type} : list A → list A → list A 
| [] l := l
| l [] := l
| (x :: xs) (y :: ys) := [x] ++ [y] ++ shuffle xs ys

/- Define an inductive data type "term" with the following constructors:

* const n     where n:ℕ, a constant denoting the natural number n
* plus s t    where s:term and t:term, denoting the sum of s and t
* times s t   where s:term and t:term, denoting the product of s and t

Thus, for instance, (plus (const 3) (times (const 2) (const 6))) would represent 3+(2*6). -/

------------------------------
-- YOUR DEFINITION HERE
------------------------------
inductive term: Type
|const (n: ℕ)
|plus (s t : term)
|times (s t : term)

-- Don't forget to "open term" so you can refer to its constructors!
open term

-- Now recursively define a function that evaluates any such term to a natural number.
def eval : term → ℕ 
|(const n) := n
|(plus s t) := eval(s) + eval(t)
|(times s t) := eval(s) * eval(t)

#reduce (plus (const 3) (times (const 2) (const 6))) 

-- Define the "truncated subtraction" operation on natural numbers, which acts like subtraction but returns 0 if the result would be negative.  Give a definition by direct recursion.
def tsub : ℕ → ℕ → ℕ 
| x zero := x
| x (succ y) := pred((tsub x y))

-- Prove that anything minus zero is itself.
def tsub_zero (n : ℕ) : tsub n 0 = n :=
begin
  induction n,
  case zero {reflexivity},
  case succ {reflexivity},
end

-- Prove that zero minus anything is zero.
def zero_tsub (n : ℕ) : tsub 0 n = 0 := 
begin
  induction n with n IH,
  case zero {reflexivity},
  case succ {rw tsub, rw IH, reflexivity},
end

-- Prove that subtraction undoes addition.  You may want to use tsub_zero.
def add_tsub (m n : ℕ) : tsub (m + n) n = m := sorry

-- Prove the following theorems.  You may use tactics or not, as you prefer.

def nmi (A B C : Type) : (A × (B → C)) → ((A → B) → C) := 
begin 
  intros axbtc atb,
  cases axbtc with a btc,
  apply btc (atb a),
end

def contrapose (A B : Type) : (A → B) → (¬ B → ¬ A) := 
begin 
  intros atb nb a,
  cases nb (atb a),
end

def de_morgan1a (A B : Type) : (¬ (A ⊕ B)) → (¬ A × ¬ B) := 
begin 
  intros nadb,
  constructor,
  intros a,
  apply nadb,
  left,
  assumption,
  intros b,
  apply nadb,
  right,
  assumption,
end

def de_morgan1b (A B : Type) : (¬ A × ¬ B) → ¬ (A ⊕ B) := 
begin 
  intros naxnb,
  cases naxnb with na nb,
  intros adb,
  cases adb with a b,
  cases na a,
  cases nb b,
end

-- Do the last two remind you of anything from HW #2?

-- Finally, extra credit!
def nnlem (A : Type) : ¬ ¬ (A ⊕ ¬ A) := 
sorry

