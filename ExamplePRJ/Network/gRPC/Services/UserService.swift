//
//  UserService.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 12/10/2024.
//

import GRPC
import Combine

protocol UserService: GRPCStatusHandler {
    func addUser(request: ClientsInfoRequest) -> AnyPublisher<AddClientReply, APIError>
    func getUsers() -> AnyPublisher<GetClientsReply, APIError>
    func getUserByLogin(request: GetClientByLoginRequest) -> AnyPublisher<GetClientsReply, APIError>
}

struct DefaultUserService: UserService {
    private let asyncClient: GrpcExampleServiceAsyncClientProtocol

    init(asyncClient: GrpcExampleServiceAsyncClientProtocol) {
        self.asyncClient = asyncClient
    }

    func addUser(request: ClientsInfoRequest) -> AnyPublisher<AddClientReply, APIError> {
        Future(asyncFunc: {
            try await self.asyncClient.addClient(request, callOptions: nil)
        })
        .handleGRPCSStatusIfNeeded(self)
        .eraseToAnyPublisher()
    }

    func getUsers() -> AnyPublisher<GetClientsReply, APIError> {
        Future(asyncFunc: {
            try await self.asyncClient.getClients(EmptyRequest())
        })
        .handleGRPCSStatusIfNeeded(self)
        .eraseToAnyPublisher()
    }

    func getUserByLogin(request: GetClientByLoginRequest) -> AnyPublisher<GetClientsReply, APIError> {
        Future(asyncFunc: {
            try await self.asyncClient.getClientByLogin(request)
        })
        .handleGRPCSStatusIfNeeded(self)
        .eraseToAnyPublisher()
    }

    func handleAuthStatus(_ status: GRPC.GRPCStatus?) -> Bool {
        guard status?.code == .unauthenticated else { return false }
        return true
    }
}
