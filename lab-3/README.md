
# Lab 2E – SwiftUI vs UIKit

## Objective

Recognise the differences between imperative UI construction and declarative UI by implementing the same screen in SwiftUI and UIKit.

## Screen Description

Both implementations contain:

- A title: Student Greeting
- A text field for entering a name
- A Submit button
- A result label

When the user taps Submit:
- An empty name displays a validation message.
- A valid name displays a welcome message.

## Task 1: Two UI Implementations

Created the same Student Greeting interface using:

1. SwiftUI – Declarative UI.
2. UIKit – Imperative UI.

## Task 2: SwiftUI State

Used `@State` variables to store the student's name and result.

When the Submit button is tapped, the result state is updated, and SwiftUI automatically refreshes the interface.

## Task 3: UIKit Actions

Created UIKit controls programmatically using:

- UILabel
- UITextField
- UIButton
- UIStackView

Connected the button using `addTarget(_:action:for:)`.

Updated the result label manually inside the button action.

## Task 4: Comparison

| Feature | SwiftUI | UIKit |
|---|---|---|
| UI approach | Declarative | Imperative |
| Code | Less code | More code |
| State | @State and bindings | Manual updates |
| Layout | VStack, HStack, modifiers | Auto Layout |
| Preview | SwiftUI Preview | Simulator and Xcode previews |
| Interoperability | UIViewRepresentable / UIViewControllerRepresentable | UIHostingController |

## Task 5: Recommendation

SwiftUI is recommended for new applications because it provides a concise declarative syntax and automatic state management.

UIKit is recommended for existing UIKit applications, complex legacy interfaces, and situations where UIKit-specific functionality is required.

Both frameworks can be integrated in the same application.

## Optional Extension: Interoperability

Used `UIViewControllerRepresentable` to embed the UIKit greeting screen inside the SwiftUI application.

## Project Structure

```text
Lab2E/
├── Lab2EApp.swift
├── SwiftUIGreetingView.swift
├── UIKitGreetingViewController.swift
├── UIKitGreetingRepresentable.swift
└── README.md
```

## How to Run

1. Open the project in Xcode.
2. Select an iOS Simulator.
3. Build and run the application.
4. Open the SwiftUI tab and test the greeting.
5. Open the UIKit tab and test the same functionality.

## Screenshots

Add actual screenshots from the iOS Simulator:

- SwiftUI screen with the initial state.
- SwiftUI screen after entering a name.
- UIKit screen with the initial state.
- UIKit screen after entering a name.

## Conclusion

This lab demonstrates the difference between declarative and imperative UI development. SwiftUI simplifies interface creation through state-driven rendering, while UIKit provides direct control over UI components and their lifecycle. Interoperability allows both frameworks to be used together.
