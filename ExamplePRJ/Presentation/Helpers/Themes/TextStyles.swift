//
//  TextStyles.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import Foundation
import UIKit

extension UIFont {
    
    //    static let fontAbeeSee = UIFont(name:"ABeeZee-Regular",size:28)
    
    class var textStyle20b: UIFont {
        return UIFont.systemFont(ofSize: 20.0, weight: .bold)
    }
    
    class var textStyle18b: UIFont {
        return UIFont.systemFont(ofSize: 18.0, weight: .bold)
    }
    
    // 16
    class var textStyle16b: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .bold)
    }
    class var textStyle16black: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .black)
    }
    class var textStyle16r: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .regular)
    }
    class var textStyle16l: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .light)
    }
    class var textStyle16T: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .thin)
    }
    class var textStyle16m: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .medium)
    }
    class var textStyle16h: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .heavy)
    }
    
    // 15
    class var textStyle15r: UIFont {
        return UIFont.systemFont(ofSize: 15.0, weight: .regular)
    }
    class var textStyle15b: UIFont {
        return UIFont.systemFont(ofSize: 15.0, weight: .bold)
    }
    
    // 14
    class var textStyle14l: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .light)
    }
    class var textStyle14r: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
    class var textStyle14m: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .medium)
    }
    class var textStyle14b: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .bold)
    }
    
    // 12
    class var textStyle12b: UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: .bold)
    }
    
    class var textStyle12r: UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: .regular)
    }
    
    class func freeTextStyle(size ofSize: CGFloat, _ weight: UIFont.Weight) -> UIFont {
        return UIFont.systemFont(ofSize: ofSize, weight: weight)
    }
}

