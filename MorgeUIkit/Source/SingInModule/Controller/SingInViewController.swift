//
//  ViewController.swift
//  MorgeUIkit
//
//  Created by MAC on 17.02.2023.
//

import UIKit

class SingInViewController: UIViewController {

    // MARK: Property

    private var singInView: SingInView? {
        guard isViewLoaded else { return nil }
        return view as? SingInView
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = SingInView()

        singInView?.singIn = { [weak self] in
            guard let name = self?.singInView?.nameTextField.text else { return }
            let userModel = UserModel(name: name)
            UserSettings.userModel = userModel
            self?.signInAccount()
        }
    }

    // MARK: SignInAccount

    private func signInAccount() {
        let greetingViewController = GreetingViewController()
        greetingViewController.modalPresentationStyle = .fullScreen
        self.present(greetingViewController, animated: false)
    }
}
