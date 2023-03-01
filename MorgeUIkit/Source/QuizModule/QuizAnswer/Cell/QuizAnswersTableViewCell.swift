//
//  QuizAnswersTableViewCell.swift
//  MorgeUIkit
//
//  Created by MAC on 26.02.2023.
//

import UIKit

class QuizAnswersTableViewCell: UITableViewCell {

    // MARK: Property

    static let identifire = String(describing: QuizAnswersTableViewCell.self)

    private let backgroundImageView: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = Colors.blue.color
        background.layer.cornerRadius = 44 / 2
        return background
    }()

    private let backgroundLabel: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = Colors.blue.color
        background.layer.cornerRadius = 10
        return background
    }()

    private let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.fill")?
            .withTintColor(.white)
            .withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let titlelabel = UILabel(text: "",
                             font: .systemFont(ofSize: 12,
                                               weight: .regular),
                             color: .white,
                             textAlignment: .center)

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
        backgroundImageView.addSubview(personImageView)
        backgroundLabel.addSubview(titlelabel)
    }

    // MARK: SetupLayout

    private func setupLayout() {

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 44),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 44),

            personImageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            personImageView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            personImageView.widthAnchor.constraint(equalToConstant: 27),
            personImageView.heightAnchor.constraint(equalToConstant: 27),

            backgroundLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            backgroundLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            backgroundLabel.trailingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: -16),
            backgroundLabel.heightAnchor.constraint(equalToConstant: 44),
            backgroundLabel.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),

            titlelabel.leadingAnchor.constraint(equalTo: backgroundLabel.leadingAnchor, constant: 10),
            titlelabel.centerYAnchor.constraint(equalTo: backgroundLabel.centerYAnchor),
            titlelabel.trailingAnchor.constraint(equalTo: backgroundLabel.trailingAnchor, constant: -10)
        ])
    }
}
