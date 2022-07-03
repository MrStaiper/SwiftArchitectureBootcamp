//
//  DataTests.swift
//  DataTests
//
//  Created by Willian Guedes on 23/06/22.
//

import XCTest
@testable import Data

class RemoteAddAccount {
    private let url: URL
    private let httpPostClient: HttpPostClient
    
    init(url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpPostClient = httpClient
    }
    
    func add () {
        httpPostClient.post(url: self.url)
    }
}

protocol HttpPostClient {
    func post(url: URL)
}

class RemoteAddAccountTest: XCTestCase {
    func test_() {
        let url = URL(string: "https://google.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        sut.add()
        
        XCTAssertEqual(httpClientSpy.url, url)
    }
}

class HttpClientSpy: HttpPostClient {
    var url : URL?
    
    func post(url: URL) {
        self.url = url
    }
}
