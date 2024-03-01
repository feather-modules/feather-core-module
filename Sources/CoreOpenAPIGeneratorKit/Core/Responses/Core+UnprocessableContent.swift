import FeatherOpenAPIKit

extension OperationResponse {

    public static var unprocessableContent: Self {
        .init(422, Feather.Core.Responses.UnprocessableContent.self)
    }
}

extension Feather.Core.Responses {

    public enum UnprocessableContent: JSONResponse {
        public static let description: String = "Unprocessable content"
        public static var schema: Schema.Type = Feather.Core.Schemas
            .UnprocessableContent.Error.self
    }
}

extension Feather.Core.Schemas {

    public enum UnprocessableContent {
        public enum Error: ObjectSchema {

            public enum Key: EnumSchema {
                public static let description = """
                    You can use this key for translation purposes.
                    """
                public static let allowedValues = [
                    "validation"
                ]
                public static let examples = allowedValues
            }

            public enum Failure: ArraySchema {

                public enum Detail: ObjectSchema {

                    public enum Key: TextSchema {
                        public static let description = """
                            Related field key for the error detail.
                            """
                        public static let examples = [
                            "email",
                            "password",
                            "coordinate",
                            "coordinate.latitude",
                            "coordinate.longitude",
                        ]
                    }

                    //                    public enum Key: EnumSchema {
                    //                        static let description = """
                    //                            You can use this value for translation purposes.
                    //                            """
                    //                        static let allowedValues = [
                    //                            "required",
                    //                            "min",
                    //                            "max",
                    //                        ]
                    //                        static let examples = allowedValues
                    //                    }

                    public static let description = ""
                    public static let properties: [ObjectSchemaProperty] = [
                        //                        .init("id", Id.self),
                        .init("key", Key.self),
                        .init(
                            "message",
                            Feather.Core.Schemas.Error.Message.self
                        ),
                    ]
                }

                public static let description = ""
                public static let items: Schema.Type = Detail.self
            }

            public static let description = ""
            public static let properties: [ObjectSchemaProperty] = [
                .init("key", Key.self),
                .init("message", Feather.Core.Schemas.Error.Message.self),
                .init("failures", Failure.self),
            ]
        }
    }
}
