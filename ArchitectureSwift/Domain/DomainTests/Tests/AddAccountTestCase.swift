//
//  AddAccountTest.swift
//  Domain
//
//  Created by Willian Guedes on 22/06/22.
//

import Foundation

protocol AddAccountLogic {
    func addUser(user: AccountModel.Request, completion: @escaping (Result<AccountModel.Response, Error>) -> Void)
}
