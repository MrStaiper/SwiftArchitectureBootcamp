//
//  BaseModel.swift
//  Domain
//
//  Created by Willian Guedes on 03/07/22.
//

import Foundation

public protocol BaseModel: Encodable {}

public extension BaseModel {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
