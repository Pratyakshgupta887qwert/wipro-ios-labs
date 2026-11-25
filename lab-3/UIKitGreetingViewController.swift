
import UIKit

class UIKitGreetingViewController: UIViewController {

    // MARK: - UI Components

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Student Greeting"
        label.font = .boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        return label
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .words
        return textField
    }()

    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Your result will appear here."
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupLayout()

        // Connect button to its action.
        submitButton.addTarget(
            self,
            action: #selector(showGreeting),
            for: .touchUpInside
        )
    }

    // MARK: - Layout

    private func setupLayout() {

        let stackView = UIStackView(
            arrangedSubviews: [
                titleLabel,
                nameTextField,
                submitButton,
                resultLabel
            ]
        )

        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([

            stackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),

            stackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 25
            ),

            stackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -25
            ),

            submitButton.heightAnchor.constraint(
                equalToConstant: 48
            )
        ])
    }

    // MARK: - Button Action

    @objc private func showGreeting() {

        let name = nameTextField.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        if name.isEmpty {
            resultLabel.text = "Please enter your name."
        } else {
            resultLabel.text = "Welcome to UIKit, \(name)!"
        }
    }
}
