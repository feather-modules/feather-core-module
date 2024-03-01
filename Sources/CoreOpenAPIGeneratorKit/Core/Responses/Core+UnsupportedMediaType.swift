import FeatherOpenAPIKit

extension OperationResponse {

    public static var unsupportedMediaType: Self {
        .init(415, Feather.Core.Responses.UnsupportedMediaType.self)
    }
}

extension Feather.Core.Responses {

    public enum UnsupportedMediaType: JSONResponse {
        public static let description: String = "Unsupported media type"
        public static var schema: Schema.Type = Feather.Core.Schemas
            .UnsupportedMediaType.Error.self
    }
}

extension Feather.Core.Schemas {

    public enum UnsupportedMediaType {

        public enum Error: ObjectSchema {

            public enum Key: TextSchema {
                public static let description = """
                    You can use this key for translation purposes.
                    """
                public static let examples = [
                    "application/json",
                    "text/html",
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
