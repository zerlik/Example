//
//  AuthRepository.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import Combine

protocol InputAuthRemoteDataManagerProtocol: AnyObject{
    func registrationEmail(email: String, password: String)
    func loginEmail(email: String, password: String)
}

final class AuthRepository : InputAuthRemoteDataManagerProtocol{
  
    private weak var output: OutputAuthRemoteDataManagerProtocol?
    private let service: NetworkProvider
    var cancellables = Set<AnyCancellable>()
    
    init(_ output: OutputAuthRemoteDataManagerProtocol?, service: NetworkProvider){
        self.output = output
        self.service = service
    }
    
    func registrationEmail(email: String, password: String) {
        let model = RegistrationModelRequest(password: password, email: email)
        guard let data = CodingTool.encode(model: model) else {
//            self.output?.networkStatus(status: .errors(message: Localization.ErrorsUI.somethingWrong))
            return
        }
        let registration = service.makeAuthNetwork().registration(requestData: data, registrationToken: "Bla-Bla")
        
        registration?.sink(receiveCompletion: { [weak self] status in
            switch status {
            case .failure( let error):
                self?.output?.networkStatus(status: .errors(message: "somethingWrong"))
            case .finished:
                break
            }
        }, receiveValue: { tokenModel in
            // TODO: save token in keychain
            self.output?.networkStatus(status: .successRegistration)
        }).store(in: &self.cancellables)
    }
    
    func loginEmail(email: String, password: String) {
        
    }
    

}
