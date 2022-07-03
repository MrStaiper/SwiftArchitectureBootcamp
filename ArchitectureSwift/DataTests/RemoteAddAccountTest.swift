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
        let data = try? JSONEncoder().encode(addAccount)
        
        httpPostClient.post(to: url, with: data)
    }
}

protocol HttpPostClient {
    func post(to url: URL, with data: Data?)
}

class RemoteAddAccountTest: XCTestCase {
    func testAddShouldCallHttpClientWithCorrectURL() {
        let url = URL(string: "https://google.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        sut.add(addAccount: self.makeAddAccount())
        
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    func testAddShouldCallHttpClientWithCorrectData() {
        let url = URL(string: "https://google.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        sut.add(addAccount: self.makeAddAccount())
        
        let data = try? JSONEncoder().encode(self.makeAddAccount())
        
        XCTAssertEqual(httpClientSpy.data, data)
    }
}
