//
//  File.swift
//
//
//  Created by Tibor Bodecs on 06/03/2024.
//

public protocol Identifiable {

    associatedtype
        RawIdentifier:
            Sendable,
            Codable,
            Equatable,
            Hashable
        =
        String
}
