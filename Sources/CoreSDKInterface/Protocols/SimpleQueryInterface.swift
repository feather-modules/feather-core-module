//
//  File.swift
//
//
//  Created by Tibor Bodecs on 06/03/2024.
//

public protocol SimpleQueryInterface:
    Sendable,
    Codable,
    Equatable,
    Hashable
{
    associatedtype Sort: Sortable
    associatedtype Page: PageInterface

    var search: String? { get }
    var sort: Sort { get }
    var page: Page { get }
}
