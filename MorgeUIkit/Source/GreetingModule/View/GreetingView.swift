//
//  View.swift
//  MorgeUIkit
//
//  Created by MAC on 17.02.2023.
//

import UIKit

class GreetingView: UIView {

    private let greetingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let greetingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Привет, "
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .blue
        return label
    }()

    private let gladToSeeYouLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Рад видеть тебя снова!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        addSubview(greetingImageView)
        addSubview(greetingsLabel)
        addSubview(gladToSeeYouLabel)
    }

    private func setupLayout() {

        NSLayoutConstraint.activate([

            greetingsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 500),
            greetingImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            greetingImageView.widthAnchor.constraint(equalToConstant: 200),
            greetingImageView.heightAnchor.constraint(equalToConstant: 200),

            greetingsLabel.topAnchor.constraint(equalTo: greetingImageView.bottomAnchor, constant: 30),
            greetingsLabel.centerXAnchor.constraint(equalTo: greetingImageView.centerXAnchor),

            gladToSeeYouLabel.topAnchor.constraint(equalTo: greetingsLabel.bottomAnchor, constant: 4),
            gladToSeeYouLabel.centerXAnchor.constraint(equalTo: greetingsLabel.centerXAnchor)
        ])
    }
}
