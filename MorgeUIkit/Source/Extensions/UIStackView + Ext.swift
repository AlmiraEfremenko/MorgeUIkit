//
//  UIStackView + Ext.swift
//  MorgeUIkit
//
//  Created by MAC on 01.03.2023.
//

import UIKit

extension UIStackView {

    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init()
        self.spacing = spacing
        self.axis = axis
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
