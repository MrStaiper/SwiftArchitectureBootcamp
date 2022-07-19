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
        sut.add(addAccountModel: self.makeAddAccount()) { _ in }
        
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    
    func testAddShouldCallHttpClientWithCorrectData() {
        let (sut, httpClientSpy) = self.makeSut()
        sut.add(addAccountModel: self.makeAddAccount()) { _ in }

        XCTAssertEqual(httpClientSpy.data, self.makeAddAccount().toData())
    }
    
    func testAddShouldCompleteWithErrorIfClientFails() {
        let (sut, httpClientSpy) = self.makeSut()
        let expect = expectation(description: "waiting")
        
        sut.add(addAccountModel: self.makeAddAccount()) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, .unexpected)
            case .success(_):
                XCTFail("Expected error receive \(result) instead")
            }
            
            expect.fulfill()
        }
        
        httpClientSpy.completionWithError(.noConnectivity)
        wait(for: [expect], timeout: 1)
    }
    
}
