//
//  UIStackView+AddArrangedSubviews.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview(_:))
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach(addArrangedSubview(_:))
    }
}
