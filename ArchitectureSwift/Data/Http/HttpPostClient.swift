//
//  HttpPostClient.swift
//  Data
//
//  Created by Willian Guedes on 03/07/22.
//

import Foundation

public protocol HttpPostClient {
    func post(to url: URL, with data: Data?, completion: @escaping (HttpError) -> Void)
}
