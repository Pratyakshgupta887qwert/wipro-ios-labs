
# Lab 2C – Protocols, Extensions, and Generics

## Objective

Use abstraction and code reuse in Swift without duplicating logic.

## Tasks Completed

### Task 1: Protocol and Conformance

Created a `Displayable` protocol with a computed property requirement named `displayInfo`.

Implemented protocol conformance in:

- `Student`
- `Course`

Both types provide their own implementation of the required property.

### Task 2: Extensions

Created an extension on the existing `String` type.

Added:
- `isNotEmpty` – Checks whether a string contains non-whitespace characters.
- `wordCount()` – Counts the words in a string.

Extensions allow existing types to gain additional functionality without modifying their original declarations.

### Task 3: Generic Stack

Created a generic `Stack<T>` structure.

Implemented:

- `push(_:)` – Adds an element.
- `pop()` – Removes and returns the top element.
- `peek()` – Returns the top element without removing it.
- `isEmpty` – Checks whether the stack contains elements.

The stack works with multiple data types, including integers and strings.

### Task 4: Protocol-Constrained Generic Function

Created:

`printDisplayInfo<T: Displayable>(_ item: T)`

The generic constraint ensures that only types conforming to `Displayable` can be passed.

Valid examples:
- Student
- Course

Invalid example:
- Int, because it does not conform to Displayable.

The invalid example is included as a code comment because uncommenting it would intentionally prevent compilation.

### Task 5: Extensions vs New Types

Extensions cannot add stored properties to an existing type.

They are useful for adding computed properties, methods, initializers, and protocol conformance.

When an application needs new stored state, creating a new structure or class is the correct approach.

## Optional Extension: Stack Protocol

Created a custom `StackOperations` protocol with an associated type.

Made `Stack<T>` conform to this protocol.

Tested the generic stack using:
- `Stack<Int>`
- `Stack<String>`

## Assertion Tests

Implemented 10 assertion checks covering:

1. Student display information.
2. Course display information.
3. String non-empty validation.
4. String word count.
5. Whitespace-only string validation.
6. Stack push and peek.
7. Stack pop.
8. Empty stack check.
9. String stack functionality.
10. Protocol-constrained generic function with Student.

## Project Structure

```text
lab-2c/
├── main.swift
└── README.md
```

## How to Run

Compile:

```bash
swiftc main.swift -o Lab2C
```

Run:

```bash
./Lab2C
```

## Conclusion

This lab demonstrates Swift protocols, protocol conformance, extensions, generic data structures, associated types, and protocol-constrained generic functions. It also demonstrates code reuse through a generic Stack implementation and validates the implementation using assertions.
