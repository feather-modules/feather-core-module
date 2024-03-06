//
//  File.swift
//
//
//  Created by Tibor Bodecs on 06/03/2024.
//

public struct ID<Value: Identifiable> {

    public let rawValue: Value.RawIdentifier

    public init(rawValue: Value.RawIdentifier) {
        self.rawValue = rawValue
    }
}

extension ID: Sendable {}
extension ID: Hashable {}
extension ID: Equatable {}
extension ID: RawRepresentable {}

extension ID: Codable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.rawValue = try container.decode(Value.RawIdentifier.self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
