//
//  Images.swift
//  MorgeUIkit
//
//  Created by MAC on 17.02.2023.
//

import UIKit

enum Colors: String {

    // MARK: - Common

    case backgroundLanchScreen
    case backgroundColor
    case blue
    case black
    case lightBlue

    // MARK: - Text

    // MARK: - Property

    var color: UIColor? {
        UIColor(named: rawValue)
    }

    var cgColor: CGColor? {
        UIColor(named: rawValue)?.cgColor
    }
}
