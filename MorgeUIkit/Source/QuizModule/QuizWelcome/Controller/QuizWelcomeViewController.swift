//
//  QuizWelcomeViewController.swift
//  MorgeUIkit
//
//  Created by MAC on 20.02.2023.
//

import UIKit

class QuizWelcomeViewController: UIViewController {

    // MARK: Property

    private var quizWelcomeView: QuizWelcomeView? {
        guard isViewLoaded else { return nil }
        return view as? QuizWelcomeView
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = QuizWelcomeView()
        tapButtonStart()
    }

    // MARK: Tap Button

    private func tapButtonStart() {
        quizWelcomeView?.buttonStart.addTarget(self, action: #selector(openQuizAnswerView), for: .touchUpInside)
    }

    // MARK: OpenQuizAnswerView

    @objc private func openQuizAnswerView() {
        let quizAnswerView = QuizAnswerViewController()
        quizAnswerView.modalPresentationStyle = .fullScreen
        present(quizAnswerView, animated: false)
    }
}
