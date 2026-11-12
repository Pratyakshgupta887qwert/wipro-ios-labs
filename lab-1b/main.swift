import Foundation
// Create a bank account
guard var bankAccount = BankAccount(
    accountHolder: "Pratyaksh Gupta",
    openingBalance: 102300
) else {
    print("Account creation failed!")
    exit(1)
}
print("Account created successfully!")
// Deposit
bankAccount.deposit(2000)

// Withdraw
bankAccount.withdraw(1000)

// Final balance
print("\n--- Account Details ---")
print("Account holder: \(bankAccount.accountHolder)")
print("Account type: \(bankAccount.accountType())")
print("Current balance: ₹\(bankAccount.getBalance())")

// Transaction history
print("\n--- Transaction History ---")
for transaction in bankAccount.transactionHistory {
    print(transaction)
}
