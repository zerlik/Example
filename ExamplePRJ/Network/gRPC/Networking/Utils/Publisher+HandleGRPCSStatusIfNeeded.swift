//
//  Publisher+HandleGRPCSStatusIfNeeded.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 09/10/2024.
//

import GRPC
import Combine

extension Publisher {
    func handleGRPCSStatusIfNeeded(_ grpcHandler: GRPCStatusHandler) -> Publishers.MapError<Publishers.TryCatch<Self, Empty<Self.Output, APIError>>, APIError> where Failure == APIError {
        tryCatch { error in
            if grpcHandler.handleAuthStatus(error.asGRPCStatus) {
                return Empty<Output, APIError>()
            }
            throw error
        }
        .mapError { $0.asAPIError ?? .empty }
    }
}
