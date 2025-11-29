//
//  MainTabBarViewController.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import UIKit
import Combine

protocol MainTabBarViewControllerProtocol: AnyObject {

}

final class MainTabBarViewController: NibTabBarController {

    private var presenter: MainTabBarPresenterProtocol?
    private var subscriptions = Set<AnyCancellable>()

    private(set) var customTabBarView = MainTabBarRootView()
    private let mainStack = UIStackView(axis: .vertical, spacing: 0)
    private let tabBarHeight: CGFloat = 80

    init(
        presenter: MainTabBarPresenterProtocol
    ) {
        self.presenter = presenter
        super.init()
        constructHierarchy()
        activateConstraints()
        style()
        bind()
        delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didLoad()
    }
}

private extension MainTabBarViewController {

    func constructHierarchy() {
        self.tabBar.isHidden = true
        self.view.addSubview(mainStack)
        mainStack.addArrangedSubviews(customTabBarView)
    }

    func bind() {
        customTabBarView.onTapHome
            .sink { [weak self] _ in
                self?.selectedIndex = 0
            }
            .store(in: &subscriptions)
        customTabBarView.onTapList
            .sink { [weak self] _ in
                self?.selectedIndex = 1
            }
            .store(in: &subscriptions)
        customTabBarView.onTapList
            .sink { [weak self] _ in
                self?.selectedIndex = 2
            }
            .store(in: &subscriptions)
    }

    func activateConstraints() {
        mainStack.snp.makeConstraints { make in
            make.height.equalTo(tabBarHeight)
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
    }

    func style() {
        view.backgroundColor = .clear
    }
}

extension MainTabBarViewController: MainTabBarViewControllerProtocol{}

extension MainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

    }
}

