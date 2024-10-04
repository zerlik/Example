//
//  RegisterForgotPasswordView.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit
import Combine

final class RegisterForgotPasswordView: NibView {
    
    var onTap: AnyPublisher<Void, Never> {
        button.tapPublisher.eraseToAnyPublisher()
    }
    
    private let button: NibButton = {
        let button = NibButton()
        button.backgroundColor = .clear
        button.setAttributedTitle(Localization.Auth.registerTForgot.underline(), for: .normal)
        button.setTitleColor(.mainBlack, for: .normal)
        button.titleLabel?.font = .textStyle14r
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

private extension RegisterForgotPasswordView {
    
    func constructHierarchy() {
        self.addSubviews(button)
    }
    
    func activateConstraints() {
        button.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    func style() {
        backgroundColor = .clear
    }
}
