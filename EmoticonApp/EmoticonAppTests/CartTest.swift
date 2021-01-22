//
//  CartTest.swift
//  EmoticonAppTests
//
//  Created by bean Milky on 2021/01/21.
//

import XCTest

class CartTest: XCTestCase {
    
    func test카트아이템추가() throws {
        var cart: CartType = Cart(cartKey: "EmpticonAppTests/FakeCart")
        let numOfData: Int = 1000
        for index in 0..<numOfData {
            cart.push(emoji: Emoji(title: "", author: "", image: ""))
        }
        XCTAssertEqual(cart.count, numOfData)
    }

    func test카트아이템삭제() throws {

    }

}
