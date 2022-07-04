//
//  DataTests.swift
//  DataTests
//
//  Created by Willian Guedes on 23/06/22.
//

import XCTest
import Domain
import Data

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
