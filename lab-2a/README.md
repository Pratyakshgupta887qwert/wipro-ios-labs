
# Lab 2A – Functions and Higher-Order Functions

## Objective

Decompose logic into reusable functions and use Swift higher-order functions such as `map`, `filter`, `reduce`, and `sorted`.

## Tasks Completed

### Task 1: Reusable Functions

Implemented four reusable functions:

1. `calculateMean(of:)` – Calculates the average of an array of numbers.
2. `findMaximum(in:)` – Finds the maximum integer in an array.
3. `isValidEmail(_:)` – Performs basic email-like input validation.
4. `formatDisplayName(firstName:lastName:)` – Formats a person's display name.

The functions use clear parameter labels and explicit return types. Optional return values are used when an operation may not produce a result.

### Task 2: Higher-Order Functions

Used an array of transactions:

- `filter` selects transactions whose type is expense.
- `map` transforms expense transactions into readable descriptions.
- `reduce` calculates the total amount spent.

### Task 3: Sorting Students

Students are sorted by:

1. Marks in descending order.
2. Names in alphabetical order when marks are equal.

The `sorted(by:)` method provides the custom sorting logic.

### Task 4: Loop vs Higher-Order Functions

Implemented two approaches to calculate total expenses:

- A traditional `for` loop with an `if` condition.
- A combination of `filter` and `reduce`.

Both approaches return the same result.

**Comparison:**

The loop-based approach is straightforward and familiar, making it useful for beginners and complex step-by-step logic. Higher-order functions provide a more declarative and concise approach. They make the intention of operations such as filtering and transforming data easier to understand. However, deeply nested higher-order functions can sometimes reduce readability. The best approach depends on the complexity of the operation and the clarity of the code.

### Task 5: Function Design

Functions use:

- Meaningful function names.
- Descriptive external parameter labels.
- Explicit return types.
- Optional return types where appropriate.

## Optional Extension: Spending by Category

Used `Dictionary(grouping:by:)` and `mapValues` to group expenses by category and calculate the total spending in each category using `reduce`.

## Test Table

| Test Case | Input | Expected Result |
|---|---|---|
| Mean | `[75, 80, 90, 85]` | `82.5` |
| Empty mean | `[]` | `nil` |
| Maximum | `[10, 50, 30, 90, 20]` | `90` |
| Valid email | `student@example.com` | `true` |
| Invalid email | `studentexample.com` | `false` |
| Display name | `Pratyaksh`, `Gupta` | `Pratyaksh Gupta` |
| Total expenses | Expense transactions | `6000` |
| Student sorting | Given student array | Marks descending, names ascending for ties |
| Loop vs HOF | Same transactions | Equal totals |

## Project Structure

```text
lab-2a/
├── main.swift
└── README.md
```

## How to Run

Compile:

```bash
swiftc main.swift -o Lab2A
```

Run:

```bash
./Lab2A
```

## Conclusion

This lab demonstrates reusable Swift functions, parameter labels, return types, optional values, collection operations, custom sorting, and the difference between imperative and declarative programming approaches.
