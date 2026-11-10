
# Swift Lab-1b: Access Control and Encapsulation

## Objective

To understand Swift access control mechanisms and implement encapsulation by protecting model data from unauthorized or invalid modifications.

## Project Overview

This project implements a **Bank Account Management System** using Swift.

It demonstrates how access control modifiers protect sensitive data and expose only the operations required by external users.

The application allows users to:
- Create a bank account with initial balance validation.
- Deposit money into an account.
- Withdraw money from an account.
- Check the current account balance.
- View transaction history.
- Prevent invalid financial operations.

## Tasks Implemented

### 1. BankAccount Implementation

Created a `BankAccount` structure with:
- Private account balance.
- Public deposit method.
- Public withdrawal method.
- Public method to retrieve the current balance.
- Account holder information.

### 2. Input Validation

Implemented validation to reject:
- Zero or negative deposits.
- Zero or negative withdrawals.
- Withdrawals exceeding the available balance.
- Empty or invalid account holder names.
- Negative or non-finite opening balances.
- Non-finite transaction amounts.

### 3. Swift Access Control Modifiers

Demonstrated all four required access modifiers.

| Access Modifier | Implementation | Accessibility |
|---|---|---|
| `private` | Account balance | Within the enclosing declaration and permitted same-file extensions |
| `fileprivate` | Transaction formatting function | Within the same Swift file |
| `internal` | Account type method | Throughout the current module |
| `public` | BankAccount structure and public methods | Accessible to other modules through the public API |

### 4. Encapsulation

The account balance is not directly accessible or writable by external callers.

All balance modifications must happen through the `deposit()` and `withdraw()` methods.

This ensures that account operations follow predefined validation rules.

### 5. Optional Extension: Transaction History

Implemented transaction history using:

```swift
public private(set) var transactionHistory: [String] = []
```

Features:
- Records account creation.
- Records successful deposits.
- Records successful withdrawals.
- Allows external callers to read transaction history.
- Prevents external callers from directly modifying transaction history.

## Project Structure

```text
lab-1b/
│
├── BankAccount.swift
├── main.swift
└── README.md
```

### File Description

**BankAccount.swift**
- Defines the BankAccount structure.
- Implements private balance management.
- Provides public deposit and withdrawal operations.
- Implements account validation.
- Maintains transaction history.
- Demonstrates private, fileprivate, internal, and public access.

**main.swift**
- Creates a bank account.
- Tests deposit and withdrawal operations.
- Demonstrates invalid transaction handling.
- Displays account details and transaction history.

## Technologies Used

- **Language:** Swift
- **Editor:** Visual Studio Code
- **Environment:** GitHub Codespaces
- **Concepts:** Structures, Access Control, Encapsulation, Initializers, Functions, Validation and Collections.

## How to Run

Make sure Swift is installed in your development environment.

Check the Swift installation:

```bash
swift --version
```

Navigate to the project directory:

```bash
cd lab-1b
```

Compile both Swift files:

```bash
swiftc BankAccount.swift main.swift -o BankLab
```

Run the executable:

```bash
./BankLab
```

Alternatively, run using the Swift interpreter:

```bash
swift BankAccount.swift main.swift
```

## Sample Operations

| Operation | Amount | Expected Result |
|---|---:|---|
| Create account | ₹10,000 | Successful |
| Deposit | ₹2,000 | Successful |
| Deposit | ₹0 | Rejected |
| Deposit | -₹500 | Rejected |
| Withdraw | ₹1,000 | Successful |
| Withdraw | ₹50,000 | Insufficient balance |
| Withdraw | ₹0 | Rejected |

## Expected Account Balance

Initial Balance: ₹10,000

After Deposit: ₹12,000

After Withdrawal: ₹11,000

Final Balance: ₹11,000

## Learning Outcomes

After completing this assignment, the following concepts were understood:

1. Importance of encapsulation in object-oriented programming.
2. Difference between private, fileprivate, internal and public access levels.
3. Protecting sensitive properties from direct modification.
4. Implementing controlled access through public methods.
5. Using initializers to validate object creation.
6. Implementing read-only properties using `private(set)`.
7. Maintaining transaction history while protecting its integrity.

## Conclusion

This project demonstrates how Swift access control and encapsulation can be used to build secure and maintainable data models.

By keeping the account balance private and exposing only validated operations, the application prevents unauthorized modifications and maintains data consistency.

---

## Author

**Pratyaksh Gupta**

Swift Lab-1b: Access Control and Encapsulation
