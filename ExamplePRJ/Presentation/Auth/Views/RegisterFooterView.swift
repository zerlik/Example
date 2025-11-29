//
//  RegisterFooterView.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit
import Combine

final class RegisterFooterView: NibView {
    
    private let mainStack = UIStackView(axis: .horizontal, spacing: 4)
    
    var onTap: AnyPublisher<Void, Never> { button.tapPublisher.eraseToAnyPublisher() }
    
    private let leftLabel = UILabel(
        font: UIFont.textStyle14r,
        color: UIColor.mainBlack
    )
    
    private let button: NibButton = {
        let button = NibButton()
        button.titleLabel?.font = UIFont.textStyle14r
        button.setTitleColor( UIColor.black , for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        super.init(frame: .zero)
        constructHierarchy()
        activateConstraints()
        style()
    }
}

private extension RegisterFooterView {
    
    func constructHierarchy() {
        addSubviews(mainStack)
        mainStack.addArrangedSubviews(leftLabel, button)
    }
    
    func activateConstraints() {
        mainStack.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
    }
    
    func style() {
        backgroundColor = .clear
    }
}

extension RegisterFooterView {
    var text: String? {
        get { return leftLabel.text }
        set { leftLabel.text = newValue }
    }
    
    var buttonText: String? {
        get { return button.titleLabel?.text }
        set {
            if let str = newValue{
                button.setAttributedTitle(str.underline(), for: .normal)
            }
        }
    }
}
