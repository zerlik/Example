//
//  UIEdgeInsets+Extensions.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit

extension UIEdgeInsets {
    init(inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    var vertical: CGFloat { top + bottom }
    var horizontal: CGFloat { left + right }
}

extension NSDirectionalEdgeInsets {
    init(inset: CGFloat) {
        self.init(top: inset, leading: inset, bottom: inset, trailing: inset)
    }
    
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    var vertical: CGFloat { top + bottom }
    var horizontal: CGFloat { leading + trailing }
}

