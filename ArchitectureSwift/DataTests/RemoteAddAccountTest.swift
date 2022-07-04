//
//  DataTests.swift
//  DataTests
//
//  Created by Willian Guedes on 23/06/22.
//

import XCTest
import Domain
@testable import Data

class RemoteAddAccount {
    private let url: URL
    private let httpPostClient: HttpPostClient
    
    init(url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpPostClient = httpClient
    }
    
    func add (addAccount: AccountModel.Request) {
        httpPostClient.post(to: url, with: addAccount.toData())
    }
}

protocol HttpPostClient {
    func post(to url: URL, with data: Data?)
}

class RemoteAddAccountTest: XCTestCase {
    func testAddShouldCallHttpClientWithCorrectURL() {
        let url = URL(string: "https://google.com")!
        let (sut, httpClientSpy) = self.makeSut(url: url)
        sut.add(addAccount: self.makeAddAccount())
        
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    func testAddShouldCallHttpClientWithCorrectData() {
        let (sut, httpClientSpy) = self.makeSut()
        sut.add(addAccount: self.makeAddAccount())

        XCTAssertEqual(httpClientSpy.data, self.makeAddAccount().toData())
    }
}
