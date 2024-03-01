import FeatherOpenAPIKit

extension OperationResponse {

    public static var ok: Self {
        .init(200, Feather.Core.Responses.Ok.self)
    }
}

extension Feather.Core.Responses {

    public enum Ok: Response {
        public static let description = "ok"
    }
}
