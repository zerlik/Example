//
//  NibView.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//

import UIKit

class NibView: UIView {

    override init(frame: CGRect) { super.init(frame: frame) }
    
    @available(*, unavailable,
                message: "nib is unsupported in favor of initializer dependency injection."
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("nib is unsupported in favor of initializer dependency injection.")
    }
}
