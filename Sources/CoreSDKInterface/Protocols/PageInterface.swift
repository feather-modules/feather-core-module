//
//  File.swift
//
//
//  Created by Tibor Bodecs on 06/03/2024.
//

public protocol PageInterface:
    Sendable,
    Codable,
    Equatable,
    Hashable
{
    var size: UInt { get }
    var index: UInt { get }
}
