import Foundation
let studentMarks : [Int: Int] = [
    101: 85,
    102: 92,
    103: 76,
    104: 95,
    105: 68
]
//function that return optional marks
func findStudentMarks(studentID: Int) -> Int? {
    return studentMarks[studentID]
}
let searchID = 102
if let marks = findStudentMarks(studentID: searchID) {
    print("Student ID: \(searchID)")
    print("Marks: \(marks)")
} else {
    print("Student not found!")
}

//if let
let studentName: String? = "Pratyaksh"
if let name = studentName {
    print("Student name: \(name)")
} else {
    print("Student name is missing.")
}

//guard let
func displayStudentName(_ name: String?) {
    guard let validName = name else {
        print("Name is unavailable.")
        return
    }
    print("Welcome, \(validName)!")
}

displayStudentName("Pratyaksh")
displayStudentName(nil)

//optional chaining
struct Student {
    let name: String
    let email: String?
}
let student = Student(
    name: "Pratyaksh",
    email: "pratyaksh@example.com"
)
let emailLength = student.email?.count
if let length = emailLength {
    print("Email length: \(length)")
} else {
    print("Email is unavailable.")
}

// nil-coalescing operator
let department: String? = nil
let departmentName = department ?? "Department not assigned"
print("Department: \(departmentName)")

//missing value
let missingStudentID = 999
if let marks = findStudentMarks(studentID: missingStudentID) {
    print("Marks: \(marks)")
} else {
    print("No student found with ID \(missingStudentID).")
}

//handle empty text
let enteredName = "   "
let cleanedName = enteredName.trimmingCharacters(
    in: .whitespacesAndNewlines
)
if cleanedName.isEmpty {
    print("Error: Student name cannot be empty.")
} else {
    print("Student name: \(cleanedName)")
}

// Safe optional handling
let optionalAge: Int? = 21
if let age = optionalAge {
    print("Age: \(age)")
} else {
    print("Age is not available.")
}


// Nil-coalescing instead of force unwrapping
let optionalCity: String? = nil
let city = optionalCity ?? "City not provided"
print("City: \(city)")
print("No force unwrapping (!) is used in this program.")


//optional
struct Profile {
    let name: String
    let address: String?
    let phone: String?

    func displayProfile() {
        print("Name: \(name)")
        print("Address: \(address ?? "Not provided")")
        print("Phone: \(phone ?? "Not provided")")
    }
}

// create a profile with optional details
let profile = Profile(
    name: "Pratyaksh Gupta",
    address: nil,
    phone: "9876543210"
)

profile.displayProfile()