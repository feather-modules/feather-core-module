import FeatherOpenAPIKit

extension OperationResponse {

    public static var noContent: Self {
        .init(204, Feather.Core.Responses.NoContent.self)
    }
}

extension Feather.Core.Responses {

    public enum NoContent: Response {
        public static let description = "No content"
    }
}
