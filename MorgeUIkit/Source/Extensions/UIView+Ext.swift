//
//  UIView+Ext.swift
//  MorgeUIkit
//
//  Created by MAC on 27.02.2023.
//

import UIKit

extension UIView {

    convenience init(backgroundColor: UIColor, borderColor: UIColor) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 10
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 0.5
    }
}
