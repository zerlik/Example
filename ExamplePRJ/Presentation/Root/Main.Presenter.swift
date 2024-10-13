//
//  MainPresenter.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//

import Foundation

protocol OutputMainRemoteDataManagerProtocol: AnyObject {
   
}

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewControllerProtocol? { get set }
    var repository: InputMainRemoteDataManagerProtocol?{ get set }
    var router: MainRouterProtocol?{ get set }
    func didLoad()
}

final class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewControllerProtocol?
    var repository: InputMainRemoteDataManagerProtocol?
    var router: MainRouterProtocol?
    
    init(){}
    
    func didLoad ( ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.router?.navigate(to: .auth)
        }

//        router?.navigate(to: .appTabBar)
    }
}

extension MainPresenter: OutputMainRemoteDataManagerProtocol{
    
}
