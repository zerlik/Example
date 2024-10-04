//
//  RegisterButtonView.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit
import Combine

final class RegisterButtonView: NibView {
    
    var onTapSignUp: AnyPublisher<Void, Never> {
        buttonSignUp.tapPublisher.eraseToAnyPublisher()
    }
    var onTapApple: AnyPublisher<Void, Never> {
        buttonApple.tapPublisher.eraseToAnyPublisher()
    }
    var onTapGoogle: AnyPublisher<Void, Never> {
        buttonGoogle.tapPublisher.eraseToAnyPublisher()
    }
    
    private let mainStack = UIStackView(axis: .vertical, spacing: 8)
    
    private let buttonSignUp: NibButton = {
        let button = NibButton()
        button.backgroundColor = .mainBlack
        button.titleLabel?.font = .textStyle14b
        button.setTitleColor(.white, for: .normal)
        button.setTitle(Localization.Auth.registerSignUp, for: .normal)
        button.cornerRadius = 8
        return button
    }()
    
    private let separatorView = SeparatorView()
    
    private let buttonApple = NibButton(configuration: .primaryUnfilled(title: Localization.Auth.registerApple, font: UIFont.textStyle14r, image: AssetManager.Auth.logoApple, imagePlacement: .leading, foregroundColor: UIColor.mainBlack, cornerRadius: 8, borderColor: UIColor.mainGray))
     
    private let buttonGoogle = NibButton(configuration: .primaryUnfilled(title: Localization.Auth.registerGoogle, font: UIFont.textStyle14r, image: AssetManager.Auth.logoGoogle, imagePlacement: .leading, foregroundColor: UIColor.mainBlack, cornerRadius: 8, borderColor: UIColor.mainGray))
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        super.init(frame: .zero)
        constructHierarchy()
        activateConstraints()
        style()
    }
}

private extension RegisterButtonView {
    
    func constructHierarchy() {
        addSubview(mainStack)
        mainStack.addArrangedSubviews(buttonSignUp, separatorView, buttonApple, buttonGoogle)
    }
    
    func activateConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(18)
        }
        
        buttonSignUp.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
    }
    
    func style() {
        backgroundColor = .clear
    }
}

private class SeparatorView: NibView {
    
    private let mainStack = UIStackView(axis: .horizontal, spacing: 8, alignment: .center)
    
    private let titleLabel = UILabel(
        text: Localization.Auth.registerOr.uppercased(),
        font: UIFont.textStyle12b,
        color: UIColor.mainLightgrayBorder,
        alignment: .center
    )
    
    private let grayLeftView = UIView()
    private let grayRightView = UIView()
    
    init() {
        super.init(frame: .zero)
        constructHierarchy()
        activateConstraints()
        style()
    }
}

private extension SeparatorView {
    func constructHierarchy() {
        addSubview(mainStack)
        mainStack.addArrangedSubviews(grayLeftView, titleLabel, grayRightView)
    }
    
    func activateConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        grayLeftView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        grayRightView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(grayLeftView)
        }
    }
    
    func style() {
        grayLeftView.backgroundColor = UIColor.mainLightgrayBorder
        grayRightView.backgroundColor = UIColor.mainLightgrayBorder
        backgroundColor = .clear
    }
}
