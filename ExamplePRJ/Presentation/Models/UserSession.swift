//
//  UserSession.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

final class UserSession {

    enum AuthState {
        case authorized
        case noAuthorized
    }

    var authState: AuthState = .noAuthorized

    init(){}
}


