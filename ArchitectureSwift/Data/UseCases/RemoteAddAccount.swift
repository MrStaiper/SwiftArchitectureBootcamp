//
//  RemoteAddAccount.swift
//  Data
//
//  Created by Willian Guedes on 03/07/22.
//

import Foundation
import Domain

public final class RemoteAddAccount: AddAccountLogic {
    private let url: URL
    private let httpPostClient: HttpPostClient
    
    public init(url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpPostClient = httpClient
    }
    
    public func add (addAccountModel: AccountModel.Request, completion: @escaping (Result<AccountModel.Response, DomainError>) -> Void) {
        httpPostClient.post(to: url, with: addAccountModel.toData()) { error in
            completion(.failure(.unexpected))
        }
    }
}
