//
//  Future+Async.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 12/10/2024.
//

import Combine

extension Future where Failure == APIError {
    convenience init(asyncFunc: @escaping () async throws -> Output) {
        self.init { promise in
            Task {
                do {
                    let result = try await asyncFunc()
                    promise(.success(result))
                } catch {
                    var message = error.localizedDescription
                    if let grpcStatus = error.asGRPCStatus, let grpcMessage = grpcStatus.message {
                        if EnvironmentConfig.isNotProduction {
                            message = String(format: "%@ (%i)", grpcMessage, grpcStatus.code.rawValue)
                        } else {
                            message = grpcMessage
                        }
                    }
                    promise(.failure(APIError(message: message, underlyingError: error)))
                }
            }
        }
    }
}
