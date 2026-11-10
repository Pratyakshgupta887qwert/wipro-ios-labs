import Foundation
let studentName: String = "Pratyaksh Gupta"
let rollNumber: Int = 1
let subjects: [String] = ["math","physics","chemistry","computer","english"]
var marks:[Int] = []
print("student name: \(studentName)")
print("roll number:\(rollNumber)")
for subject in subjects{
    print ("enter marks for \(subject)(0-100):",terminator:" ")

    guard let input = readLine(),
    let mark = Int(input) else{
        print("put valid value")
        exit(1)
    }
    guard mark>=0 && mark<=100 else{
        print("marks should be inbetween 0 and 100")
        exit(1)
    }
    marks.append(mark)
}
print("enter attendance percetage (0-100):",terminator:" ")
guard let attendanceInput = readLine(),
let attendance = Double(attendanceInput),
attendance.isFinite,
attendance >= 0 && attendance <= 100 else {
    print("Invalid attendance percentage.")
    exit(1)
} 

//calculation 
let totalMarks = marks.reduce(0, +)
let maximumMarks = 500
let average = Double(totalMarks) / Double(marks.count)
let percentage = (Double(totalMarks) / Double(maximumMarks)) * 100

//operators
let a = 20
let b = 10

print("\nArithmetic Operators:")
print("Addition: \(a + b)")
print("Subtraction: \(a - b)")
print("Multiplication: \(a * b)")
print("Division: \(a / b)")
print("Remainder: \(a % b)")

print("\nComparison Operators:")
print("a == b: \(a == b)")
print("a != b: \(a != b)")
print("a > b: \(a > b)")
print("a < b: \(a < b)")

print("\nLogical Operators:")
let hasPassedMarks = marks.allSatisfy { $0 >= 35 }
let hasRequiredAttendance = attendance >= 75
print("AND: \(hasPassedMarks && hasRequiredAttendance)")
print("OR: \(hasPassedMarks || hasRequiredAttendance)")
print("NOT: \(!hasPassedMarks)")

print("\n Compound Assignment Operators")
var bonusMarks = 10

bonusMarks += 5
print("\nCompound Assignment (+=): \(bonusMarks)")

bonusMarks -= 3
print("Compound Assignment (-=): \(bonusMarks)")

print("Nil-Coalescing Operator")
let optionalNickname: String? = nil
let displayName = optionalNickname ?? studentName
print("Display Name: \(displayName)")

//pass and fail
func calculateGrade(_ percentage: Double) -> String {
    switch percentage {
    case 90...100:
        return "A+"
    case 80..<90:
        return "A"
    case 70..<80:
        return "B"
    case 60..<70:
        return "C"
    case 50..<60:
        return "D"
    default:
        return "F"
    }
}

let isPassed: Bool
if hasPassedMarks && hasRequiredAttendance {
    isPassed = true
} else {
    isPassed = false
}
let grade = calculateGrade(percentage)

//result
print("Student Name: \(studentName)")
print("Roll Number: \(rollNumber)")

print("\nSubject-wise Marks:")

for index in 0..<subjects.count {
    print("\(subjects[index]): \(marks[index])/100")
}

print("\nTotal Marks: \(totalMarks)/\(maximumMarks)")
print(String(format: "Average: %.2f", average))
print(String(format: "Percentage: %.2f%%", percentage))
print(String(format: "Attendance: %.2f%%", attendance))

print("\nResult: \(isPassed ? "PASS" : "FAIL")")
print("Grade: \(grade)")

print("====================================")

if !hasPassedMarks {
    print("Reason: One or more subjects have marks below 35.")
}

if !hasRequiredAttendance {
    print("Reason: Attendance is below 75%.")
}