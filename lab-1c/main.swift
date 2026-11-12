import Foundation
var courses = ["swift","java","python","javascript"]
print("courses:  \(courses)")
//add course
courses.append("c#")
print("courses after adding:  \(courses)")

//imp
//remove course
if let index = courses.firstIndex(of: "java") {
    courses.remove(at: index)
}
print("courses after removing: \(courses)")

//sort
courses.sort()
print("courses after sort: \(courses)")

//filter
let filteredCourses = courses.filter {
    $0.localizedCaseInsensitiveContains("a")
}
print("Courses containing 'a': \(filteredCourses)")


//search
let searchCourse = "Swift"
if courses.contains(searchCourse) {
    print("\(searchCourse) course found!")
} else {
    print("\(searchCourse) course not found!")
}

//set
let studentid = [101, 102, 103, 101, 104, 102, 105, 103]

let uniquecount = Set(studentid)
print("unique students id : \(uniquecount.sorted())")
print("unique count : \(uniquecount.count)")

//dictonary
let studentMarks: [Int: Int] = [
    101: 85,
    102: 92,
    103: 76,
    104: 95,
    105: 68
]
for student in studentMarks.sorted(by: { $0.key < $1.key }) {
    print("Student ID: \(student.key), Marks: \(student.value)")
}

//topper
if let topper = studentMarks.max(by: { $0.value < $1.value }) {
    print("\nTopper:")
    print("Student ID: \(topper.key), Marks: \(topper.value)")
}
//below threshold : let threshold is 80
let threshold = 80
let belowThreshold = studentMarks.filter {
    $0.value < threshold
}
print("Below threshold:")
for student in belowThreshold.sorted(by: { $0.key < $1.key }) {
    print("Student ID: \(student.key), Marks: \(student.value)")
}


//task enum
enum TaskPriority {
    case low
    case medium
    case high
    case urgent
}

// Create a priority
let priority = TaskPriority.urgent
// Switch to display a user-friendly label
switch priority {
case .low:
    print("Priority: Low - Can be completed later.")

case .medium:
    print("Priority: Medium - Complete it soon.")

case .high:
    print("Priority: High - Give it attention.")

case .urgent:
    print("Priority: Urgent - Complete it immediately.")
}
