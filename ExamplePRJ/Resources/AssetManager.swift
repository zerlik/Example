//
//  AssetManager.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import Foundation

enum AssetManager{
    
    enum Auth{
        static let logo = "logo".imaged()
        static let check = "Check".imaged()
        static let close = "Close".imaged()
        static let logoApple = "logoApple".imaged()
        static let logoGoogle = "logoGoogle".imaged()
    }

    enum TabBar{
        static let add = "Hearttick".imaged()
        static let home = "Profile".imaged()
        static let list = "Search".imaged()
    }
}
