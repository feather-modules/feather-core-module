//
//  File.swift
//
//
//  Created by Tibor Bodecs on 02/03/2024.
//

import Foundation

public enum ConversionError: Error {
    case notPossible(String)
    case unknown(Error)
}

extension CodingKey {
    /// returns a coding key as a path key string.
    fileprivate var pathKeyValue: String {
        if let value = intValue {
            return String(value)
        }
        return stringValue
    }
}

extension Array where Element == CodingKey {
    /// returns a path key using a dot character as a separator.
    fileprivate var pathKeyValue: String {
        map(\.pathKeyValue).joined(separator: ".")
    }
}

extension Encodable {

    public func convert<T: Decodable>(
        to type: T.Type,
        encoder: JSONEncoder = .init(),
        decoder: JSONDecoder = .init()
    ) throws -> T {
        do {
            return try decoder.decode(T.self, from: try encoder.encode(self))
        }
        catch DecodingError.dataCorrupted(let context) {
            let message = context.debugDescription
            throw ConversionError.notPossible(message)
        }
        catch DecodingError.keyNotFound(let key, _) {
            let path = key.pathKeyValue
            let message = "Coding key `\(path)` not found."
            throw ConversionError.notPossible(message)
        }
        catch DecodingError.valueNotFound(_, let context) {
            let path = context.codingPath.pathKeyValue
            let message = "Value not found for `\(path)` key."
            throw ConversionError.notPossible(message)
        }
        catch DecodingError.typeMismatch(let type, let context) {
            let path = context.codingPath.pathKeyValue
            let message =
                "Type mismatch for `\(path)` key, expected `\(type)` type."
            throw ConversionError.notPossible(message)
        }
        catch {
            throw ConversionError.unknown(error)
        }
    }

    public func convert<T: Decodable>(
        encoder: JSONEncoder = .init(),
        decoder: JSONDecoder = .init()
    ) throws -> T {
        try convert(to: T.self, encoder: encoder, decoder: decoder)
    }
}
