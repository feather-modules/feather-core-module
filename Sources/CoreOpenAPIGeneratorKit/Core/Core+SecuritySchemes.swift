//
//  File.swift
//
//
//  Created by Tibor Bodecs on 01/03/2024.
//

import OpenAPIKit
import FeatherOpenAPIKit

extension [SecurityScheme.Type] {

    public static var shared: Self {
        [
            Feather.Core.SecuritySchemes.BearerToken.self
        ]
    }
}

extension Feather.Core {

    public enum SecuritySchemes: Component {

        public enum BearerToken: SecurityScheme {
            public static func openAPISecurityScheme() -> OpenAPI.SecurityScheme
            {
                .init(
                    type: .http(
                        scheme: "bearer",
                        bearerFormat: "token"
                    ),
                    description: "Authorization header using a Bearer token"
                )
            }
        }
    }
}
