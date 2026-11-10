
# Swift Lab-1b: Access Control and Encapsulation

## Objective

To understand Swift access control and encapsulation by
implementing a Bank Account Management System.

## Project Structure

```text
lab-1b/
├── BankAccount.swift
├── main.swift
└── ACCESS-CONTROL.md
```

## Access Modifiers

### 1. Private

The account balance is declared private.

```swift
private var balance: Double
```

It prevents external code from directly accessing or
modifying the account balance.

### 2. Fileprivate

The transaction formatting function is declared fileprivate.

```swift
fileprivate func formatTransaction(_ message: String) -> String
```

It can be accessed anywhere within BankAccount.swift,
but not from main.swift.

### 3. Internal

The accountType() method is declared internal.

```swift
internal func accountType() -> String
```

It can be accessed from both Swift files because they
belong to the same module.

### 4. Public

The BankAccount type and its required methods are declared public.

```swift
public struct BankAccount
public mutating func deposit(_ amount: Double) -> Bool
public mutating func withdraw(_ amount: Double) -> Bool
```

These declarations form the public API and can be accessed
by other modules when the module is imported.

## Encapsulation

The account balance cannot be modified directly.

Users must interact with the account through deposit()
and withdraw() methods.

This prevents unauthorized and invalid balance changes.

## Validation

- Rejects negative deposits.
- Rejects zero deposits.
- Rejects negative withdrawals.
- Rejects zero withdrawals.
- Rejects withdrawals exceeding the balance.
- Rejects invalid account names.
- Rejects negative and non-finite opening balances.

## Optional Extension

Transaction history is implemented using:

```swift
public private(set) var transactionHistory: [String] = []
```

External callers can read the transaction history but
cannot directly modify it.

## How to Execute

```bash
swiftc BankAccount.swift main.swift -o BankLab
./BankLab
```

## Learning Outcomes

- Understanding Swift access control.
- Implementing encapsulation.
- Protecting sensitive model data.
- Using initializers and validation.
- Implementing controlled public methods.
- Maintaining read-only transaction history.
