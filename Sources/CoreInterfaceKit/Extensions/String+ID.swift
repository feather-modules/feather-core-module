//
//  File.swift
//
//
//  Created by Tibor Bodecs on 02/03/2024.
//

extension [String] {

    public func toID<T>() -> [ID<T>] {
        map { .init($0) }
    }
}
