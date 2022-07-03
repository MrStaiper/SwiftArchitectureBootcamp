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
    private let httpClient: HttpClient
    
    init(url: URL, httpClient: HttpClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add () {
        httpClient.post(url: self.url)
    }
}

protocol HttpClient {
    func post(url: URL)
}

class RemoteAddAccountTest: XCTestCase {
    func test_() {
        let url = URL(string: "https://google.com")!
        let httpClientSpy = HttplientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        sut.add()
        
        XCTAssertEqual(httpClientSpy.url, url)
    }
}

class HttplientSpy: HttpClient {
    var url : URL?
    
    func post(url: URL) {
        self.url = url
    }
}
