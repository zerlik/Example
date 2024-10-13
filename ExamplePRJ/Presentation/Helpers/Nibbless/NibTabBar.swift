//
//  NibTabBar.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import UIKit

class NibTabBar: UITabBar {

    override init(frame: CGRect) { super.init(frame: frame)}

    @available(*, unavailable,
                message: "nib is unsupported in favor of initializer dependency injection."
    )

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
