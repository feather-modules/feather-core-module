//
//  File.swift
//
//
//  Created by Tibor Bodecs on 13/03/2024.
//

import CoreModuleInterface
import DatabaseQueryKit
import FeatherValidation

extension Rule where T: Equatable & Encodable {

    public static func unique<QB: QueryBuilderCount>(
        queryBuilder: QB,
        fieldKey: QB.Row.FieldKeys,
        message: String? = nil,
        originalEmail: T? = nil
    ) -> Self {
        .init(
            message: message ?? "The value should be unique."
        ) { value in
            let count = try await queryBuilder.count(
                filter: .init(
                    field: fieldKey,
                    operator: .equal,
                    value: value
                )
            )
            if let originalEmail {
                if originalEmail == value {
                    guard count == 1 else {
                        throw RuleError.invalid
                    }
                }
                else {
                    guard count == 0 else {
                        throw RuleError.invalid
                    }
                }
            }
            else {
                guard count == 0 else {
                    throw RuleError.invalid
                }
            }
        }
    }
}

extension Rule where T: RawRepresentable & Object {

    public static func unique<QB: QueryBuilderCount>(
        queryBuilder: QB,
        fieldKey: QB.Row.FieldKeys,
        message: String? = nil,
        originalKey: T? = nil
    ) -> Self {
        .init(
            message: message ?? "The value should be unique."
        ) { value in
            let count = try await queryBuilder.count(
                filter: .init(
                    field: fieldKey,
                    operator: .equal,
                    value: value
                )
            )
            if let originalKey {
                if originalKey == value {
                    guard count == 1 else {
                        throw RuleError.invalid
                    }
                }
                else {
                    guard count == 0 else {
                        throw RuleError.invalid
                    }
                }
            }
            else {
                guard count == 0 else {
                    throw RuleError.invalid
                }
            }
        }
    }
}
