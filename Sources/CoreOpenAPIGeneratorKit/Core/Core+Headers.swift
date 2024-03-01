//
//  File.swift
//
//
//  Created by Tibor Bodecs on 01/03/2024.
//

import FeatherOpenAPIKit

extension Feather.Core {

    public enum Headers: Component {

        public enum ContentLength: Header {
            public static let name = "Content-Length"
            public static let description: String = "Content length header"
            public static let schema: Schema.Type = Schemas.Headers
                .ContentLength.self
        }
    }
}
