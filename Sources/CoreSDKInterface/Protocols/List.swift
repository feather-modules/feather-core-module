//
//  File.swift
//
//
//  Created by Tibor Bodecs on 06/03/2024.
//

public protocol List:
    Sendable,
    Codable,
    Equatable,
    Hashable
{
    associatedtype Item

    var items: [Item] { get }
}
