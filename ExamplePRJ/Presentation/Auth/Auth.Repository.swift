//
//  AuthRepository.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import Combine

protocol InputAuthRemoteDataManagerProtocol: AnyObject{
    func registrationEmailREST(email: String, password: String)
    func addUserGRPC(login: String, city: String, email: String)
}

final class AuthRepository : InputAuthRemoteDataManagerProtocol{
  
    private weak var output: OutputAuthRemoteDataManagerProtocol?
    private let service: NetworkProvider
    
    var cancellables = Set<AnyCancellable>()
    
    init(_ output: OutputAuthRemoteDataManagerProtocol?, service: NetworkProvider){
        self.output = output
        self.service = service
    }

    //USING REST API
    func registrationEmailREST(email: String, password: String) {
        let model = RegistrationModelRequest(password: password, email: email)
        guard let data = CodingTool.encode(model: model) else {
//            self.output?.networkStatus(status: .errors(message: Localization.ErrorsUI.somethingWrong))
            return
        }
        let registration = service.makeAuthNetwork().registration(requestData: data, registrationToken: "Bla-Bla")
        
        registration?.sink(receiveCompletion: { [weak self] status in
            switch status {
            case .failure( _):
                self?.output?.networkStatus(status: .errors(message: "somethingWrong"))
            case .finished:
                break
            }
        }, receiveValue: { tokenModel in

            self.output?.networkStatus(status: .successRegistration)
        }).store(in: &self.cancellables)
    }
    
    //USING gRPC API 
    func addUserGRPC(login: String, city: String, email: String) {
        var requestModel: ClientsInfoRequest = ClientsInfoRequest()
        requestModel.clientsinfo = [ClientInfoRequest.with {
            $0.city = city
            $0.email = email
            $0.login = login
        }]

        let addUser = service.makeUserGRPCNetwork().addUser(request: requestModel)
        addUser.sink(receiveCompletion: { [weak self] status in
            switch status {
            case .failure( _):
                self?.output?.networkStatus(status: .errors(message: "somethingWrong"))
            case .finished:
                break
            }
        }, receiveValue: { responce in
            self.output?.networkStatus(status: .successRegistration)
        }).store(in: &self.cancellables)
    }
}
