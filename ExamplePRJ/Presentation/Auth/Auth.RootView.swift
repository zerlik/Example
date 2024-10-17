//
//  AuthRootView.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit
import Combine
import AVFoundation
import ZSWTappableLabel

final class AuthRootView: NibView {
    
    private let  presenter: AuthPresenterProtocol?
    private var subscriptions = Set<AnyCancellable>()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = AssetManager.Auth.logo
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let termsAndConditionsLabel = ZSWTappableLabel()
    private let mainStack = UIStackView(axis: .vertical, spacing: 28)
    private let textfieldsStack = UIStackView(axis: .vertical, spacing: 0)
    private let emailTextFieldsView = RegisterTextFieldView()
    private let passwordTextFieldsView = RegisterTextFieldView()
    private let forgotPasswordView = RegisterForgotPasswordView()
    private let agreeRecevedView = RegisterAgreeRecevedView()
    private let buttonsView = RegisterButtonView()
    private let footerView = RegisterFooterView()
    private let forgotLabel = UILabel(
        font: .textStyle20b,
        alignment: .center
    )
    
    private lazy var activityView = UIActivityIndicatorView(style: .large)
    
    init(_ presenter: AuthPresenterProtocol?) {
        self.presenter = presenter
        super.init(frame: .zero)
        constructHierarchy()
        activateConstraints()
        style()
        bind()
    }
    
    deinit {
    }
}

private extension AuthRootView {
    
    func constructHierarchy() {
        addSubviews(mainStack, activityView)
        mainStack.addArrangedSubviews(imageView,
                                      textfieldsStack,
                                      .spacer(.height(0)),
                                      agreeRecevedView,
                                      buttonsView,
                                      termsAndConditionsLabel,
                                      footerView)
        textfieldsStack.addArrangedSubviews(emailTextFieldsView,
                                            .spacer(.height(16)),
                                            passwordTextFieldsView,
                                            forgotPasswordView)
    }
    
    func activateConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(safeAreaInsets).inset(130)
            make.bottom.equalTo(safeAreaInsets).inset(30)
            make.horizontalEdges.equalTo(safeAreaInsets).inset(30)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(64)
            make.width.equalTo(44)
        }
        activityView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func style() {
        footerView.buttonText = Localization.Auth.registerLogin
        footerView.text = Localization.Auth.registerHaveAccount
        setupTermsConditionsLabel()
        emailTextFieldsView.title = Localization.Auth.registerEmail
        emailTextFieldsView.placeholder = Localization.Auth.registerEmailPlaceholder
        passwordTextFieldsView.title = Localization.Auth.registerPassw
        passwordTextFieldsView.placeholder = Localization.Auth.registerPassPlaceholder
        mainStack.backgroundColor = .clear
    }
    
    func bind(){
        //MARK: for SignUP txfields + button
        let passPub = CurrentValueSubject<String?,Never>("")
        let emailPub = CurrentValueSubject<String?,Never>("")
        passwordTextFieldsView.textPublisher.sink { val in
            passPub.send(val)
        }.store(in: &subscriptions)
        emailTextFieldsView.textPublisher.sink { val in
            emailPub.send(val)
        }.store(in: &subscriptions)
        buttonsView
            .onTapSignUp
            .sink { [weak self] _ in
                self?.presenter?.onTapSignUp(emailPub.value, passPub.value)
            }.store(in: &subscriptions)
        
        forgotPasswordView
            .onTap
            .sink { [weak self] _ in
                self?.presenter?.onTapForgotPassword()
            }.store(in: &subscriptions)
        
        agreeRecevedView
            .onTap
            .sink { [weak self] _ in
                self?.presenter?.onTapAgreeReceved()
            }.store(in: &subscriptions)
        
        buttonsView
            .onTapApple
            .sink { [weak self] _ in
                self?.presenter?.onTapApple()
            }
            .store(in: &subscriptions)
        
        buttonsView
            .onTapGoogle
            .sink { [weak self] _ in
                self?.presenter?.onTapGoogle()
            }
            .store(in: &subscriptions)
       
        presenter?.stopLoader
                    .sink { [weak self] in
                        self?.activityView.stopAnimating()
                    }
                    .store(in: &subscriptions)
        presenter?.startLoader
                    .sink { [weak self] in
                        self?.activityView.startAnimating()
                    }
                    .store(in: &subscriptions)
        
        //MARK: If nesessary Active validation
//        passwordTextFieldsView
//            .textPublisher
//            .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
//            .compactMap { $0 }
//            .sink(receiveValue: { [weak self] password in
//               print(password)
//            })
//            .store(in: &subscriptions)
//        emailTextFieldsView
//            .textPublisher
//            .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
//            .compactMap { $0 }
//            .sink(receiveValue: { [weak self] email in
//                print(email)
//            })
//            .store(in: &subscriptions)
    }
}

// MARK: - Setup Terms and Conditions label
private extension AuthRootView {
    private func setupTermsConditionsLabel() {
        let fullText = NSString(string: Localization.Auth.registerTermsFull)
        let termsText = Localization.Auth.registerTerms
        let conditions = Localization.Auth.registerConditions
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 3
        style.alignment = .left
        let attributedString = NSMutableAttributedString(string: fullText as String,
                                                         attributes: [.font : UIFont.textStyle12r,
                                                            .foregroundColor : UIColor.mainGray,
                                                                      .paragraphStyle : style])
        let colorAttribute: [NSAttributedString.Key : Any] = [.font : UIFont.textStyle12r,
                                                              NSAttributedString.Key.foregroundColor : UIColor.mainGray,
                                                              .paragraphStyle : style,
                                                              .tappableRegion : true,
                                                              .tappableHighlightedBackgroundColor : UIColor.clear,
                                                              .tappableHighlightedForegroundColor : UIColor.mainGray,
                                                              .underlineStyle : NSUnderlineStyle.single.rawValue,
                                                              .underlineColor : UIColor.mainGray]
        
        var termsAttribute = colorAttribute
        termsAttribute[.tappableType] = TappableAttributeType.terms
        let termsRange = fullText.range(of: termsText)
        attributedString.setAttributes(termsAttribute, range: termsRange)
        
        var conditionsAttribute = colorAttribute
        conditionsAttribute[.tappableType] = TappableAttributeType.conditions
        let conditionsRange = fullText.range(of: conditions)
        attributedString.setAttributes(conditionsAttribute, range: conditionsRange)
        
        termsAndConditionsLabel.attributedText = attributedString
        
        termsAndConditionsLabel.tapDelegate = self
        termsAndConditionsLabel.numberOfLines = 0
        termsAndConditionsLabel.isUserInteractionEnabled = true
        termsAndConditionsLabel.textAlignment = .center
    }
}

// MARK: - ZSWTappableLabelTapDelegate
extension AuthRootView: ZSWTappableLabelTapDelegate {
    func tappableLabel(_ tappableLabel: ZSWTappableLabel, tappedAt idx: Int, withAttributes attributes: [NSAttributedString.Key : Any] = [:]) {
        guard let type = attributes[.tappableType] as? TappableAttributeType else { return }
    
        switch type {
        case .terms:
            guard let url = URL(string: Constants.linkTerms) else { return }
            UIApplication.shared.open(url)
        case .conditions:
            guard let url = URL(string: Constants.linkConditions) else { return }
            UIApplication.shared.open(url)
        }
    }
}

fileprivate enum TappableAttributeType {
    case conditions
    case terms
}

fileprivate extension NSAttributedString.Key {
    static let tappableType: NSAttributedString.Key = .init("tappableType")
}

fileprivate struct TappableAttributeObject {
    let string: String
    let type: TappableAttributeType
}
