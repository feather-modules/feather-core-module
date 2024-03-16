//
//  File.swift
//
//
//  Created by Tibor Bodecs on 04/02/2024.
//

import CoreModuleKit
import FeatherACL
import XCTest

@testable import CoreModule

public struct Foo: ModuleInterface {

    public enum ACL: ACLSet {

        static public var all: [Permission] =
            []
            + Bar.ACL.all
    }

}

extension Permission {

    static func foo(_ context: String, action: Action) -> Self {
        .init(namespace: "system", context: context, action: action)
    }
}

extension Permission {

    static func fooBar(action: Action) -> Self {
        .foo("bar", action: action)
    }
}

public struct Bar: RepositoryInterface {

    public struct ACL: ACLSet {

        static let list: Permission = .fooBar(action: .list)
        static let create: Permission = .fooBar(action: .create)

        static public var all: [Permission] = [
            ACL.list
        ]
    }
}

final class CoreModuleTests: XCTestCase {

    func testACL() async throws {
        for i in Foo.ACL.all {
            print(i.key)
        }
    }

    func testConvertable1() async throws {
        struct Foo: Codable {
            let key: String
        }

        struct Bar: Codable {
            let key: String
        }

        let key = "key"
        let foo = Foo(key: key)
        let bar = try foo.convert(to: Bar.self)
        XCTAssertEqual(bar.key, key)
    }

    func testConvertable2() async throws {
        struct Foo: Codable {
            let key: String
        }

        struct Bar: Codable {
            let key: String
        }

        let key = "key"
        let foo = Foo(key: key)
        let bar: Bar = try foo.convert()
        XCTAssertEqual(bar.key, key)
    }

    func testConvertable3() async throws {
        struct Foo: Codable {
            let key: String
        }

        struct Bar: Codable {
            let bar: String
        }

        let key = "key"
        let foo = Foo(key: key)
        do {
            _ = try foo.convert(to: Bar.self)
            XCTFail("Conversion should fail.")
        }
        catch let error as ConversionError {
            switch error {
            case .notPossible(let message):
                // ok
                let expectation = "Coding key `bar` not found."
                XCTAssertEqual(message, expectation)
            case .unknown(_):
                XCTFail("Conversion should fail.")
            }
        }
        catch {
            XCTFail("\(error.localizedDescription)")
        }

    }
}
