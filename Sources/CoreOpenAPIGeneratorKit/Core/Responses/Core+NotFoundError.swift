import FeatherOpenAPIKit

extension OperationResponse {

    public static var notFound: Self {
        .init(404, Feather.Core.Responses.NotFound.self)
    }
}

extension Feather.Core.Responses {

    public enum NotFound: JSONResponse {
        public static let description: String = "Not found"
        public static var schema: Schema.Type = Feather.Core.Schemas
            .NotFound
            .Error
            .self
    }
}

extension Feather.Core.Schemas {

    public enum NotFound {

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
