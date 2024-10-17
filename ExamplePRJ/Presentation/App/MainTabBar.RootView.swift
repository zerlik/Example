//
//  MainTabBarRootView.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import UIKit
import Combine

final class MainTabBarRootView: NibView {

    private var subscriptions = Set<AnyCancellable>()

    var onTapHome: AnyPublisher<Void, Never> {
        buttonHome.tapPublisher.eraseToAnyPublisher()
    }
    var onTapList: AnyPublisher<Void, Never> {
        buttonList.tapPublisher.eraseToAnyPublisher()
    }
    var onTapAdd: AnyPublisher<Void, Never> {
        buttonAdd.tapPublisher.eraseToAnyPublisher()
    }

    private let mainStack = UIStackView(axis: .horizontal, spacing: 8)

    private enum Buttons{
        case home
        case list
        case add
    }

    private let buttonHome = NibButton(configuration:
            .primaryUnfilled(title: Localization.TabBar.home,
                             font: UIFont.textStyle12r,
                             image: AssetManager.TabBar.home,
                             imagePlacement: .top,
                             backgroundColor: .white,
                             foregroundColor: UIColor.white))

    private let buttonList = NibButton(configuration:
            .primaryUnfilled(title: Localization.TabBar.list,
                             font: UIFont.textStyle12r,
                             image: AssetManager.TabBar.list,
                             imagePlacement: .top,
                             backgroundColor: .white,
                             foregroundColor: UIColor.white))

    private let buttonAdd = NibButton(configuration:
            .primaryUnfilled(title: Localization.TabBar.add,
                             font: UIFont.textStyle12r,
                             image: AssetManager.TabBar.add,
                             imagePlacement: .top,
                             backgroundColor: .clear,
                             foregroundColor: UIColor.white))

    init() {
        super.init(frame: .zero)
        constructHierarchy()
        activateConstraints()
        style()
        bind()
    }
}

private extension MainTabBarRootView {

    func constructHierarchy() {
        addSubviews(mainStack)
        mainStack.addArrangedSubviews(buttonHome,
                                      buttonList,
                                      buttonAdd)
    }

    func activateConstraints() {
        mainStack.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
        buttonHome.snp.makeConstraints { make in
            make.size.equalTo(buttonList.snp.size)
            make.size.equalTo(buttonAdd.snp.size)
            make.size.equalTo(44)
        }
    }

    func style() {
        mainStack.backgroundColor = .mainBlack
    }

    func bind(){
        onTapHome
            .sink { [weak self] _ in
                self?.setButtonHighlighted(name: .home)
            }
            .store(in: &subscriptions)
        onTapList
            .sink { [weak self] _ in
                self?.setButtonHighlighted(name: .list)
            }
            .store(in: &subscriptions)
        onTapAdd
            .sink { [weak self] _ in
                self?.setButtonHighlighted(name: .add)
            }
            .store(in: &subscriptions)
    }

    private func setButtonHighlighted(name: Buttons){
        DispatchQueue.main.async {
            self.buttonAdd.isHighlighted = name == .add
            self.buttonHome.isHighlighted = name == .home
            self.buttonList.isHighlighted = name == .list
        }
    }
}
