//
//  MainViewController.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
   
}

final class MainViewController: NibViewController {
    
    private var presenter: MainPresenterProtocol?
    
    init(presenter: MainPresenterProtocol?) {
        self.presenter = presenter
        super.init()
    }
    
    override func loadView() {
        view = MainRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        presenter?.didLoad()
    }
    
    @objc private func authButtonAction(){
//        self.presentAuthViewController()
    }
    
    @objc private func appButtonAction(){
//        self.presentSignedInViewController()
    }
}

extension MainViewController: MainViewControllerProtocol {
    
}
