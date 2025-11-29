//
//  RegisterAgreeRecevedView.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit
import Combine

final class RegisterAgreeRecevedView: NibView {
    
    var onTap: AnyPublisher<Void, Never> {
        button.tapPublisher.eraseToAnyPublisher()
    }
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = AssetManager.Auth.check
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let titleLabel = UILabel(
        text: Localization.Auth.registerText,
        font: .textStyle14r,
        color: .mainGray,
        alignment: .left,
        numberOfLines: 0
    )
    
    private let button: NibButton = {
        let button = NibButton()
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

extension RegisterAgreeRecevedView {
    
}

private extension RegisterAgreeRecevedView {
    func constructHierarchy() {
        self.addSubviews(imageView, titleLabel, button)
    }
    
    func activateConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(2)
            make.size.equalTo(20)
        }
        titleLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
        }
        button.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
    
    func style() {
        backgroundColor = .clear
    }
}
