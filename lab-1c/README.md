
# Lab 1C - Collections and Enums in Swift

## Objective
To understand and implement Swift collections such as Array, Set, Dictionary, and Enumerations.

## Tasks Completed

### 1. Array
- Created an array of course names.
- Added a new course using `append()`.
- Removed a course using `remove(at:)`.
- Sorted courses using `sort()`.
- Filtered courses using `filter()`.
- Searched for a course using `contains()`.

### 2. Set
- Created a collection of student IDs with duplicates.
- Converted the array into a Set.
- Removed duplicate IDs automatically.
- Displayed the unique student count.

### 3. Dictionary
- Mapped student IDs to their marks.
- Displayed student records.
- Found the student with the highest marks.
- Filtered students scoring below 80.

### 4. Enum
- Created a `TaskPriority` enum.
- Implemented Low, Medium, High, and Urgent priorities.
- Used a switch statement to display meaningful messages.

### 5. Optional Extension
- Created an `APIResult` enum with associated values.
- Implemented success and failure cases.
- Used switch to process the API response.

## When to Use Collections

| Collection | Best Use |
|---|---|
| Array | Ordered data with duplicates |
| Set | Unique data |
| Dictionary | Key-value data mapping |
| Enum | Fixed set of related values |

## Project Structure

```text
lab-1c/
├── main.swift
└── README.md
```

## How to Run

Compile:

```bash
swiftc main.swift -o Lab1C
```

Execute:

```bash
./Lab1C
```

## Technologies
- Swift 6.4.2
- GitHub Codespaces

## Learning Outcomes
- Understanding Swift collections.
- Performing CRUD-like operations on arrays.
- Working with unique data using Sets.
- Managing key-value pairs using Dictionaries.
- Using enums and switch statements.
- Understanding associated values in enums.
