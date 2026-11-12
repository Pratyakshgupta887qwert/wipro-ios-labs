import Foundation
//file-private function
// File-private function
fileprivate func formatTransaction(_ message: String) -> String {
    return "[TRANSACTION] \(message)"
}

//bank account
public struct BankAccount {
    //private property
    private var balance: Double
    //public read only
    public private(set) var transactionHistory: [String] = []
    //public initialization
public init?(accountHolder: String, openingBalance: Double) {
    guard !accountHolder.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
          openingBalance.isFinite,
          openingBalance >= 0 else {
        return nil
    }
    self.accountHolder = accountHolder
    self.balance = openingBalance
    transactionHistory.append(
        formatTransaction("Account created with balance: \(openingBalance)")
    )
}
    //public property
    public let accountHolder: String
    //deposite : public method
     public mutating func deposit(_ amount: Double) -> Bool {
        guard amount.isFinite && amount > 0 else {
            print("Error: should be greater than zero.")
            return false
        }
        balance += amount
        transactionHistory.append(
            formatTransaction("Deposited: \(amount)")
        )
        print("Successfully deposited: ₹\(amount)")
        return true
    }
    //withdraw : public method
     public mutating func withdraw(_ amount: Double) -> Bool {

        guard amount.isFinite && amount > 0 else {
            print("Error: Withdrawal must be greater than zero.")
            return false
        }
        guard amount <= balance else {
            print("Error: Insufficient account balance.")
            return false
        }
        balance -= amount
        transactionHistory.append(
            formatTransaction("Withdrawn: \(amount)")
        )
        print("Successfully withdrawn: ₹\(amount)")
        return true
    }
    //check balance : public method
    public func getBalance() -> Double{
        return balance
    }
    // acc. type : internal method
    internal func accountType() -> String{
        return "saving account"
    }
    
}