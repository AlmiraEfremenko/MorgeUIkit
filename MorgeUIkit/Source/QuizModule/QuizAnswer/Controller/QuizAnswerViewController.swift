//
//  QuizAnswerViewController.swift
//  MorgeUIkit
//
//  Created by MAC on 22.02.2023.
//

import UIKit

class QuizAnswerViewController: UIViewController {

    // MARK: Property

    private var quizAnswerView: QuizAnswerView? {
        guard isViewLoaded else { return nil }
        return view as? QuizAnswerView
    }

    private var quizModel = [QuizModel]()

    private var isSickMoreSixMonthAgo = true
    private var isYesHardening = true

    private var quiz = QuizModel(question: """
                                 Когда у тебя было плохое самочувствие в последний раз?
                                 Например, болезнь или недомогание
                                 """,
                                 answer: nil)

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = QuizAnswerView()
        setupDelegates()
        addQuestion()

        tapButtonMoreSixAgo()
        tapButtonOneTwoInYear()

        quizAnswerView?.buttonStartHardening.addTarget(self, action: #selector(tapButtonStart), for: .touchUpInside)
    }

    // MARK: SetupDelegates

    private func setupDelegates() {
        quizAnswerView?.quizTableView.dataSource = self
        quizAnswerView?.quizTableView.delegate = self
    }

    // MARK: TapButtonMoreSixAgo

    private func tapButtonMoreSixAgo() {
        quizAnswerView?.buttonMoreSixMonthAgo
            .addTarget(self,
                       action: #selector(activeButtonMoreSixAgo),
                       for: .touchUpInside)
    }

    // MARK: TapButtonOneTwoInYear

    private func tapButtonOneTwoInYear() {
        quizAnswerView?.buttonOneOrTwoInYear
            .addTarget(self,
                       action: #selector(activeButtonOneTwoInYear),
                       for: .touchUpInside)
    }

    // MARK: AddQuestion

    private func addQuestion() {
        quizModel.append(quiz)
    }

    // MARK: ActiveButtonMoreSixAgo

    @objc private func activeButtonMoreSixAgo() {
        quiz = QuizModel(question: nil,
                         answer: "Более 6 месяцев назад")

        quizModel.append(quiz)
        quizAnswerView?.quizTableView.reloadData()

        if quiz.answer != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.getQuestionSayYouHardening()
                self.quizAnswerView?.isShowButtonTapOneTime = false
                self.quizAnswerView?.setupShowButton()
                self.tapButtonYesOrNoHardening()
            }
        }
    }

    // MARK: ActiveButtonOneTwoInYear

    @objc private func activeButtonOneTwoInYear() {
        isSickMoreSixMonthAgo = false
        quiz = QuizModel(question: nil,
                         answer: "Было раз или два за последние полгода")

        quizModel.append(quiz)
        quizAnswerView?.quizTableView.reloadData()

        if quiz.answer != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.getQuestionSayYouHardening()
                self.quizAnswerView?.isShowButtonTapOneTime = false
                self.quizAnswerView?.setupShowButton()
                self.tapButtonYesOrNoHardening()
            }
        }
    }

    // MARK: GetQuestionSayYouHardening

    private func getQuestionSayYouHardening() {
        quiz = isSickMoreSixMonthAgo ? QuizModel(question: """
                   Отлично! У тебя уже довольно крепкий иммунитет по вашим человеческим меркам.
                   Значит займёмся его укреплением
                   """, answer: nil) : QuizModel(question: """
                   Тебе стоит подумать о своём здоровье.
                   Я, например, не помню когда болел😝. Но ничего, со мной
                   ты будешь здоров, как морж!
                   """, answer: nil)

        quizModel.append(quiz)

        let questionHardening = QuizModel(question: "Скажи, у тебя уже были попытки закалить свой организм?",
                                          answer: nil)

        quizModel.append(questionHardening)
        quizAnswerView?.quizTableView.reloadData()
    }

    // MARK: TapButtonYesOrNoHardening

    private func tapButtonYesOrNoHardening() {
        quizAnswerView?.buttonYesHardening.addTarget(self,
                                                     action: #selector(activeButtonYesHardening),
                                                     for: .touchUpInside)
        quizAnswerView?.buttonNoHardening.addTarget(self,
                                                    action: #selector(activeButtonNoHardening),
                                                    for: .touchUpInside)
    }

    // MARK: ActiveButtonYesHardening

    @objc private func activeButtonYesHardening() {
        getAnswerAboutHardening()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.getStartHardening()
            self.quizAnswerView?.stackview.layer.cornerRadius = 20
            self.quizAnswerView?.stackview.backgroundColor = Colors.backgroundColor.color
            self.quizAnswerView?.buttonStartHardening.isHidden = false
            self.quizAnswerView?.startHardeningLabel.isHidden = false
        }
    }

    // MARK: ActiveButtonNoHardening

    @objc private func activeButtonNoHardening() {
        isYesHardening = false
        getAnswerAboutHardening()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.getStartHardening()
            self.quizAnswerView?.stackview.layer.cornerRadius = 20
            self.quizAnswerView?.stackview.backgroundColor = Colors.backgroundColor.color
            self.quizAnswerView?.buttonStartHardening.isHidden = false
            self.quizAnswerView?.startHardeningLabel.isHidden = false
        }
    }

    // MARK: GetAnswerAboutHardening

    private func getAnswerAboutHardening() {
        quiz = isYesHardening ? QuizModel(question: nil,
                                          answer: "Ага, попытки были, но раз я здесь — не увенчались успехом") :
        QuizModel(question: nil,
                  answer: "Нет, поэтому решено взяться за свое здоровье!")

        quizModel.append(quiz)
        quizAnswerView?.quizTableView.reloadData()

        quizAnswerView?.buttonYesHardening.isHidden = true
        quizAnswerView?.buttonNoHardening.isHidden = true
    }

    // MARK: GetAnswerAboutHardening

    private func getStartHardening() {
        guard let name = UserSettings.userModel?.name else { return }

        quiz = QuizModel(question: "Ну что ж, \(name). Я узнал все, что хотел. Давай начинать?",
                         answer: nil)
        quizModel.append(quiz)
        quizAnswerView?.quizTableView.reloadData()
    }

    // MARK: TapButtonStart

    @objc private func tapButtonStart() {
        let rateViewController = RatesViewController()
        rateViewController.modalPresentationStyle = .fullScreen
        present(rateViewController, animated: false)
    }
}
// MARK: Extension QuizAnswerViewController

extension QuizAnswerViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()

        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuizQuestionsTableViewCell.identifire,
                                                           for: indexPath) as? QuizQuestionsTableViewCell else { return UITableViewCell() }
            cell.titlelabel.text = quizModel[indexPath.row].question
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuizAnswersTableViewCell.identifire,
                                                           for: indexPath) as? QuizAnswersTableViewCell else { return UITableViewCell() }
            cell.titlelabel.text = quizModel[indexPath.row].answer
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuizQuestionsTableViewCell.identifire,
                                                           for: indexPath) as? QuizQuestionsTableViewCell else { return UITableViewCell() }
            cell.titlelabel.text = quizModel[indexPath.row].question
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuizQuestionsTableViewCell.identifire,
                                                           for: indexPath) as? QuizQuestionsTableViewCell else { return UITableViewCell() }
            cell.titlelabel.text = quizModel[indexPath.row].question
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuizAnswersTableViewCell.identifire,
                                                           for: indexPath) as? QuizAnswersTableViewCell else { return UITableViewCell() }
            cell.titlelabel.text = quizModel[indexPath.row].answer
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuizQuestionsTableViewCell.identifire,
                                                           for: indexPath) as? QuizQuestionsTableViewCell else { return UITableViewCell() }
            cell.titlelabel.text = quizModel[indexPath.row].question
            return cell
        default:
            break
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
