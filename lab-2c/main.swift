import Foundation
// 1: Protocol and Conformance
protocol Displayable {
    var displayInfo: String { get }
}
struct Student: Displayable {
    let name: String
    let marks: Int

    var displayInfo: String {
        return "Student: \(name), Marks: \(marks)"
    }
}
struct Course: Displayable {
    let title: String
    let credits: Int

    var displayInfo: String {
        return "Course: \(title), Credits: \(credits)"
    }
}
let student = Student(name: "Pratyaksh", marks: 90)
let course = Course(title: "Swift Programming", credits: 4)
print(student.displayInfo)
print(course.displayInfo)
//2: Extensions
extension String {
    var isNotEmpty: Bool {
        return !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    func wordCount() -> Int {
        return self.split(separator: " ").count
    }
}
let message = "Learning Swift is interesting"
print("Message: \(message)")
print("Is not empty: \(message.isNotEmpty)")
print("Word count: \(message.wordCount())")
//3: Generic Stack<T>
struct Stack<T> {
    private var elements: [T] = []
    // Push an element onto the stack.
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.popLast()
    }
    func peek() -> T? {
        return elements.last
    }
    var isEmpty: Bool {
        return elements.isEmpty
    }
}
var numberStack = Stack<Int>()
print("Initially empty: \(numberStack.isEmpty)")
numberStack.push(10)
numberStack.push(20)
numberStack.push(30)
print("Top element: \(numberStack.peek() ?? -1)")
print("Popped element: \(numberStack.pop() ?? -1)")
print("New top element: \(numberStack.peek() ?? -1)")
print("Is empty: \(numberStack.isEmpty)")
//4: Protocol-Constrained Generic Function
// This function accepts only types conforming to Displayable.
func printDisplayInfo<T: Displayable>(_ item: T) {
    print(item.displayInfo)
}
// Valid use: Student and Course conform to Displayable.
printDisplayInfo(student)
printDisplayInfo(course)
// Invalid use example:
// let number = 100
// printDisplayInfo(number)
//
// This would cause a compile-time error because Int
// does not conform to Displayable.
// MARK: - Task 5: Why Extensions Cannot Replace New Types
print("""
Extensions are useful for adding computed properties,
methods, initializers, and protocol conformance to existing types.

However, extensions cannot add stored properties to an existing type.

If an application needs new stored state, a new struct or class
should be created instead of trying to use an extension.

For example:
- String extension adds useful functionality.
- Student struct stores name and marks.
""")


// MARK: - Optional Extension: Stack Protocol

// A small custom protocol for stack operations.
protocol StackOperations {
    associatedtype Element

    mutating func push(_ element: Element)
    mutating func pop() -> Element?
    func peek() -> Element?
    var isEmpty: Bool { get }
}

// Make the generic Stack conform to StackOperations.
extension Stack: StackOperations {}

// optional : Test with Int.
var intStack = Stack<Int>()
intStack.push(100)
intStack.push(200)

print("Integer stack top: \(intStack.peek() ?? -1)")

// Test with String.
var stringStack = Stack<String>()
stringStack.push("Swift")
stringStack.push("Generics")

print("String stack top: \(stringStack.peek() ?? "Empty")")
// MARK: - Assertions: Test Cases
// Test 1: Student display information.
assert(student.displayInfo == "Student: Pratyaksh, Marks: 90")
// Test 2: Course display information.
assert(course.displayInfo == "Course: Swift Programming, Credits: 4")
// Test 3: String extension.
assert(message.isNotEmpty == true)
// Test 4: String word count.
assert(message.wordCount() == 4)
// Test 5: Empty String.
assert("   ".isNotEmpty == false)
// Test 6: Stack push and peek.
var testStack = Stack<Int>()
testStack.push(10)
assert(testStack.peek() == 10)
// Test 7: Stack pop.
assert(testStack.pop() == 10)
// Test 8: Stack empty check.
assert(testStack.isEmpty == true)
// Test 9: String Stack.
var testStringStack = Stack<String>()
testStringStack.push("Hello")
assert(testStringStack.peek() == "Hello")
// Test 10: Protocol-constrained generic function can accept Student.
printDisplayInfo(student)
