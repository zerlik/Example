//
//  AuthPresenter.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import Foundation
import Combine

protocol OutputAuthRemoteDataManagerProtocol: AnyObject {
    func networkStatus(status: NetworkAuthStatus)
}

protocol AuthPresenterProtocol: AnyObject {
    var view: AuthViewControllerProtocol? { get set }
    var repository: InputAuthRemoteDataManagerProtocol?{ get set }
    var router: AuthRouterProtocol?{ get set }
    func didLoad()
    func onTapForgotPassword()
    func onTapAgreeReceved()
    func onTapApple()
    func onTapGoogle()
    func onTapSignUp(_ email: String?, _ password: String?)
    
    var startLoader: PassthroughSubject<Void, Never> { get }
    var stopLoader: PassthroughSubject<Void, Never>{ get }
}

final class AuthPresenter: AuthPresenterProtocol {
    
    weak var view: AuthViewControllerProtocol?
    var repository: InputAuthRemoteDataManagerProtocol?
    var router: AuthRouterProtocol?
    
    let startLoader = PassthroughSubject<Void, Never>()
    let stopLoader = PassthroughSubject<Void, Never>()
    
    init(){}
    
    func didLoad(){
    }
    
    func onTapForgotPassword() {
        print("forgotPassword")
    }
    
    func onTapAgreeReceved() {
        print("agreeReceved")
    }
    
    func onTapApple() {
        print("onTapApple")
    }
    
    func onTapGoogle() {
        print("onTapGoogle")
    }
    
    func onTapSignUp(_ email: String?, _ password: String?){
        guard AuthValidation.emailIsValid(email), AuthValidation.passwordIsValid(password) else {
            // TODO: Show allert with validation error
            return
        }
        // TODO: validate checked onTapAgreeReceved
        
        startLoader.send()
        repository?.registrationEmail(email: email ?? "", password: password ?? "")
    }
}

extension AuthPresenter: OutputAuthRemoteDataManagerProtocol{
    
    func networkStatus(status: NetworkAuthStatus){
        DispatchQueue.main.async {
            self.stopLoader.send()
        }
        
        switch status {
        case .successRegistration, .successLogin:
            self.router?.navigate(to: .dissmiss)
        case .errors(let message):
            print("ERROR--- \(message)")
        case .noNetwork:
            print("ERROR--- NO Inet")
        }
    }
}

enum NetworkAuthStatus {
    case successRegistration
    case successLogin
    case errors( message: String)
    case noNetwork
}
