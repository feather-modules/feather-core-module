//
//  File.swift
//
//
//  Created by Tibor Bodecs on 06/03/2024.
//

public enum Order:
    String,
    Sendable,
    Codable,
    Equatable,
    Hashable,
    CaseIterable
{
    /// Ascending order
    case asc
    /// Descending order
    case desc
}
