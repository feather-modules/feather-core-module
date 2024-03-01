import FeatherOpenAPIKit

extension OperationResponse {

    public static var head: Self {
        .init(200, Feather.Core.Responses.Head.self)
    }
}

extension Feather.Core.Responses {

    public enum Head: Response {
        public static let description = "Ok"

        public static let headers: [Header.Type] = [
            Feather.Core.Headers.ContentLength.self
        ]
    }
}
