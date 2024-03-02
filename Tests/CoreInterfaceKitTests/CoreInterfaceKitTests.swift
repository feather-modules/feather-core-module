//
//  File.swift
//
//
//  Created by Tibor Bodecs on 04/02/2024.
//

import XCTest
@testable import CoreInterfaceKit

final class CoreInterfaceKitTests: XCTestCase {

    func testExample() async throws {
        XCTAssertTrue(true)
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
}
