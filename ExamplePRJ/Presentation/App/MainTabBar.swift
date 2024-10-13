//
//  MainTabBar.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import UIKit
import Combine

protocol MainTabBarActions {
    func middleButtonTapped()
    func selectTab(_ tab: MainTabBarView)
}

class MainTabBar: NibTabBar {

    private let actions: MainTabBarActions

    private var subscriptions = Set<AnyCancellable>()

    private var middleButton = NibButton()
    private var shapeLayer: CALayer?

    init(actions: MainTabBarActions) {
        self.actions = actions
        super.init(frame: .zero)

        constructHierarchy()
        style()
        bind()
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if isHidden { return super.hitTest(point, with: event) }
        let from = point
        let to = middleButton.center
        return sqrt((from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)) <= 40 ? middleButton : super.hitTest(point, with: event)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let screenWidth = UIScreen.main.bounds.width
        middleButton.center = CGPoint(x: screenWidth / 2, y: 10)
    }

    override func draw(_ rect: CGRect) {
        addShape()
    }
}

private extension MainTabBar {
    func constructHierarchy() {
        addSubview(middleButton)
    }

    func style() {
        middleButton.setImage(AssetManager.TabBar.add, for: UIControl.State.normal)
        middleButton.frame.size = CGSize(width: 80, height: 80)
        middleButton.layer.masksToBounds = true
    }

    func bind() {
        middleButton
            .publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                self?.actions.middleButtonTapped()
            }
            .store(in: &subscriptions)
    }

    func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.clear.cgColor
        let tabBackColor = UIColor.red
        shapeLayer.fillColor = tabBackColor.cgColor
        shapeLayer.shadowOffset = .zero
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.mainGray.cgColor
        shapeLayer.shadowOpacity = 0.15

        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }

    func createPath() -> CGPath {
        let height: CGFloat = 30.0
        let path = UIBezierPath()
        let centerWidth = frame.width / 2

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - 40), y: 0))

        path.addCurve(
            to: CGPoint(x: centerWidth, y: -height),
            controlPoint1: CGPoint(x: (centerWidth - 40), y: 0),
            controlPoint2: CGPoint(x: (centerWidth - 30), y: -height)
        )

        path.addCurve(
            to: CGPoint(x: (centerWidth + 40), y: 0),
            controlPoint1: CGPoint(x: (centerWidth + 30), y: -height),
            controlPoint2: CGPoint(x: (centerWidth + 40), y: 0)
        )

        path.addLine(to: CGPoint(x: frame.width, y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        path.close()

        return path.cgPath
    }
}
