//
//  UILabel+Init.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit

extension UILabel {
    convenience init(
        text: String? = nil,
        font: UIFont,
        color: UIColor? = .black,
        alignment: NSTextAlignment = .natural,
        numberOfLines: Int = 1
    ) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = color
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
        self.adjustsFontForContentSizeCategory = true
    }
}
