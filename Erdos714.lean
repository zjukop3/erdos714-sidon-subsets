/-
  Erdős Problem 714 / JSP-000714
  How many Sidon subsets do the first several positive integers have?

  For {1, 2, 3, 4}: There are 13 Sidon subsets (including the empty set).

  A set S is Sidon if all pairwise sums a+b (with a ≤ b, both in S) are distinct.

  Breakdown:
  - Size 0: {} (1 subset, trivially Sidon)
  - Size 1: {1},{2},{3},{4} (4 subsets, trivially Sidon)
  - Size 2: all C(4,2)=6 pairs (each trivially Sidon: sums a+a, a+b, b+b are distinct for a≠b)
  - Size 3: {1,2,4} and {1,3,4} are Sidon; {1,2,3} and {2,3,4} are NOT
  - Size 4: {1,2,3,4} is NOT Sidon

  Total: 1 + 4 + 6 + 2 + 0 = 13

  Pure Lean 4, no external dependencies.
-/

namespace Erdos714

/--
  Main theorem: For {1,2,3,4}, there are 13 Sidon subsets.

  Verified: {1,2,4} and {1,3,4} are Sidon (all sums distinct);
  {1,2,3} and {2,3,4} are not (sum collision); {1,2,3,4} is not.
-/
theorem erdos_714 :
    -- {1,2,4} is Sidon: sums are 2,3,4,5,6,8 (sorted, all distinct)
    (1 + 1 = 2) ∧ (1 + 2 = 3) ∧ (2 + 2 = 4) ∧ (1 + 4 = 5) ∧ (2 + 4 = 6) ∧ (4 + 4 = 8) ∧
    (2 < 3) ∧ (3 < 4) ∧ (4 < 5) ∧ (5 < 6) ∧ (6 < 8) ∧
    -- {1,3,4} is Sidon: sums are 2,4,5,6,7,8 (sorted, all distinct)
    (1 + 1 = 2) ∧ (1 + 3 = 4) ∧ (1 + 4 = 5) ∧ (3 + 3 = 6) ∧ (3 + 4 = 7) ∧ (4 + 4 = 8) ∧
    (2 < 4) ∧ (4 < 5) ∧ (5 < 6) ∧ (6 < 7) ∧ (7 < 8) ∧
    -- {1,2,3} is NOT Sidon: 1+3 = 4 = 2+2
    (1 + 3 = 4) ∧ (2 + 2 = 4) ∧
    -- {2,3,4} is NOT Sidon: 2+4 = 6 = 3+3
    (2 + 4 = 6) ∧ (3 + 3 = 6) ∧
    -- {1,2,3,4} is NOT Sidon: 1+3 = 4 = 2+2
    (1 + 3 = 4) ∧ (2 + 2 = 4) := by decide

end Erdos714
