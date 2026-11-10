
# Swift Lab-1: Basics, Variables, Types, and Operators

## Objective

To understand Swift's type system, variables, constants, operators,
conditional statements, and input validation through a
Student Grade Calculator.

## Project Overview

This is a command-line Swift application that accepts student
information, five subject marks, and attendance percentage.

It calculates total marks, average, percentage, pass/fail status,
and grade.

## Concepts Covered

### 1. Variables and Constants
- let: Immutable student details and calculated values.
- var: Mutable marks array and operator demonstration variable.

### 2. Data Types
- String: Student name and subject names.
- Int: Roll number and subject marks.
- Double: Attendance, average, and percentage.
- Bool: Pass/fail conditions.
- String?: Optional nickname.

### 3. Operators
- Arithmetic: +, -, *, /, %
- Comparison: ==, !=, >, <
- Logical: &&, ||, !
- Compound assignment: +=, -=
- Nil-coalescing: ??

### 4. Conditional Statements
- if/else for pass/fail calculation.
- switch for grade assignment.

### 5. Input Validation
- Marks range: 0-100.
- Attendance range: 0-100.
- Minimum subject passing marks: 35.
- Minimum attendance: 75%.

## Grade Criteria

| Percentage | Grade |
|---|---|
| 90-100 | A+ |
| 80-89.99 | A |
| 70-79.99 | B |
| 60-69.99 | C |
| 50-59.99 | D |
| Below 50 | F |

## How to Run

Make sure Swift is installed in your GitHub Codespace.

```bash
swift --version
```

Run the application:

```bash
swift main.swift
```

Alternatively, compile and execute:

```bash
swiftc main.swift -o Lab1
./Lab1
```

## Project Structure

```text
Swift-Lab-1/
├── main.swift
├── test-cases.md
└── README.md
```

## Learning Outcome

This assignment demonstrates the fundamentals of Swift programming,
including type safety, input handling, operators, conditional
logic, functions, and validation.

## Author

Pratyaksh Gupta

Swift Lab-1a: Swift Basics, Variables, Types, and Operators
