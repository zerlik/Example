//
//  NibViewController.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//

import UIKit

class NibViewController: UIViewController {
    
    init() { super.init(nibName: nil, bundle: nil) }
    
    @available(*, unavailable,
                message: "nib is unsupported in favor of initializer dependency injection."
    )
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable,
                message: "nib is unsupported in favor of initializer dependency injection."
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("nib is unsupported in favor of initializer dependency injection.")
    }
}

