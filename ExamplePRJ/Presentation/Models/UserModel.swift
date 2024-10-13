//
//  UserModel.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 08/10/2024.
//

import Foundation

class UserModel {

    public var name: String?
    public var email: String?
    public var gender: String?
    public var userId: String?
    public var rawUserId: String?
    public var hasApprovedPolicies: Int?

    public init() {

    }

    public init(name: String?, email: String?, gender: String?, userId: String?, rawUserId: String?, hasApprovedPolicies: Int?) {
        self.name = name
        self.email = email
        self.gender = gender
        self.userId = userId
        self.rawUserId = rawUserId
        self.hasApprovedPolicies = hasApprovedPolicies
    }

}

