//
//  EmoticonAppTests.swift
//  EmoticonAppTests
//
//  Created by 윤준수 on 2021/01/18.
//

import XCTest
@testable import EmoticonApp

class EmoticonAppTests: XCTestCase {
    
    let cartService: CartService = CartServiceImpl.instance
    
    override func setUpWithError() throws {
        cartService.removeAll()
        for i in 0..<10 {
            cartService.addProduct(product: Product(emoticonName: String(i)))
        }
    }

    func testCount() throws {
        XCTAssertEqual(10, cartService.count)
    }
    
    func testCartAppend() throws {
        cartService.addProduct(product: Product(emoticonName: "11"))
        XCTAssertEqual(11, cartService.count)
    }
    
    func testCartRemoveAt() throws {
        cartService.removeProduct(at: 0)
        XCTAssertEqual(cartService.count, 9)
    }
    
    func testCartRemoveAll() throws {
        cartService.removeAll()
        XCTAssertEqual(0, cartService.count)
    }
}
