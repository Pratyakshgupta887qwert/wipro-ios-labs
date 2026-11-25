
import SwiftUI

struct SwiftUIGreetingView: View {

    // State stores the user's input and the displayed result.
    @State private var studentName: String = ""
    @State private var result: String = "Your result will appear here."

    var body: some View {
        VStack(spacing: 20) {

            Text("Student Greeting")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Enter your name", text: $studentName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button(action: showGreeting) {
                Text("Submit")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Text(result)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        .padding(.top, 50)
    }

    // Updates the result when the button is tapped.
    private func showGreeting() {
        let name = studentName.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        if name.isEmpty {
            result = "Please enter your name."
        } else {
            result = "Welcome to SwiftUI, \(name)!"
        }
    }
}

#Preview {
    SwiftUIGreetingView()
}
