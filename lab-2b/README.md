
# Lab 2B – Closures

## Objective

Pass behaviour as a value and understand Swift closure syntax, captured values, and closure lifetime.

## Tasks Completed

### Task 1: Sort Students Using a Closure

Created a `Student` structure containing a name and marks.

Used the `sorted(by:)` method with a custom closure to sort students:
- Marks in descending order.
- Names alphabetically when marks are equal.

### Task 2: Completion Closure

Implemented `performOperation(operationName:completion:)`.

The function accepts a completion closure as a parameter and calls it after the simulated operation finishes.

This demonstrates passing behaviour as a value.

### Task 3: Trailing Closure Syntax

Demonstrated:
- Trailing-closure syntax.
- Shorthand argument names using `$0`.
- Explicit closure parameter names using `number in`.

Both shorthand and explicit syntax perform transformations on an array.

### Task 4: Counter Closure and Captured State

Implemented `createCounter()`.

The function creates a local variable named `count` and returns a closure that increments and returns it.

The closure captures the variable from its surrounding scope. The captured state remains available between calls, even after `createCounter()` has returned.

### Task 5: Avoiding Retain Cycles

Created a `DataManager` class that stores a completion closure.

A strong reference from the stored closure back to the object could create a retain cycle.

Used `[weak self]` in the capture list to avoid this problem.

The closure safely unwraps `self` using `guard let`.

The object is released when its strong references are removed, allowing `deinit` to execute.

## Optional Extension: Retry Helper

Implemented `retryOperation(maxAttempts:operation:)`.

The helper:
- Accepts an operation closure.
- Executes the operation up to a specified number of attempts.
- Stops immediately when the operation succeeds.
- Returns `true` for success and `false` when all attempts fail.

The example simulates two failures followed by a successful third attempt.

## Important Concepts

| Concept | Explanation |
|---|---|
| Closure | A self-contained block of functionality |
| Completion closure | A closure called after an operation |
| Trailing closure | Closure syntax written outside function parentheses |
| `$0` | Shorthand name for the first closure argument |
| Capture | Accessing values from the surrounding scope |
| Captured state | A captured variable that can retain changes |
| `[weak self]` | Prevents a closure from strongly retaining its owning object |
| `deinit` | Called when a class instance is deallocated |

## Project Structure

```text
lab-2b/
├── main.swift
└── README.md
```

## How to Run

Compile:

```bash
swiftc main.swift -o Lab2B
```

Run:

```bash
./Lab2B
```

## Conclusion

This lab demonstrates how Swift closures can be passed as values, used for sorting and transformations, and stored for later execution. It also explains captured state, closure lifetime, and how weak references help prevent retain cycles.
