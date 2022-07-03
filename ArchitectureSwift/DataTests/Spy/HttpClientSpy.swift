//
//  HttpClientSpy.swift
//  DataTests
//
//  Created by Willian Guedes on 03/07/22.
//

import Foundation

class HttpClientSpy: HttpPostClient {
    var url : URL?
    
    func post(url: URL) {
        self.url = url
    }
}
