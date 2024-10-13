//
//  Protocols.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 12/10/2024.
//

import GRPC

protocol GRPCService {
    func userServiceClient() -> UserService
}

protocol GRPCStatusHandler {
    func handleAuthStatus(_ status: GRPC.GRPCStatus?) -> Bool
}
