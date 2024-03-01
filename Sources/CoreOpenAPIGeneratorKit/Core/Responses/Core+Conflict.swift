import FeatherOpenAPIKit

extension OperationResponse {

    public static var conflict: Self {
        .init(409, Feather.Core.Responses.Conflict.self)
    }
}

extension Feather.Core.Responses {

    public enum Conflict: JSONResponse {
        public static let description: String = "Conflict"
        public static var schema: Schema.Type = Feather.Core.Schemas
            .Conflict
            .Error
            .self
    }
}

extension Feather.Core.Schemas {

    public enum Conflict {

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
