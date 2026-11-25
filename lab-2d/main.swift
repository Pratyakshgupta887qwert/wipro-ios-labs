import Foundation
enum ValidationError: Error {
    case emptyName
    case invalidMark
    case invalidID
}
struct Student {
    let id: Int
    let name: String
    let marks: Int
}
func registerStudent(
    id: Int,
    name: String,
    marks: Int
) throws -> Student {
    // Validate student name.
    guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
        throw ValidationError.emptyName
    }
    // Validate student ID.
    guard id > 0 else {
        throw ValidationError.invalidID
    }
    // Validate marks (0 to 100).
    guard (0...100).contains(marks) else {
        throw ValidationError.invalidMark
    }
    return Student(id: id, name: name, marks: marks)
}
func displayRegistration(
    id: Int,
    name: String,
    marks: Int
) {
    do {
        let student = try registerStudent(
            id: id,
            name: name,
            marks: marks
        )
        print("Registration successful!")
        print("Student ID: \(student.id)")
        print("Student Name: \(student.name)")
        print("Student Marks: \(student.marks)")

    } catch ValidationError.emptyName {
        print("Registration failed: Student name cannot be empty.")

    } catch ValidationError.invalidID {
        print("Registration failed: Student ID must be greater than zero.")

    } catch ValidationError.invalidMark {
        print("Registration failed: Marks must be between 0 and 100.")

    } catch {
        print("Registration failed due to an unexpected error: \(error)")
    }
}
// MARK: - Task 4: Optional Return vs throws vs Result

// Approach 1: Optional return.
// Returns nil if registration data is invalid.
// It does not explain which validation failed.
func registerUsingOptional(
    id: Int,
    name: String,
    marks: Int
) -> Student? {
    guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
          id > 0,
          (0...100).contains(marks) else {
        return nil
    }
    return Student(id: id, name: name, marks: marks)
}
// Approach 2: Result.
// Returns either success with Student or failure with ValidationError.
func registerUsingResult(
    id: Int,
    name: String,
    marks: Int
) -> Result<Student, ValidationError> {

    do {
        let student = try registerStudent(
            id: id,
            name: name,
            marks: marks
        )

        return .success(student)

    } catch let error as ValidationError {
        return .failure(error)

    } catch {
        // This registration function currently throws only ValidationError.
        return .failure(.invalidID)
    }
}

// MARK: - Task 5: Safely Handle Invalid Input

print("\nTest 1: Valid student")
displayRegistration(id: 101, name: "Pratyaksh", marks: 90)

print("\nTest 2: Empty name")
displayRegistration(id: 102, name: "   ", marks: 85)

print("\nTest 3: Invalid ID")
displayRegistration(id: 0, name: "Rahul", marks: 80)

print("\nTest 4: Invalid marks")
displayRegistration(id: 103, name: "Aman", marks: 120)

print("\nTest 5: Negative marks")
displayRegistration(id: 104, name: "Neha", marks: -5)

// Optional example
if let optionalStudent = registerUsingOptional(
    id: 105,
    name: "Rohan",
    marks: 88
) {
    print("Optional: Registered \(optionalStudent.name)")
} else {
    print("Optional: Registration failed.")
}
// Result example
let result = registerUsingResult(
    id: 106,
    name: "Priya",
    marks: 95
)
switch result {
case .success(let student):
    print("Result: Registered \(student.name) successfully.")
case .failure(let error):
    switch error {
    case .emptyName:
        print("Result: Name cannot be empty.")
    case .invalidMark:
        print("Result: Marks must be between 0 and 100.")
    case .invalidID:
        print("Result: Student ID is invalid.")
    }
}
// MARK: - Optional Extension: Simulated Network Response
enum NetworkError: Error {
    case serverUnavailable
    case invalidResponse
}
// Simulates receiving student data from a server.
func fetchStudentFromServer() -> Result<Student, NetworkError> {
    // Simulate a failed network request.
    let serverIsAvailable = false
    guard serverIsAvailable else {
        return .failure(.serverUnavailable)
    }
    return .success(
        Student(id: 107, name: "Karan", marks: 89)
    )
}
// Convert technical errors into user-friendly messages.
func networkErrorMessage(for error: NetworkError) -> String {
    switch error {
    case .serverUnavailable:
        return "The server is currently unavailable. Please try again later."

    case .invalidResponse:
        return "We received an invalid response. Please try again."
    }
}
let networkResult = fetchStudentFromServer()

switch networkResult {
case .success(let student):
    print("Network request successful: \(student.name)")

case .failure(let error):
    print(networkErrorMessage(for: error))
}
// MARK: - Test Assertions
// Test 1: Valid registration.
assert(registerUsingOptional(id: 1, name: "Aman", marks: 90) != nil)
// Test 2: Empty name should fail.
assert(registerUsingOptional(id: 2, name: "", marks: 90) == nil)
// Test 3: Invalid ID should fail.
assert(registerUsingOptional(id: 0, name: "Rohan", marks: 90) == nil)
// Test 4: Marks above 100 should fail.
assert(registerUsingOptional(id: 3, name: "Neha", marks: 110) == nil)
// Test 5: Negative marks should fail.
assert(registerUsingOptional(id: 4, name: "Priya", marks: -1) == nil)
// Test 6: Valid Result should succeed.
let validResult = registerUsingResult(id: 5, name: "Karan", marks: 80)
if case .success = validResult {
    print("Valid Result test passed.")
} else {
    assertionFailure("Expected successful registration.")
}
// Test 7: Invalid Result should fail with emptyName.
let invalidResult = registerUsingResult(id: 6, name: " ", marks: 80)

if case .failure(.emptyName) = invalidResult {
    print("Empty name Result test passed.")
} else {
    assertionFailure("Expected emptyName error.")
}
// Test 8: Throwing function should report invalid marks.
do {
    _ = try registerStudent(id: 7, name: "Test", marks: 150)
    assertionFailure("Expected invalidMark error.")
} catch ValidationError.invalidMark {
    print("Invalid marks throwing test passed.")
} catch {
    assertionFailure("Unexpected error.")
}
