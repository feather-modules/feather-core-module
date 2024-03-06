//
//  File.swift
//
//
//  Created by Tibor Bodecs on 06/03/2024.
//

public protocol Identifiable:
    Sendable,
    Codable,
    Equatable,
    Hashable
{
    associatedtype
        RawIdentifier:
            Sendable,
            Codable,
            Equatable,
            Hashable
        =
        String

    var id: ID<Self> { get }
}
