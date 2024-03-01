import FeatherOpenAPIKit

extension OperationResponse {

    public static var unauthorized: Self {
        .init(401, Feather.Core.Responses.Unauthorized.self)
    }
}

extension Feather.Core.Responses {

    public enum Unauthorized: JSONResponse {
        public static let description: String = "Unauthorized"
        public static var schema: Schema.Type = Feather.Core.Schemas
            .Unauthorized
            .Error.self
    }

}

extension Feather.Core.Schemas {

    public enum Unauthorized {

        public enum Error: ObjectSchema {

            public enum Key: EnumSchema {
                public static let description = """
                    You can use this key for translation purposes.
                    """
                public static let allowedValues = [
                    "invalidUserToken"
                ]
                public static let examples = allowedValues
            }

            public static let description = ""
            public static let properties: [ObjectSchemaProperty] = [
                .init("key", Key.self),
                .init("message", Feather.Core.Schemas.Error.Message.self),
            ]
        }
    }
}
