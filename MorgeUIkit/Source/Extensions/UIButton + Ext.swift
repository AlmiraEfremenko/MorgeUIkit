//
//  UIButton + Ext.swift
//  MorgeUIkit
//
//  Created by MAC on 26.02.2023.
//

import UIKit

extension UIButton {
    convenience init(title: String,
                     color: UIColor?,
                     font: UIFont?,
                     titleColor: UIColor?,
                     layerColor: UIColor?,
                     layerWidth: CGFloat) {
        self.init(type: .system)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 10
        self.layer.borderColor = layerColor?.cgColor
        self.layer.borderWidth = layerWidth
        self.titleLabel?.font = font
        self.titleLabel?.numberOfLines = 2
        self.titleLabel?.textAlignment = .center
        self.setTitleColor(titleColor, for: .normal)
    }
}
