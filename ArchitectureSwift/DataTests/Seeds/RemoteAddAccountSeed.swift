//
//  RemoteAddAccountSeed.swift
//  DataTests
//
//  Created by Willian Guedes on 03/07/22.
//

import Foundation
import Domain

extension RemoteAddAccountTest {
    
    func makeAddAccount() -> AccountModel.Request {
        return AccountModel.Request(name: "any_name", email: "any_email@email.com", password: "any_password", passwordConfirm: "any_password")
    }
    
}
