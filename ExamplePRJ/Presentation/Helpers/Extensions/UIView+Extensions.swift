//
//  UIView+Extensions.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit

public extension UIView {

    func lockWidth() {
        setContentHuggingPriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    func lockHeight() {
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    func lockSize() {
        lockWidth()
        lockHeight()
    }

    // MARK: Shadow
    func dropShadow(cornerRadius: CGFloat = 0, height: CGFloat = 1, radius: CGFloat = 1,
                    opacity: Float = 0.25) {

        dropShadow(
            cornerRadius: cornerRadius,
            height: height,
            radius: radius,
            opacity: opacity,
            shouldRasterize: false,
            rasterizationScale: UIScreen.main.scale
        )
    }

    private func dropShadow(cornerRadius: CGFloat, height: CGFloat, radius: CGFloat, opacity: Float,
                            shouldRasterize: Bool, rasterizationScale: CGFloat) {

        layer.masksToBounds = false
        layer.cornerRadius = cornerRadius

        // Implement dynamic color change for dark mode (use traits or superview)
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: 0, height: height)
        layer.shadowRadius = radius

        layer.shouldRasterize = shouldRasterize
        layer.rasterizationScale = rasterizationScale
    }
    
    var calculatedHeight: CGFloat {
        let widthConstraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: UIScreen.main.bounds.size.width
        )
        addConstraint(widthConstraint)
        let height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        removeConstraint(widthConstraint)
        return height
    }
    
    func detents(removeBottomSafeArea: Bool = false) -> [UISheetPresentationController.Detent] {
        if #available(iOS 16.0, *) {
            return [.custom { [weak self] _ in
                guard let self else { return 0 }
                var height = calculatedHeight
                if removeBottomSafeArea { height -= safeAreaInsets.bottom }
                return height
            }]
        }
        return [.medium()]
    }
    
    var allSubviews: [UIView] {
        return self.subviews.flatMap { [$0] + $0.allSubviews }
    }
    
    var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }
    
    func roundCorners() {
        cornerRadius = bounds.height / 2
    }
    
    var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    var borderColor: UIColor? {
        get { UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor) }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }

    func show(
        duration: TimeInterval = 0.3,
        completion: (() -> Void)? = nil
    ) {
        guard alpha != 1 else { return }
        UIView.animate(withDuration: duration) { [weak self] in
            self?.alpha = 1
        } completion: { _ in
            completion?()
        }
    }
    
    func hide(
        duration: TimeInterval = 0.3,
        completion: (() -> Void)? = nil
    ) {
        guard alpha != 0 else { return }
        UIView.animate(withDuration: duration) { [weak self] in
            self?.alpha = 0
        } completion: { _ in
            completion?()
        }
    }
    
    func highlight(duration: TimeInterval = 0.3) {
        show(duration: duration) { [weak self] in
            self?.hide(duration: duration)
        }
    }
    
    var isShown: Bool { alpha == 1 }
}


