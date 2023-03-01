//
//  QuizAnswerView.swift
//  MorgeUIkit
//
//  Created by MAC on 22.02.2023.
//

import UIKit

class QuizAnswerView: UIView {

    // MARK: Property

    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = Colors.backgroundColor.color
        return backgroundView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Узнаю тебя поближе"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()

    private let answerTheQuestions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Пожалуйста ответь на вопросы"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    lazy var stackview: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()

    var isShowButtonTapOneTime = true

    lazy var buttonMoreSixMonthAgo = UIButton(title: "Более 6 месяцев назад",
                                              color: Colors.backgroundColor.color,
                                              font: .systemFont(ofSize: 10),
                                              titleColor: .black,
                                              layerColor: nil,
                                              layerWidth: 0)
    lazy var buttonOneOrTwoInYear = UIButton(title: "Было раз или два за последние полгода",
                                             color: Colors.backgroundColor.color,
                                             font: .systemFont(ofSize: 10),
                                             titleColor: .black,
                                             layerColor: nil,
                                             layerWidth: 0)

    lazy var buttonYesHardening = UIButton(title: "Ага, попытки были, но раз я здесь — не увенчались успехом",
                                           color: Colors.backgroundColor.color,
                                           font: .systemFont(ofSize: 10),
                                           titleColor: .black,
                                           layerColor: nil,
                                           layerWidth: 0)

    lazy var buttonNoHardening = UIButton(title: "Нет, поэтому решено взяться за свое здоровье!",
                                          color: Colors.backgroundColor.color,
                                          font: .systemFont(ofSize: 10),
                                          titleColor: .black,
                                          layerColor: nil,
                                          layerWidth: 0)

    lazy var quizTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(QuizQuestionsTableViewCell.self, forCellReuseIdentifier: QuizQuestionsTableViewCell.identifire)
        tableView.register(QuizAnswersTableViewCell.self, forCellReuseIdentifier: QuizAnswersTableViewCell.identifire)
        tableView.backgroundColor = .none
        // убрать линии между ячейками
        tableView.separatorStyle = .none
        // убрать индикатор скролла справа
        tableView.showsVerticalScrollIndicator = false
        //сделать таблицу статичной
        tableView.bounces = false
        // убрать выделение при нажатии на всю ячейку
        tableView.delaysContentTouches = false
        return tableView
    }()

    let startHardeningLabel = UILabel(text: "            Приступим!",
                                      font: .systemFont(ofSize: 12, weight: .medium),
                                      color: .black,
                                      textAlignment: .center)

    lazy var buttonStartHardening: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "buttonImage")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: Initial

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configure

    private func configure() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
        setupShowButton()
    }

    // MARK: SetupHierarchy

    private func setupHierarchy() {
        addSubview(backgroundView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(answerTheQuestions)
        backgroundView.addSubview(quizTableView)

        addSubview(stackview)
        stackview.addArrangedSubview(buttonMoreSixMonthAgo)
        stackview.addArrangedSubview(buttonOneOrTwoInYear)

        stackview.addArrangedSubview(buttonYesHardening)
        stackview.addArrangedSubview(buttonNoHardening)

        stackview.addArrangedSubview(startHardeningLabel)
        stackview.addArrangedSubview(buttonStartHardening)
    }

    // MARK: SetupLayout

    private func setupLayout() {

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90),

            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            answerTheQuestions.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            answerTheQuestions.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),

            quizTableView.topAnchor.constraint(equalTo: answerTheQuestions.bottomAnchor, constant: 50),
            quizTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
            quizTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            quizTableView.heightAnchor.constraint(equalToConstant: 480),

            stackview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            stackview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            stackview.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 16),

            buttonMoreSixMonthAgo.widthAnchor.constraint(equalToConstant: 170),
            buttonMoreSixMonthAgo.heightAnchor.constraint(equalToConstant: 40),

            buttonOneOrTwoInYear.widthAnchor.constraint(equalToConstant: 170),
            buttonOneOrTwoInYear.heightAnchor.constraint(equalToConstant: 40),

            buttonYesHardening.widthAnchor.constraint(equalToConstant: 170),
            buttonYesHardening.heightAnchor.constraint(equalToConstant: 40),

            buttonNoHardening.widthAnchor.constraint(equalToConstant: 170),
            buttonNoHardening.heightAnchor.constraint(equalToConstant: 40),

            buttonStartHardening.widthAnchor.constraint(equalToConstant: 40),
            buttonStartHardening.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    public func setupShowButton() {
        if isShowButtonTapOneTime {
            buttonMoreSixMonthAgo.isHidden = false
            buttonOneOrTwoInYear.isHidden = false

            buttonYesHardening.isHidden = true
            buttonNoHardening.isHidden = true

            startHardeningLabel.isHidden = true
            buttonStartHardening.isHidden = true
        } else {
            buttonMoreSixMonthAgo.isHidden = true
            buttonOneOrTwoInYear.isHidden = true

            buttonYesHardening.isHidden = false
            buttonNoHardening.isHidden = false

            startHardeningLabel.isHidden = true
            buttonStartHardening.isHidden = true
        }
    }
}
