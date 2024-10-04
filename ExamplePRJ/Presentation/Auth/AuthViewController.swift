//
//  AuthViewController.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit

protocol AuthViewControllerProtocol: AnyObject {
   
}

final class AuthViewController: NibViewController {
    
    private var presenter: AuthPresenterProtocol?
    
    init(presenter: AuthPresenterProtocol?) {
        self.presenter = presenter
        super.init()
    }
    
    override func loadView() {
        view = AuthRootView(presenter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    @objc private func authButtonAction(){
//        self.presentAuthViewController()
    }
    
    @objc private func appButtonAction(){
//        self.presentSignedInViewController()
    }
}

extension AuthViewController: AuthViewControllerProtocol {
    
}

