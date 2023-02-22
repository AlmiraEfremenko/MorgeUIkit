//
//  QuizWelcomeViewController.swift
//  MorgeUIkit
//
//  Created by MAC on 20.02.2023.
//

import UIKit

class QuizWelcomeViewController: UIViewController {

    private var quizWelcomeView: GreetingView? {
        guard isViewLoaded else { return nil }
        return view as? GreetingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = QuizWelcomeView()
    }

    private func open quizsAnswer() {

    }
}
