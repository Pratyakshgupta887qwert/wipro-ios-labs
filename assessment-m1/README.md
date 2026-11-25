
# Swift Practical Assessment

## Objective

Demonstrate practical knowledge of Swift collections, optionals, generics, ARC, error handling, and fundamental object-oriented programming concepts.

## Task 1: Gradebook

Implemented a gradebook using:

- An array of marks for each student.
- A dictionary with student IDs as keys.
- A `GradeStudent` structure.
- A computed optional average property.
- Safe dictionary lookups using optional binding.

The program handles missing student IDs and students without marks safely.

## Task 2: Generic Stack

Implemented `Stack<T>` with:

- `push(_:)`
- `pop()`
- `peek()`
- `isEmpty`

Demonstrated the generic stack using:

- `Stack<Int>`
- `Stack<String>`

The same implementation works with different element types without duplicating logic.

## Task 3: Retain Cycle

Created a `StudentManager` class that stores a completion closure.

A retain cycle could occur if the closure strongly captured `self`.

Fixed the issue using `[weak self]` in the closure capture list.

This allows ARC to release the object when its external strong references are removed.

## Task 4: Error Handling

Created `StudentValidationError` with two cases:

- `emptyName`
- `invalidMarks`

Implemented a throwing `validateStudent(name:marks:)` function.

Handled both errors separately using `do-catch`, displaying meaningful messages.

## Task 5: Viva Topics

Prepared explanations for:

1. Struct vs Class
2. Protocol vs Inheritance
3. Map, Filter and Reduce

## Test Cases

| Test | Input | Expected result |
|---|---|---|
| Student lookup | ID 101 | Aman |
| Missing student | ID 999 | nil |
| Student average | ID 102 | 92.0 |
| Empty integer stack | New stack | isEmpty = true |
| Push and peek | Push 50 | 50 |
| Pop | Pop after push | 50 |
| String stack | Push Hello | Hello |
| Valid registration | Pratyaksh, 90 | Success |
| Empty name | Empty string, 80 | emptyName error |
| Invalid marks | Aman, 120 | invalidMarks error |

## Project Structure

```text
lab-practical-assessment/
├── main.swift
└── README.md
```

## How to Run

Compile:

```bash
swiftc main.swift -o Assessment
```

Run:

```bash
./Assessment
```

## Conclusion

This assessment demonstrates the application of Swift fundamentals through a practical gradebook, reusable generic data structure, safe memory management, and explicit error handling.
