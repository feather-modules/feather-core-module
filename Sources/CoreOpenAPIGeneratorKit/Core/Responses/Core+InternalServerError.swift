import FeatherOpenAPIKit

extension OperationResponse {

    public static var internalServerError: Self {
        .init(500, Feather.Core.Responses.InternalServerError.self)
    }
}

extension Feather.Core.Responses {

    public enum InternalServerError: JSONResponse {
        public static let description: String = "InternalServerError"
        public static var schema: Schema.Type = Feather.Core.Schemas
            .InternalServerError.Error.self
    }

}

extension Feather.Core.Schemas {

    public enum InternalServerError {

        public enum Error: ObjectSchema {

            public enum Key: TextSchema {
                public static let description = """
                    The key of the related object.
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
