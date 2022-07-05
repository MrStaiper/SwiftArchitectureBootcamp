//
//  RemoteAddAccount.swift
//  Data
//
//  Created by Willian Guedes on 03/07/22.
//

import Foundation
import Domain

public final class RemoteAddAccount {
    private let url: URL
    private let httpPostClient: HttpPostClient
    
    public init(url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpPostClient = httpClient
    }
    
    public func add (addAccount: AccountModel.Request) {
        httpPostClient.post(to: url, with: addAccount.toData())
    }
}
