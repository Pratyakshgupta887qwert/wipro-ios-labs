import Foundation
// Calculate the mean of an array of numbers
func calculateMean(of numbers: [Double]) -> Double? {
    guard !numbers.isEmpty else {
        return nil
    }
    let total = numbers.reduce(0, +)
    return total / Double(numbers.count)
}
// Find the maximum value in an array
func findMaximum(in numbers: [Int]) -> Int? {
    return numbers.max()
}
// Validate an email-like input
func isValidEmail(_ email: String) -> Bool {
    let components = email.split(separator: "@")

    guard components.count == 2,
          !components[0].isEmpty,
          !components[1].isEmpty,
          components[1].contains("."),
          !email.contains(" ") else {
        return false
    }

    return true
}
// Format a person's display name
func formatDisplayName(firstName: String, lastName: String) -> String {
    let first = firstName.trimmingCharacters(in: .whitespacesAndNewlines)
    let last = lastName.trimmingCharacters(in: .whitespacesAndNewlines)

    return "\(first) \(last)".trimmingCharacters(in: .whitespacesAndNewlines)
}
// MARK: - Task 2: Higher-Order Functions
struct Transaction {
    let title: String
    let amount: Double
    let category: String
    let type: String
}

let transactions = [
    Transaction(title: "Salary", amount: 30000, category: "Income", type: "income"),
    Transaction(title: "Groceries", amount: 2500, category: "Food", type: "expense"),
    Transaction(title: "Transport", amount: 800, category: "Travel", type: "expense"),
    Transaction(title: "Freelance", amount: 5000, category: "Income", type: "income"),
    Transaction(title: "Shopping", amount: 1500, category: "Lifestyle", type: "expense"),
    Transaction(title: "Electricity", amount: 1200, category: "Bills", type: "expense")
]

// Filter: Select only expenses
let expenses = transactions.filter { $0.type == "expense" }

// Map: Transform expenses into readable descriptions
let expenseDescriptions = expenses.map {
    "\($0.title): ₹\(String(format: "%.2f", $0.amount))"
}

// Reduce: Calculate total expenses
let totalExpenses = expenses.reduce(0.0) { total, transaction in
    total + transaction.amount
}

// MARK: - Task 3: Sort Students by Marks and Name

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

// Higher marks first; alphabetical name order when marks are equal
let sortedStudents = students.sorted {
    if $0.marks != $1.marks {
        return $0.marks > $1.marks
    }

    return $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending
}

// MARK: - Task 4: Loop-Based vs Higher-Order Functions

// Loop-based calculation of total expenses
func calculateExpensesUsingLoop(from transactions: [Transaction]) -> Double {
    var total = 0.0

    for transaction in transactions {
        if transaction.type == "expense" {
            total += transaction.amount
        }
    }

    return total
}

// Higher-order function calculation
func calculateExpensesUsingHOF(from transactions: [Transaction]) -> Double {
    return transactions
        .filter { $0.type == "expense" }
        .reduce(0.0) { $0 + $1.amount }
}

// MARK: - Optional Extension: Spending by Category

let spendingByCategory = Dictionary(
    grouping: expenses,
    by: { $0.category }
).mapValues { categoryTransactions in
    categoryTransactions.reduce(0.0) { $0 + $1.amount }
}

// MARK: - Test Results
print("TASK 1: REUSABLE FUNCTIONS")

let marks = [75.0, 80.0, 90.0, 85.0]

if let mean = calculateMean(of: marks) {
    print("Mean of marks: \(mean)")
} else {
    print("Mean cannot be calculated for an empty array.")
}

print("Maximum number: \(findMaximum(in: [10, 50, 30, 90, 20]) ?? 0)")
print("Valid email: \(isValidEmail("student@example.com"))")
print("Invalid email: \(isValidEmail("studentexample.com"))")
print("Display name: \(formatDisplayName(firstName: "Pratyaksh", lastName: "Gupta"))")

print("\nTASK 2: FILTER, MAP AND REDUCE")

print("Expenses:")
for description in expenseDescriptions {
    print("- \(description)")
}

print("Total expenses: ₹\(String(format: "%.2f", totalExpenses))")

print("\nTASK 3: SORTED STUDENTS")

for (index, student) in sortedStudents.enumerated() {
    print("\(index + 1). \(student.name) - \(student.marks) marks")
}

print("\nTASK 4: LOOP VS HIGHER-ORDER FUNCTIONS")

let loopTotal = calculateExpensesUsingLoop(from: transactions)
let hofTotal = calculateExpensesUsingHOF(from: transactions)

print("Loop-based total: ₹\(loopTotal)")
print("Higher-order total: ₹\(hofTotal)")
print("Both approaches produce the same result: \(loopTotal == hofTotal)")

print("\nTASK 5: FUNCTION PARAMETERS AND RETURN TYPES")
print("Functions use descriptive parameter labels and explicit return types.")

print("\nOPTIONAL EXTENSION: SPENDING BY CATEGORY")

for category in spendingByCategory.keys.sorted() {
    if let amount = spendingByCategory[category] {
        print("\(category): ₹\(String(format: "%.2f", amount))")
    }
}
