//
//  File.swift
//
//
//  Created by Tibor Bodecs on 02/03/2024.
//

import CoreInterfaceKit
import DatabaseQueryKit

extension ID {

    init(_ key: Key<T>) {
        self.init(key.rawValue)
    }

    func toKey() -> Key<T> {
        .init(rawValue)
    }
}

extension Key {

    init(_ id: ID<T>) {
        self.init(id.rawValue)
    }

    func toID() -> ID<T> {
        .init(rawValue)
    }
}
