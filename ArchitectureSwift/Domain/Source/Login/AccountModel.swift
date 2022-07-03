//
//  UserModel.swift
//  Domain
//
//  Created by Willian Guedes on 22/06/22.
//

import Foundation

public struct AccountModel {
    public struct Request : Encodable {
        public var name: String
        public var email: String
        public var password: String
        public var passwordConfirm: String
        
        public init(name: String, email: String, password: String, passwordConfirm: String) {
            self.name = name
            self.email = email
            self.password = password
            self.passwordConfirm = passwordConfirm
        }
    }
    
    public struct Response {
        var id: String?
        var name: String?
        var email: String?
        var password: String?
    }
    
    public struct ViewModel {
        
    }
}
