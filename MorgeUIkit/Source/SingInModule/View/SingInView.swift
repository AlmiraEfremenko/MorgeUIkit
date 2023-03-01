//
//  SingInView.swift
//  MorgeUIkit
//
//  Created by MAC on 17.02.2023.
//

import UIKit

class SingInView: UIView {

    // MARK: Property

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Укажите свое имя"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()

    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ваше Имя"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.textAlignment = .center
        textField.adjustsFontSizeToFitWidth = true
        textField.delegate = self
        return textField
    }()

    private lazy var buttonSingIn: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.backgroundColor = Colors.backgroundLanchScreen.color
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    private var isInputName = true
    public var singIn: (() -> Void)?

    // MARK: Initial

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Tap button

    @objc private func tapButton() {
        guard let text = nameTextField.text else { return }

        if !text.isEmpty && isInputName {
            singIn?()
        }
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
        addSubview(nameTextField)
        addSubview(buttonSingIn)
    }

    // MARK: SetupLayout

    private func setupLayout() {

        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 240),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 57),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -57),

            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            nameTextField.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 276),
            nameTextField.heightAnchor.constraint(equalToConstant: 60),

            buttonSingIn.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonSingIn.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 50),
            buttonSingIn.heightAnchor.constraint(equalToConstant: 60),
            buttonSingIn.widthAnchor.constraint(equalToConstant: 170),
        ])
    }
}

// MARK: Extension SingInView

extension SingInView: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        range.location < 15
    }
}
