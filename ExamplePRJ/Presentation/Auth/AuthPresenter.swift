//
//  AuthPresenter.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import Foundation
import Combine

protocol OutputAuthRemoteDataManagerProtocol: AnyObject {
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
       
//        Task {
//            let res = await repository.authSignUp(request: AuthSignUpRequest(phoneEmail: email ?? "", password: password ?? ""))
//
//            DispatchQueue.main.async { [weak self] in
//                self?.stopLoader.send()
////                guard res.veryficationType == "email" else {
////                    // TODO: Show allert with error
////                    return
////                }
//                self?.actions.navigateToApp()
//            }
//        }
    }
}

extension AuthPresenter: OutputAuthRemoteDataManagerProtocol{
    
}
