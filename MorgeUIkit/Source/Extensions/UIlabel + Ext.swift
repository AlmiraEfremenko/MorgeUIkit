//
//  UIlabel + Ext.swift
//  MorgeUIkit
//
//  Created by MAC on 21.02.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String = "", font: UIFont?, color: UIColor?, textAlignment: NSTextAlignment) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = color
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.adjustsFontSizeToFitWidth = true
        self.numberOfLines = 4
        self.textAlignment = textAlignment
    }
}
