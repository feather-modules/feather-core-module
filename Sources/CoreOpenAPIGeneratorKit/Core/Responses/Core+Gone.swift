import FeatherOpenAPIKit

extension OperationResponse {

    public static var gone: Self {
        .init(410, Feather.Core.Responses.Gone.self)
    }
}

extension Feather.Core.Responses {

    public enum Gone: JSONResponse {
        public static let description: String = "Gone"
        public static var schema: Schema.Type = Feather.Core.Schemas.Gone
            .Error
            .self
    }
}

extension Feather.Core.Schemas {

    public enum Gone {

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
