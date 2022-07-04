//
//  RemoteAddAccountSeed.swift
//  DataTests
//
//  Created by Willian Guedes on 03/07/22.
//

import Foundation
import Domain
import Data

extension RemoteAddAccountTest {
    
    func makeSut(url: URL = URL(string: "https://google.com")!) -> (sut: RemoteAddAccount, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        
        return (sut, httpClientSpy)
    }
    
    func makeAddAccount() -> AccountModel.Request {
        return AccountModel.Request(name: "any_name", email: "any_email@email.com", password: "any_password", passwordConfirm: "any_password")
    }
}
