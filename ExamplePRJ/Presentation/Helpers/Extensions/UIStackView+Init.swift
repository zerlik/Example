//
//  UIStackView+Init.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit

extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 0,
        alignment: Alignment = .fill,
        distribution: Distribution = .fill
    ) {
        self.init()
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
}
