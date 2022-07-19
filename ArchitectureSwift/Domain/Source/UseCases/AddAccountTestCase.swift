//
//  AddAccountTest.swift
//  Domain
//
//  Created by Willian Guedes on 22/06/22.
//

import Foundation

public protocol AddAccountLogic {
    func add(addAccountModel: AccountModel.Request, completion: @escaping (Result<AccountModel.Response, DomainError>) -> Void)
}
