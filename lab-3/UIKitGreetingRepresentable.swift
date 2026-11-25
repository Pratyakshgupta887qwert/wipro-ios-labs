
import SwiftUI

// Makes a UIKit UIViewController usable inside SwiftUI.
struct UIKitGreetingRepresentable: UIViewControllerRepresentable {

    func makeUIViewController(
        context: Context
    ) -> UIKitGreetingViewController {

        return UIKitGreetingViewController()
    }

    func updateUIViewController(
        _ uiViewController: UIKitGreetingViewController,
        context: Context
    ) {
        // No updates are required for this simple example.
    }
}
