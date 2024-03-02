//
//  File.swift
//
//
//  Created by Tibor Bodecs on 02/03/2024.
//

import Foundation

extension Encodable {

    public func convert<T: Decodable>(
        to type: T.Type,
        encoder: JSONEncoder = .init(),
        decoder: JSONDecoder = .init()
    ) throws -> T {
        try decoder.decode(T.self, from: try encoder.encode(self))
    }
    
    public func convert<T: Decodable>(
        encoder: JSONEncoder = .init(),
        decoder: JSONDecoder = .init()
    ) throws -> T {
        try convert(to: T.self, encoder: encoder, decoder: decoder)
    }
}

