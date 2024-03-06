//
//  File.swift
//
//
//  Created by Tibor Bodecs on 02/03/2024.
//

import DatabaseQueryKit
import NanoID

extension Key {

    public static func generate() -> Self {
        .init(NanoID().rawValue)
    }
}
