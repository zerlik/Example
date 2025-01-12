//
//  NibButton.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit
import Combine

class NibButton: UIButton {
    
    private var subscriptions = Set<AnyCancellable>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tapPublisher
            .sink {
// MARK: if nessesary for tapable button
            }
            .store(in: &subscriptions)
        titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
    @available(*, unavailable,
                message: "nib is unsupported in favor of initializer dependency injection."
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("nib is unsupported in favor of initializer dependency injection.")
    }
}


