//
//  File.swift
//
//
//  Created by Tibor Bodecs on 06/03/2024.
//

public protocol Pagination:
    Sendable,
    Codable,
    Equatable,
    Hashable
{
    associatedtype Page: PageInterface

    var page: Page { get }
}
