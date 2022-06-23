//
//  UserModel.swift
//  Domain
//
//  Created by Willian Guedes on 22/06/22.
//

import Foundation

struct AccountModel {
    struct Request {
        var name: String?
        var email: String?
        var password: String?
        var passwordConfirm: String?
    }
    
    struct Response {
        var id: String?
        var name: String?
        var email: String?
        var password: String?
    }
    
    struct ViewModel {
        
    }
}
