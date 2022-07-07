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
    
    func post(to url: URL, with data: Data?) {
        self.urls.append(url)
        self.data = data
    }
}
