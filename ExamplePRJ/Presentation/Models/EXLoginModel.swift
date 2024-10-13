//
//  EXLoginModel.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 08/10/2024.
//

import Foundation

final class LoginModel {

    public var message: String?
    public var token: String?
    public var user: UserModel?

    public init() {

    }

    public init(message: String?, token: String?, user: UserModel?) {
        self.message = message
        self.token = token
        self.user = user
    }
}
