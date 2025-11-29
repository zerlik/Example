//
//  APIError.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 11/10/2024.
//

import Foundation
import GRPC

struct APIError: LocalizedError {
    var title: String?
    var message: String?
    var underlyingError: Error?
    let isUnhandled: Bool

    init(title: String? = nil, message: String? = nil, underlyingError: Error? = nil, isUnhandled: Bool = false) {
        self.title = title
        self.message = message
        self.underlyingError = underlyingError
        self.isUnhandled = isUnhandled
    }

    var errorDescription: String { message ?? (underlyingError as? GRPCStatus)?.message ?? underlyingError?.localizedDescription ?? localizedDescription }
    var asGRPCStatus: GRPCStatus? { underlyingError as? GRPCStatus }
    var isNotEmpty: Bool { title?.isNotEmptyOrWhitespace == true || message?.isNotEmptyOrWhitespace == true }
}

extension APIError {
    static let empty = APIError()
}

extension Error {
    var asAPIError: APIError? { self as? APIError }
    var asGRPCStatus: GRPCStatus? { self as? GRPCStatus }
}
