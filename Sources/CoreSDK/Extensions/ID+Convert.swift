//
//  File.swift
//
//
//  Created by Tibor Bodecs on 02/03/2024.
//

import CoreSDKInterface
import DatabaseQueryKit

extension ID where Value.RawIdentifier == String {

    init(_ key: Key<Value>) {
        self.init(rawValue: key.rawValue)
    }

    func toKey() -> Key<Value> {
        .init(rawValue)
    }
}

extension Key where T: Identifiable, T.RawIdentifier == String {

    init(_ id: ID<T>) {
        self.init(rawValue: id.rawValue)
    }

    func toID() -> ID<T> {
        .init(rawValue: rawValue)
    }
}
