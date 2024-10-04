//
//  MainRootView.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//

import UIKit
import SnapKit

final class MainRootView: NibView {
    
    private let mainStackView = UIStackView(axis: .vertical)
    private let loadingImage = UIImageView(image: AssetManager.Auth.logo)
    
    private var activityView = UIActivityIndicatorView(style: .large)
    
    init() {
        super.init(frame: .zero)
        constructHierarchy()
        activateConstraints()
        style()
    }
    
    deinit {
    }
}

private extension MainRootView {
    
    private func constructHierarchy() {
        addSubviews(mainStackView, activityView)
        mainStackView.addArrangedSubviews(
            loadingImage
        )
    }
    
    func activateConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        activityView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func style() {
        backgroundColor = .clear
        mainStackView.backgroundColor = .clear
        loadingImage.backgroundColor = .clear
        loadingImage.contentMode = .scaleAspectFit
        activityView.startAnimating()
    }
}

