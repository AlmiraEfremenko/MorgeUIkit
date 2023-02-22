//
//  UIlabel + Ext.swift
//  MorgeUIkit
//
//  Created by MAC on 21.02.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String = "", font: UIFont?) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = .black
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.adjustsFontSizeToFitWidth = true
        self.numberOfLines = 3
    }
}
