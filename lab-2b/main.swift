import Foundation
struct Student {
    let name: String
    let marks: Int
}
let students = [
    Student(name: "Rohan", marks: 85),
    Student(name: "Aman", marks: 92),
    Student(name: "Priya", marks: 85),
    Student(name: "Karan", marks: 78),
    Student(name: "Neha", marks: 92)
]

// Closure sorts students by marks (highest first).
// If marks are equal, names are sorted alphabetically.
let sortedStudents = students.sorted { firstStudent, secondStudent in
    if firstStudent.marks != secondStudent.marks {
        return firstStudent.marks > secondStudent.marks
    }
    return firstStudent.name < secondStudent.name
}
//task1
for student in sortedStudents {
    print("\(student.name): \(student.marks)")
}
//Task 2: Completion Closure

// This function accepts a closure as a parameter.
// The completion closure is called after the simulated operation.
func performOperation(
    operationName: String,
    completion: (String) -> Void
) {
    print("\nStarting \(operationName)...")

    // Simulating an operation
    print("\(operationName) is in progress...")

    // Calling the completion closure after the operation.
    completion("\(operationName) completed successfully!")
}

performOperation(operationName: "Data Download") { message in
    print(message)
}
// MARK: - Task 3: Trailing Closure and Shorthand Arguments
let numbers = [1, 2, 3, 4, 5]

// Trailing closure with shorthand argument name $0.
let doubledNumbers = numbers.map {
    $0 * 2
}
print("\n========== TASK 3: TRAILING CLOSURE ==========")
print("Original numbers: \(numbers)")
print("Doubled numbers using shorthand: \(doubledNumbers)")

// Same example rewritten using explicit parameter names.
let tripledNumbers = numbers.map { number in
    number * 3
}
print("Tripled numbers using explicit name: \(tripledNumbers)")
//Task 4: Counter Closure and Captured State

func createCounter() -> () -> Int {
    // The closure captures this variable from its surrounding scope.
    // The captured value remains available between function calls.
    var count = 0
    let counterClosure = {
        count += 1
        return count
    }

    return counterClosure
}

let counter = createCounter()

print("Counter: \(counter())")
print("Counter: \(counter())")
print("Counter: \(counter())")
print("Counter: \(counter())")

// Each call modifies the same captured variable.
// MARK: - Task 5: Avoid Retain Cycles Using Weak Self

class DataManager {

    let managerName: String

    // The object stores a closure.
    var completionHandler: (() -> Void)?

    init(managerName: String) {
        self.managerName = managerName
        print("\(managerName) initialized.")
    }
    func startTask() {

        // [weak self] prevents the closure from strongly retaining
        // the DataManager instance.
        completionHandler = { [weak self] in

            // Safely unwrap self because it may no longer exist.
            guard let self = self else {
                print("DataManager no longer exists.")
                return
            }
            print("Task completed by \(self.managerName).")
        }
    }
    deinit {
        print("\(managerName) deinitialized.")
    }
}
print("\n========== TASK 5: WEAK SELF ==========")
do {
    var manager: DataManager? = DataManager(managerName: "Student Data Manager")
    manager?.startTask()
    // Calling the stored completion closure.
    manager?.completionHandler?()
    // Releasing the object.
    manager = nil
}
print("DataManager scope finished.")
// MARK: - Optional Extension: Retry Helper

// Accepts an operation closure and retries it up to maxAttempts.
// The operation returns true for success and false for failure.
func retryOperation(
    maxAttempts: Int,
    operation: () -> Bool
) -> Bool {

    guard maxAttempts > 0 else {
        print("Maximum attempts must be greater than zero.")
        return false
    }

    for attempt in 1...maxAttempts {

        print("Attempt \(attempt) of \(maxAttempts)")

        if operation() {
            print("Operation succeeded!")
            return true
        }

        print("Operation failed.")
    }

    print("All attempts exhausted.")
    return false
}
var attemptCount = 0
let retryResult = retryOperation(maxAttempts: 3) {
    attemptCount += 1

    // Simulate failure twice and success on the third attempt.
    return attemptCount == 3
}
print("Final result: \(retryResult)")
