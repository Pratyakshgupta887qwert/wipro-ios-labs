import Foundation
// MARK: Task 1 - Gradebook
struct Student {
    let id: Int
    let name: String
    let marks: [Int]
    // Calculate average marks
    var average: Double? {
        if marks.isEmpty {
            return nil
        }
        let total = marks.reduce(0, +)
        return Double(total) / Double(marks.count)
    }
}
// Dictionary to store student details
var gradebook: [Int: Student] = [
    101: Student(id: 101, name: "Aman", marks: [85, 90, 88]),
    102: Student(id: 102, name: "Priya", marks: [92, 95, 89]),
    103: Student(id: 103, name: "Rohan", marks: [70, 75, 80]),
    104: Student(id: 104, name: "Neha", marks: [88, 91, 94])
]
// Search student using ID
func findStudent(id: Int) -> Student? {
    return gradebook[id]
}
// Display all students
func showStudents() {
    print("\n----- Student Gradebook -----")

    for id in gradebook.keys.sorted() {
        if let student = gradebook[id] {
            print("ID: \(student.id)")
            print("Name: \(student.name)")
            print("Marks: \(student.marks)")

            if let avg = student.average {
                print("Average Marks: \(String(format: "%.2f", avg))")
            } else {
                print("Marks are not available")
            }

            print("----------------------")
        }
    }
}
print("========== TASK 1: GRADEBOOK ==========")
if let student = findStudent(id: 101) {
    print("Student found: \(student.name)")
} else {
    print("Student not found")
}
if let student = findStudent(id: 999) {
    print(student.name)
} else {
    print("No student found with this ID")
}
showStudents()
// MARK: Task 2 - Generic Stack
struct Stack<T> {
    var items: [T] = []
    // Add item to stack
    mutating func push(_ item: T) {
        items.append(item)
    }
    // Remove last item
    mutating func pop() -> T? {
        return items.popLast()
    }
    // Get the last item
    func peek() -> T? {
        return items.last
    }
    // Check whether stack is empty
    var isEmpty: Bool {
        return items.isEmpty
    }
}
print("\n========== TASK 2: GENERIC STACK ==========")
// Stack with integers
var numberStack = Stack<Int>()
numberStack.push(10)
numberStack.push(20)
numberStack.push(30)
print("Integer Stack:")
print("Top element: \(numberStack.peek() ?? 0)")
print("Removed element: \(numberStack.pop() ?? 0)")
print("After removing: \(numberStack.peek() ?? 0)")
// Stack with strings
var nameStack = Stack<String>()
nameStack.push("Swift")
nameStack.push("iOS")
nameStack.push("Programming")
print("\nString Stack:")
print("Top element: \(nameStack.peek() ?? "Empty")")
print("Removed element: \(nameStack.pop() ?? "Empty")")
print("After removing: \(nameStack.peek() ?? "Empty")")
// MARK: Task 3 - Retain Cycle
class StudentManager {
    let name: String

    var completion: (() -> Void)?

    init(name: String) {
        self.name = name
        print("\(name) object created")
    }

    func startTask() {

        // Weak self is used to avoid retain cycle
        completion = { [weak self] in

            guard let self = self else {
                print("Object is no longer available")
                return
            }

            print("Task completed by \(self.name)")
        }
    }

    deinit {
        print("\(name) object removed from memory")
    }
}

print("\n========== TASK 3: RETAIN CYCLE ==========")

do {
    var manager: StudentManager? = StudentManager(name: "Student Manager")

    manager?.startTask()

    manager?.completion?()

    // Setting nil releases the object
    manager = nil
}

print("Retain cycle example completed")

// Explanation:
// If we use self directly inside the closure, it can create a
// strong reference cycle because the class stores the closure.
// Using [weak self] prevents the closure from strongly holding
// the class object. So ARC can release the object properly.


// MARK: Task 4 - Error Handling

enum StudentError: Error {
    case emptyName
    case invalidMarks
}

// Function to check student details
func validateStudent(name: String, marks: Int) throws -> String {

    if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
        throw StudentError.emptyName
    }

    if marks < 0 || marks > 100 {
        throw StudentError.invalidMarks
    }

    return "\(name) registered successfully with \(marks) marks"
}

// Handle errors
func registerStudent(name: String, marks: Int) {

    do {
        let message = try validateStudent(name: name, marks: marks)
        print("Success: \(message)")

    } catch StudentError.emptyName {
        print("Error: Name cannot be empty")

    } catch StudentError.invalidMarks {
        print("Error: Marks should be between 0 and 100")

    } catch {
        print("Something went wrong")
    }
}

print("\n========== TASK 4: ERROR HANDLING ==========")

registerStudent(name: "Pratyaksh", marks: 90)
registerStudent(name: "", marks: 80)
registerStudent(name: "Aman", marks: 120)


// MARK: Task 5 - Viva Questions

print("\n========== TASK 5: VIVA ==========")

print("""
1. Struct vs Class:
   Struct is a value type, so when we copy it, a separate copy is made.
   Class is a reference type, so two variables can refer to the same object.
   Classes also support inheritance and deinit.

2. Protocol vs Inheritance:
   Protocol defines methods or properties that a type must implement.
   Inheritance allows one class to use the properties and methods of another class.
   A class can follow multiple protocols but can have only one direct parent class.

3. Map, Filter and Reduce:
   map is used to change each element of an array.
   filter is used to select elements based on a condition.
   reduce is used to combine all elements into one value.
""")


// MARK: Additional Tests

print("\n========== TESTING ==========")

// Gradebook tests
assert(findStudent(id: 101)?.name == "Aman")
assert(findStudent(id: 999) == nil)
assert(findStudent(id: 102)?.average == 92.0)

// Integer stack tests
var testStack = Stack<Int>()

assert(testStack.isEmpty == true)

testStack.push(50)
assert(testStack.peek() == 50)
assert(testStack.pop() == 50)
assert(testStack.isEmpty == true)

// String stack test
var testNames = Stack<String>()
testNames.push("Hello")

assert(testNames.peek() == "Hello")

// Valid student test
do {
    _ = try validateStudent(name: "Rahul", marks: 85)
} catch {
    assertionFailure("Valid student test failed")
}

// Empty name test
do {
    _ = try validateStudent(name: "", marks: 80)
    assertionFailure("Empty name should give an error")
} catch StudentError.emptyName {
    print("Empty name test passed")
} catch {
    assertionFailure("Wrong error")
}

// Invalid marks test
do {
    _ = try validateStudent(name: "Neha", marks: 120)
    assertionFailure("Invalid marks should give an error")
} catch StudentError.invalidMarks {
    print("Invalid marks test passed")
} catch {
    assertionFailure("Wrong error")
}

print("All tests passed successfully!")
print("\n========== LAB COMPLETED ==========")
