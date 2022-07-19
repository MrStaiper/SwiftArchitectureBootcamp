//
//  HttpClientSpy.swift
//  DataTests
//
//  Created by Willian Guedes on 03/07/22.
//

import Foundation
import Data

class HttpClientSpy: HttpPostClient {
    var urls = [URL]()
    var data: Data?
    var completion: ((HttpError) -> Void)?
    
    func post(to url: URL, with data: Data?, completion: @escaping (HttpError) -> Void) {
        self.urls.append(url)
        self.data = data
        self.completion = completion
    }
    
    func completionWithError(_ error: HttpError) {
        completion?(error)
    }
}
