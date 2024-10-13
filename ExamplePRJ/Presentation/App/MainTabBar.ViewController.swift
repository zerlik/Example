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

    init(
        presenter: MainTabBarPresenterProtocol
    ) {
        self.presenter = presenter
        super.init()
        constructHierarchy()
//        delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didLoad()
        view.backgroundColor = .yellow
        bind()
    }
}

private extension MainTabBarViewController {

    func constructHierarchy() {
//        var vcs: [UIViewController] = []
//
//        let homeVC = factory.makeHomeNavigationController()
//        homeVC.tabBarItem = UITabBarItem(
//            title: Localization.TabBar.home,
//            image: .checkmark,
//            selectedImage: nil
//        )
//        vcs.append(homeVC)
//
//        let listVC = factory.makeHomeNavigationController()
//        listVC.tabBarItem = UITabBarItem(
//            title: Localization.TabBar.list,
//            image: .checkmark,
//            selectedImage: nil
//        )
//        vcs.append(listVC)
//        let home = viewControllers.first 
    }

    func bind() {
//        viewModel
//            .$navigationAction
//            .removeDuplicates()
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] action in self?.respond(to: action) }
//            .store(in: &subscriptions)
    }

//    func respond(to navigationAction: SignedInNavigationAction) {
//        switch navigationAction {
//            case .present(let view):
//                show(view)
//            case .presented:
//                break
//        }
//    }

    func show(_ view: MainTabBarView) {
//        selectedViewController = viewController(associatedWith: view)
    }

//    func viewController(associatedWith view: SignedInView) -> UIViewController? {
//        viewControllers?.first(where: { vc in
//            switch view {
//            case .home: return vc is HomeNavigationController
//            case .account: return vc is AccountNavigationController
//            case .cmr: return vc is HomeNavigationController
//            case .search: return vc is HomeNavigationController
//            case .garage: return vc is HomeNavigationController
//            }
//        })
//    }

//    func signedInView(associatedWith viewController: UIViewController) -> SignedInView? {
//        switch viewController {
//        case is HomeNavigationController: return .home
//        case is AccountNavigationController: return .account
//        default:
//            assertionFailure("Encountered unexpected child view controller type")
//            return nil
//        }
//    }
}

extension MainTabBarViewController: MainTabBarViewControllerProtocol{}

extension MainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        guard let shownView = signedInView(associatedWith: viewController) else { return }
//        viewModel.uiPresented(shownView: shownView)
//        HapticGenerator.button()
    }
}

