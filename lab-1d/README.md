
# Lab 1D - Optionals and Safe Unwrapping in Swift

## Objective
To understand Swift optionals and safely handle missing or unavailable values without force unwrapping.

## Tasks Completed

### 1. Optional Function
- Created a function `findStudentMarks()`.
- Searches for student marks using student ID.
- Returns an optional integer (`Int?`).
- Handles students that do not exist.

### 2. Optional Handling Techniques

**if let**
- Safely unwraps an optional.
- Executes code when a value exists.

**guard let**
- Safely unwraps an optional.
- Exits the current scope when the value is nil.

**Optional Chaining**
- Safely accesses properties and methods of optional values.
- Returns nil if the optional value is nil.

**Nil-Coalescing Operator (??)**
- Provides a default value when an optional contains nil.

### 3. Missing Values
- Handles missing dictionary keys.
- Checks empty text fields.
- Uses trimming to detect whitespace-only input.
- Displays appropriate error messages.

### 4. Safe Unwrapping
- Uses safe optional handling.
- Avoids force unwrapping with `!`.
- Uses optional binding and default values.

### 5. Optional Extension: Profile Model
Created a Profile structure containing:
- Required name.
- Optional address.
- Optional phone number.

Missing profile details are displayed using default values.

## Project Structure

```text
lab-1d/
├── main.swift
└── README.md
```

## How to Run

Compile:

```bash
swiftc main.swift -o Lab1D
```

Execute:

```bash
./Lab1D
```

## Technologies
- Swift 6.4.2
- GitHub Codespaces

## Learning Outcomes
- Understanding optional types.
- Safely unwrapping optional values.
- Handling missing dictionary values.
- Using optional chaining and nil-coalescing.
- Avoiding runtime crashes caused by force unwrapping.
