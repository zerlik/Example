//
//  EventsListRootView.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import UIKit
import Combine

final class EventsListRootView: NibView {

    private let  presenter: EventsListPresenterProtocol?
    private var subscriptions = Set<AnyCancellable>()

    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = AssetManager.Auth.logo
        view.contentMode = .scaleAspectFit
        return view
    }()

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

    init(_ presenter: EventsListPresenterProtocol?) {
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

private extension EventsListRootView {

    func constructHierarchy() {
        addSubviews(mainStack, activityView)
        mainStack.addArrangedSubviews(imageView,
                                      textfieldsStack,
                                      .spacer(.height(0)),
                                      agreeRecevedView,
                                      buttonsView,
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

        emailTextFieldsView.title = Localization.Auth.registerEmail
        emailTextFieldsView.placeholder = Localization.Auth.registerEmailPlaceholder
        passwordTextFieldsView.title = Localization.Auth.registerPassw
        passwordTextFieldsView.placeholder = Localization.Auth.registerPassPlaceholder
        mainStack.backgroundColor = .clear
    }

    func bind(){
    }
}
