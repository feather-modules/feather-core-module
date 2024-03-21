//
//  File.swift
//
//
//  Created by Tibor Bodecs on 04/02/2024.
//

import CoreModuleKit
import CoreModule
import XCTest

final class CoreModuleTests: XCTestCase {

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
