//
//  UIButton+Config.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit

extension UIButton {
    convenience init(configuration: UIButton.Configuration) {
        self.init()
        self.configuration = configuration
    }
    
    var isLoading: Bool {
        get { configuration?.showsActivityIndicator ?? false }
        set {
            configuration?.showsActivityIndicator = newValue
            isEnabled = !newValue
        }
    }
    
    var defaultTitle: String {
        get { title(for: .normal) ?? "" }
        set {
            UIView.performWithoutAnimation {
                setTitle(newValue, for: .normal)
                layoutIfNeeded()
            }
        }
    }
    
    var defaultTitleColor: UIColor? {
        get { titleColor(for: .normal) }
        set { setTitleColor(newValue, for: .normal)}
    }
}

extension UIButton.Configuration {
    static func primaryFilled(
        title: String?,
        backgroundColor: UIColor? = .clear,
        foregroundColor: UIColor? = .white
    ) -> UIButton.Configuration {
        var config = UIButton.Configuration.filled()
        
        config.baseBackgroundColor = backgroundColor
        config.baseForegroundColor = foregroundColor
        config.buttonSize = .large
        config.cornerStyle = .large
        config.title = title
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(inset: 16)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.textStyle16b
            return outgoing
        }
        
        return config
    }
    
    static func primaryUnfilled(
        title: String?,
        font: UIFont = UIFont.textStyle16b,
        image: UIImage? = nil,
        imagePlacement: NSDirectionalRectEdge = .trailing,
        backgroundColor: UIColor? = .clear,
        foregroundColor: UIColor? = .clear,
        cornerRadius: CGFloat? = nil,
        borderColor: UIColor? = nil
    ) -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        
        config.baseBackgroundColor = backgroundColor
        config.baseForegroundColor = foregroundColor
        config.buttonSize = .large
        config.cornerStyle = .large
        config.title = title
        config.image = image
        config.imagePlacement = imagePlacement
        config.imagePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(inset: 10)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = font
            return outgoing
        }
        if let cornerRadius {
            config.background.cornerRadius = cornerRadius
            config.cornerStyle = .fixed
        }
        if let borderColor {
            config.background.strokeColor = borderColor
            config.background.strokeWidth = 1
        }
        
        return config
    }
    
    static func primaryLink(
        title: String?,
        image: UIImage? = nil
    ) -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .clear
        config.title = title
        config.contentInsets = .zero
        config.image = image
        config.imagePlacement = .leading
        config.imagePadding = 8
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.textStyle16b
            return outgoing
        }
        
        return config
    }
    
    static func actionButton(
        title: String?,
        image: UIImage?,
        color: UIColor?
    ) -> UIButton.Configuration {
        var config = primaryFilled(
            title: title?.uppercased(),
            backgroundColor: color
        )
        config.contentInsets = NSDirectionalEdgeInsets(horizontal: 16, vertical: 14)
        config.imagePlacement = .leading
        config.imagePadding = 4
        config.image = image
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.textStyle14b
            return outgoing
        }
        return config
    }
}
