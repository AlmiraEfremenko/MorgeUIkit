//
//  GreetingViewController.swift
//  MorgeUIkit
//
//  Created by MAC on 17.02.2023.
//

import UIKit

class GreetingViewController: UIViewController {

    // MARK: Property

    private let singInView = SingInViewController()

    private var greetingView: GreetingView? {
        guard isViewLoaded else { return nil }
        return view as? GreetingView
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = GreetingView()
        greetingsUser()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            let quizWelcomeViewController = QuizWelcomeViewController()
            quizWelcomeViewController.modalPresentationStyle = .fullScreen
            self?.present(quizWelcomeViewController, animated: false)
        }
    }

    // MARK: GreetingsUser

    private func greetingsUser() {
        guard let name = UserSettings.userModel?.name else { return }
        greetingView?.greetingsLabel.text = "Привет, \(name)!"
    }
}
