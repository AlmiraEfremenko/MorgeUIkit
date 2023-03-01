//
//  MeetTableViewCell.swift
//  MorgeUIkit
//
//  Created by MAC on 20.02.2023.
//

import UIKit

class MeetTableViewCell: UITableViewCell {

    // MARK: Property

    static let identifire = String(describing: MeetTableViewCell.self)

    private let backgroundCell: UIView = {
        let backgroundCell = UIView()
        backgroundCell.translatesAutoresizingMaskIntoConstraints = false
        backgroundCell.backgroundColor = .white
        backgroundCell.layer.cornerRadius = 10
        return backgroundCell
    }()

    private let morgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let titlelabel = UILabel(text: "",
                             font: .systemFont(ofSize: 12,
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
        addSubview(backgroundCell)
        backgroundCell.addSubview(morgeImageView)
        backgroundCell.addSubview(titlelabel)
    }

    // MARK: SetupLayout

    private func setupLayout() {

        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            backgroundCell.heightAnchor.constraint(equalToConstant: 60),

            morgeImageView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor),
            morgeImageView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            morgeImageView.widthAnchor.constraint(equalToConstant: 44),
            morgeImageView.heightAnchor.constraint(equalToConstant: 44),

            titlelabel.leadingAnchor.constraint(equalTo: morgeImageView.trailingAnchor, constant: 16),
            titlelabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            titlelabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -40)
        ])
    }
}
