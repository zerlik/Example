//
//  HomeViewController.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 13/10/2024.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {

}

final class HomeViewController: NibViewController {

    private var presenter: HomePresenterProtocol?

    init(presenter: HomePresenterProtocol?) {
        self.presenter = presenter
        super.init()
    }

    override func loadView() {
        view = HomeRootView(presenter)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

extension HomeViewController: HomeViewControllerProtocol {

}



