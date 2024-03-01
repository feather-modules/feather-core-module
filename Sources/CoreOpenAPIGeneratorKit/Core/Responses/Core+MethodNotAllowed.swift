import FeatherOpenAPIKit

extension OperationResponse {

    public static var methodNotAllowed: Self {
        .init(405, Feather.Core.Responses.MethodNotAllowed.self)
    }
}

extension Feather.Core.Responses {

    public enum MethodNotAllowed: JSONResponse {
        public static let description: String = "Method not allowed"
        public static var schema: Schema.Type = Feather.Core.Schemas
            .MethodNotAllowed.Error.self
    }
}

extension Feather.Core.Schemas {

    public enum MethodNotAllowed {

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
