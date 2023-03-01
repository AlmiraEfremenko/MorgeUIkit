//
//  ProgressView.swift
//  MorgeUIkit
//
//  Created by MAC on 01.03.2023.
//

import UIKit

class ProgressView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        backgroundColor = Colors.backgroundColor.color
    }
}
