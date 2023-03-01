//
//  QuizAnswerTableViewCell.swift
//  MorgeUIkit
//
//  Created by MAC on 22.02.2023.
//

import UIKit

class QuizQuestionsTableViewCell: UITableViewCell {

    // MARK: Property

    static let identifire = String(describing: QuizQuestionsTableViewCell.self)

    private let backgroundImageView: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = .white
        background.layer.cornerRadius = 30
        return background
    }()

    private let backgroundLabel: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = .white
        background.layer.cornerRadius = 10
        return background
    }()

    private let morgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let titlelabel = UILabel(text: "",
                             font: .systemFont(ofSize: 11,
                                               weight: .regular),
                             color: .black,
                             textAlignment: .left)

    // MARK: Initial

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configure

    private func configure() {
        backgroundColor = .clear
        selectionStyle = .none
        setupHierarchy()
        setupLayout()
    }

    // MARK: SetupHierarchy

    private func setupHierarchy() {
        addSubview(backgroundImageView)
        addSubview(backgroundLabel)
        backgroundImageView.addSubview(morgeImageView)
        backgroundLabel.addSubview(titlelabel)
    }

    // MARK: SetupLayout

    private func setupLayout() {

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 60),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 60),

            morgeImageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            morgeImageView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            morgeImageView.widthAnchor.constraint(equalToConstant: 44),
            morgeImageView.heightAnchor.constraint(equalToConstant: 44),

            backgroundLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            backgroundLabel.leadingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 16),
            backgroundLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backgroundLabel.heightAnchor.constraint(equalToConstant: 60),

            titlelabel.leadingAnchor.constraint(equalTo: backgroundLabel.leadingAnchor, constant: 10),
            titlelabel.centerYAnchor.constraint(equalTo: backgroundLabel.centerYAnchor),
            titlelabel.trailingAnchor.constraint(equalTo: backgroundLabel.trailingAnchor, constant: -20)
        ])
    }
}
