
# Lab 2D – Error Handling in Swift

## Objective

Model failures explicitly and handle them safely using Swift error-handling mechanisms.

## Tasks Completed

### Task 1: ValidationError Enum

Created an enum named `ValidationError` conforming to Swift's `Error` protocol.

It contains three cases:

- `emptyName` – Student name cannot be empty.
- `invalidMark` – Marks must be between 0 and 100.
- `invalidID` – Student ID must be greater than zero.

### Task 2: Throwing Registration Function

Implemented:

`registerStudent(id:name:marks:) throws -> Student`

The function validates student information and throws the appropriate validation error when input is invalid.

If all validations pass, it returns a Student object.

### Task 3: do-catch Error Handling

Used `do-catch` to handle registration errors.

Each validation error has a separate catch block with a user-friendly message.

Unexpected errors are also handled using a general catch
