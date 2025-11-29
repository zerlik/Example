//
//  UIBarButtonItem.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 14/10/2024.
//

import UIKit

extension UIBarButtonItem {

    static var close: UIBarButtonItem {
        let item = UIBarButtonItem(
            image: .close,
            style: .plain,
            target: nil,
            action: nil
        )
        item.tintColor = UIColor.mainBlack
        return item
    }

    static var back: UIBarButtonItem {
        let item = UIBarButtonItem()
        item.title = Localization.BarButton.back
        item.tintColor = UIColor.mainBlack
        return item
    }

    static var backClear: UIBarButtonItem {
        let item = UIBarButtonItem()
        item.title = " "
        item.tintColor = UIColor.mainBlack
        return item
    }

    static var skip: UIBarButtonItem {
        let item = UIBarButtonItem()
        item.title = Localization.BarButton.skip
        item.tintColor = UIColor.mainBlack
        return item
    }

    static var done: UIBarButtonItem {
        let item = UIBarButtonItem()
        item.title = Localization.BarButton.done
        item.tintColor = UIColor.mainBlack
        item.style = .done
        return item
    }
}

