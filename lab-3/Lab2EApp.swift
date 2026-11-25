
import SwiftUI

@main
struct Lab2EApp: App {

    var body: some Scene {
        WindowGroup {

            TabView {

                SwiftUIGreetingView()
                    .tabItem {
                        Label("SwiftUI", systemImage: "swift")
                    }

                UIKitGreetingRepresentable()
                    .tabItem {
                        Label("UIKit", systemImage: "rectangle.on.rectangle")
                    }
            }
        }
    }
}
