# Lean Proofs and Functional Programming

This Lean project contains implementations of various mathematical functions, operations, and proofs, including:

- List operations (allp, shuffle)
- Term evaluation
- Truncated subtraction
- Logical proofs

## Author

Rodolfo Lopez

## Date

Fall 2022

## Installation

To run this project, you need to install Lean. The recommended way is to use elan, the Lean version manager:

1. Install elan:

   - On Unix-like systems (Linux, macOS):
     ```
     curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
     ```
   - On Windows:
     ```
     curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.ps1 -sSf | powershell -c -
     ```

2. Restart your terminal or run `source ~/.profile` (or equivalent for your shell).

3. Install Lean:

   ```
   elan install leanprover/lean4:stable
   ```

4. Verify the installation:
   ```
   lean --version
   ```

For more detailed instructions, visit the [Lean website](https://leanprover.github.io/lean4/doc/setup.html).

## Usage

Open the `hw5.lean` file in a Lean-compatible editor to view and evaluate the code.

## File Structure

- `hw5.lean`: Contains all the implementations of mathematical functions, operations, and proofs

## Key Concepts

The project covers the following Lean concepts:

- Recursive function definitions
- Inductive data types
- Pattern matching
- List operations
- Natural number operations
- Logical proofs

## Key Functions and Proofs

- `allp`: Checks if all elements in a list satisfy a given predicate
- `shuffle`: Combines two lists by alternating their elements
- `term`: Inductive data type for arithmetic expressions
- `eval`: Evaluates a term to a natural number
- `tsub`: Implements truncated subtraction
- `tsub_zero`, `zero_tsub`, `add_tsub`: Proofs related to truncated subtraction
- `nmi`, `contrapose`, `de_morgan1a`, `de_morgan1b`: Logical proofs
- `nnlem`: Extra credit proof (not implemented)
