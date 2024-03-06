//
//  File.swift
//
//
//  Created by Tibor Bodecs on 06/03/2024.
//

public protocol Countable:
    Sendable,
    Codable,
    Equatable,
    Hashable
{
    var count: UInt { get }
}
