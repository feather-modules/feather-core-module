import FeatherOpenAPIKit

extension OperationResponse {

    public static var forbidden: Self {
        .init(403, Feather.Core.Responses.Forbidden.self)
    }
}

extension Feather.Core.Responses {

    public enum Forbidden: JSONResponse {
        public static let description: String = "Forbidden"
        public static var schema: Schema.Type = Feather.Core.Schemas
            .Forbidden
            .Error.self
    }
}

extension Feather.Core.Schemas {

    public enum Forbidden {

        public enum Error: ObjectSchema {

            public enum Key: TextSchema {
                public static let description = """
                    The system key of the related object.
                    """
                public static let examples = [
                    "module.model",
                    "foo.bar",
                ]
            }

            public static let description = ""
            public static let properties: [ObjectSchemaProperty] = [
                .init("key", Key.self),
                .init("message", Feather.Core.Schemas.Error.Message.self),
            ]
        }
    }
}
