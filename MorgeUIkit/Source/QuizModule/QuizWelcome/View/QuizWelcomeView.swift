//
//  QuizWelcomeView.swift
//  MorgeUIkit
//
//  Created by MAC on 20.02.2023.
//

import UIKit

class QuizWelcomeView: UIView {

    // MARK: Property

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Похоже ты новичок!"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()

    private let getMeeting: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Тогда давай знакомиться!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    lazy var buttonStart: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.backgroundLanchScreen.color
        button.setTitle("Начнем", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    private lazy var meetTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MeetTableViewCell.self, forCellReuseIdentifier: MeetTableViewCell.identifire)
        tableView.dataSource = self
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
        backgroundColor = Colors.backgroundColor.color
        setupHierarchy()
        setupLayout()
    }

    // MARK: SetupHierarchy

    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(getMeeting)
        addSubview(meetTableView)
        addSubview(buttonStart)
    }

    // MARK: SetupLayout

    private func setupLayout() {

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 250),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            getMeeting.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            getMeeting.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),

            meetTableView.topAnchor.constraint(equalTo: getMeeting.bottomAnchor, constant: 40),
            meetTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
            meetTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            meetTableView.heightAnchor.constraint(equalToConstant: 250),

            buttonStart.topAnchor.constraint(equalTo: meetTableView.bottomAnchor, constant: 30),
            buttonStart.widthAnchor.constraint(equalToConstant: 150),
            buttonStart.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStart.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: Extension QuizWelcomeView

extension QuizWelcomeView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MeetTableViewCell.identifire,
                                                       for: indexPath) as? MeetTableViewCell else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            cell.titlelabel.text = "Меня зовут Морже. Я стану твоим личным тренером, мотиватором и другом."
        case 1:
            cell.titlelabel.text = "Моя цель — помочь изменить тебе привычный образ жизни и укрепить свой иммунитет за 90 дней."
        case 2:
            cell.titlelabel.text = "Я задам тебе три простых вопроса."
        default:
            break
        }
        return cell
    }
}
