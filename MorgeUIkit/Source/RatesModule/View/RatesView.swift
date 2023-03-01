//
//  RatesView.swift
//  MorgeUIkit
//
//  Created by MAC on 27.02.2023.
//

import UIKit

class RatesView: UIView {

    // MARK: Property

    private let titleLabel = UILabel(text: "Попробуйте бесплатно или оплатите тариф сразу",
                                     font: .systemFont(ofSize: 24, weight: .medium),
                                     color: .black,
                                     textAlignment: .center)

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 6
        return stackView
    }()

   // private var stackViewForRateView = UIStackView()
    private var stackViewForText = UIStackView(axis: .horizontal,
                                               spacing: 2)

    private let oneMonthRateView = UIView(backgroundColor: .white, borderColor: .lightGray)
    private let threeMonthRateView = UIView(backgroundColor: Colors.blue.color ?? UIColor(),
                                            borderColor: Colors.blue.color ?? UIColor())

    private let oneMonthLabel = UILabel(text: "На 1 месяц",
                                        font: .systemFont(ofSize: 14, weight: .bold),
                                        color: .black,
                                        textAlignment: .center)

    private let threeMonthLabel = UILabel(text: "На 3 месяца",
                                          font: .systemFont(ofSize: 14, weight: .bold),
                                          color: .white,
                                          textAlignment: .center)

    private let descriptionOneMonthLabel = UILabel(text: "Если ты еще не уверен в собственной дисциплине",
                                                   font: .systemFont(ofSize: 10, weight: .regular),
                                                   color: .black,
                                                   textAlignment: .center)

    private let descriptionThreeMonthLabel = UILabel(text: "Если ты готов изменить свой образ жизни за 90 дней",
                                                     font: .systemFont(ofSize: 10, weight: .regular),
                                                     color: .white,
                                                     textAlignment: .center)

    private let costForOneMonth = UILabel(text: "199P",
                                          font: .systemFont(ofSize: 24, weight: .bold),
                                          color: .black,
                                          textAlignment: .center)

    private let costForThreeMonthWithDiscount = UILabel(text: "499P",
                                                        font: .systemFont(ofSize: 24, weight: .bold),
                                                        color: .white,
                                                        textAlignment: .left)

    private let fullCostThreeMonth = UILabel(text: "597P",
                                             font: .systemFont(ofSize: 14, weight: .bold),
                                             color: Colors.backgroundColor.color,
                                             textAlignment: .center)

    private lazy var buttonChoiceOneMonth = UIButton(title: "Выбрать",
                                                     color: Colors.blue.color,
                                                     font: .systemFont(ofSize: 14, weight: .medium),
                                                     titleColor: .white,
                                                     layerColor: nil,
                                                     layerWidth: 0)

    private lazy var buttonChoiceThreeMonth = UIButton(title: "Выбрать",
                                                       color: .white,
                                                       font: .systemFont(ofSize: 14, weight: .medium),
                                                       titleColor: Colors.blue.color,
                                                       layerColor: nil,
                                                       layerWidth: 0)

    private lazy var buttonFreePeriod = UIButton(title: "Использовать бесплатный период",
                                                 color: .white,
                                                 font: .systemFont(ofSize: 16, weight: .medium),
                                                 titleColor: Colors.blue.color,
                                                 layerColor: Colors.blue.color,
                                                 layerWidth: 1)

    private let descriptionAboutHardening = UILabel(text: "Я абсолютно уверен, что тебе понравится закаляться вместе со мной",
                                                    font: .systemFont(ofSize: 14, weight: .regular),
                                                    color: .black,
                                                    textAlignment: .center)

    private let giveFreeThreeDays = UILabel(text: "Поэтому даю тебе 3 дня тестового бесплатного периода",
                                       font: .systemFont(ofSize: 11, weight: .regular),
                                       color: .black,
                                       textAlignment: .center)
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

        configureCostThreeMonth()
        configuraChangesColorText()
    }

    private func configureCostThreeMonth() {
        fullCostThreeMonth.attributedText = fullCostThreeMonth.text?.strikeThrough()
        fullCostThreeMonth.alpha = 0.5
    }

    private func configuraChangesColorText() {
        let attributedWithTextColor = giveFreeThreeDays.text?.attributedStringWithColor(["3 дня тестового бесплатного периода"],
                                                                                        color: Colors.blue.color ?? UIColor())
        giveFreeThreeDays.attributedText = attributedWithTextColor
    }

    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(oneMonthRateView)
        stackView.addArrangedSubview(threeMonthRateView)

        oneMonthRateView.addSubview(oneMonthLabel)
        threeMonthRateView.addSubview(threeMonthLabel)

        oneMonthRateView.addSubview(descriptionOneMonthLabel)
        threeMonthRateView.addSubview(descriptionThreeMonthLabel)

        oneMonthRateView.addSubview(costForOneMonth)
        threeMonthRateView.addSubview(costForThreeMonthWithDiscount)

        threeMonthRateView.addSubview(fullCostThreeMonth)

        oneMonthRateView.addSubview(buttonChoiceOneMonth)
        threeMonthRateView.addSubview(buttonChoiceThreeMonth)
        addSubview(buttonFreePeriod)
        addSubview(descriptionAboutHardening)
        addSubview(stackViewForText)
        stackViewForText.addArrangedSubview(giveFreeThreeDays)
    }

    // MARK: SetupLayout

    private func setupLayout() {

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 211),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),

            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 66),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            stackView.heightAnchor.constraint(equalToConstant: 208),

            oneMonthRateView.heightAnchor.constraint(equalToConstant: 208),

            threeMonthRateView.heightAnchor.constraint(equalToConstant: 208),
            threeMonthRateView.widthAnchor.constraint(equalToConstant: 188),

            oneMonthLabel.topAnchor.constraint(equalTo: oneMonthRateView.topAnchor, constant: 25),
            oneMonthLabel.centerXAnchor.constraint(equalTo: oneMonthRateView.centerXAnchor),

            threeMonthLabel.topAnchor.constraint(equalTo: threeMonthRateView.topAnchor, constant: 23),
            threeMonthLabel.centerXAnchor.constraint(equalTo: threeMonthRateView.centerXAnchor),

            descriptionOneMonthLabel.topAnchor.constraint(equalTo: oneMonthLabel.bottomAnchor, constant: 8),
            descriptionOneMonthLabel.leadingAnchor.constraint(equalTo: oneMonthRateView.leadingAnchor, constant: 10),
            descriptionOneMonthLabel.trailingAnchor.constraint(equalTo: oneMonthRateView.trailingAnchor, constant: -10),

            descriptionThreeMonthLabel.topAnchor.constraint(equalTo: threeMonthLabel.bottomAnchor, constant: 8),
            descriptionThreeMonthLabel.leadingAnchor.constraint(equalTo: threeMonthRateView.leadingAnchor, constant: 10),
            descriptionThreeMonthLabel.trailingAnchor.constraint(equalTo: threeMonthRateView.trailingAnchor, constant: -10),

            costForOneMonth.topAnchor.constraint(equalTo: descriptionOneMonthLabel.bottomAnchor, constant: 15),
            costForOneMonth.leadingAnchor.constraint(equalTo: oneMonthRateView.leadingAnchor, constant: 10),
            costForOneMonth.trailingAnchor.constraint(equalTo: oneMonthRateView.trailingAnchor, constant: -10),

            costForThreeMonthWithDiscount.topAnchor.constraint(equalTo: descriptionThreeMonthLabel.bottomAnchor, constant: 15),
            costForThreeMonthWithDiscount.leadingAnchor.constraint(equalTo: fullCostThreeMonth.trailingAnchor, constant: 4),
            costForThreeMonthWithDiscount.trailingAnchor.constraint(equalTo: threeMonthRateView.trailingAnchor, constant: -10),

            fullCostThreeMonth.topAnchor.constraint(equalTo: descriptionThreeMonthLabel.bottomAnchor, constant: 28),
            fullCostThreeMonth.leadingAnchor.constraint(equalTo: threeMonthRateView.leadingAnchor, constant: 40),

            buttonChoiceOneMonth.topAnchor.constraint(equalTo: costForOneMonth.bottomAnchor, constant: 20),
            buttonChoiceOneMonth.leadingAnchor.constraint(equalTo: oneMonthRateView.leadingAnchor, constant: 42),
            buttonChoiceOneMonth.trailingAnchor.constraint(equalTo: oneMonthRateView.trailingAnchor, constant: -42),
            buttonChoiceOneMonth.heightAnchor.constraint(equalToConstant: 34),

            buttonChoiceThreeMonth.topAnchor.constraint(equalTo: costForThreeMonthWithDiscount.bottomAnchor, constant: 20),
            buttonChoiceThreeMonth.leadingAnchor.constraint(equalTo: threeMonthRateView.leadingAnchor, constant: 42),
            buttonChoiceThreeMonth.trailingAnchor.constraint(equalTo: threeMonthRateView.trailingAnchor, constant: -42),
            buttonChoiceThreeMonth.heightAnchor.constraint(equalToConstant: 34),

            buttonFreePeriod.topAnchor.constraint(equalTo: oneMonthRateView.bottomAnchor, constant: 67),
            buttonFreePeriod.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            buttonFreePeriod.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
            buttonFreePeriod.heightAnchor.constraint(equalToConstant: 46),

            descriptionAboutHardening.topAnchor.constraint(equalTo: buttonFreePeriod.bottomAnchor, constant: 12),
            descriptionAboutHardening.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            descriptionAboutHardening.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),

            stackViewForText.topAnchor.constraint(equalTo: descriptionAboutHardening.bottomAnchor, constant: 12),
            stackViewForText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            stackViewForText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
        ])
    }
}
