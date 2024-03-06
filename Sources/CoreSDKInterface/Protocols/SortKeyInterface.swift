//
//  File.swift
//
//
//  Created by Tibor Bodecs on 06/03/2024.
//

import Foundation

public protocol SortKeyInterface:
    Sendable,
    Codable,
    Equatable,
    Hashable,
    CaseIterable
{

}
