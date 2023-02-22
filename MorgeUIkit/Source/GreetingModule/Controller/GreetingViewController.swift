//
//  GreetingViewController.swift
//  MorgeUIkit
//
//  Created by MAC on 17.02.2023.
//

import UIKit

class GreetingViewController: UIViewController {

    private let singInView = SingInViewController()

    private var greetingView: GreetingView? {
        guard isViewLoaded else { return nil }
        return view as? GreetingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = GreetingView()
        greetingsUser()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let quizWelcomeViewController = QuizWelcomeViewController()
            quizWelcomeViewController.modalPresentationStyle = .fullScreen
            self.present(quizWelcomeViewController, animated: false)
        }
    }

    private func greetingsUser() {
        guard let name = UserSettings.userModel?.name else { return }
        greetingView?.greetingsLabel.text = "Привет, \(name)!"
    }
}
