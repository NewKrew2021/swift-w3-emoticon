//
//  CartTest.swift
//  EmoticonAppTests
//
//  Created by bean Milky on 2021/01/21.
//

import XCTest

class CartTest: XCTestCase {
    var cart: CartType = Cart(cartKey: "EmpticonAppTests/FakeCart")
    var mockEmojis: [Emoji] = [Emoji]()
    let numOfMockData = 1000

    override func setUp() {
        for _ in 0..<numOfMockData {
            mockEmojis.append(Emoji(title: "", author: "", image: ""))
        }
        cart = Cart(carKey: "EmpticonAppTests/FakeCart", cartItems: mockEmojis)
    }

    

    func test카트아이템추가() throws {
        let numOfData: Int = 1000
        for _ in 0..<numOfData {
            cart.push(emoji: Emoji(title: "", author: "", image: ""))
        }
        XCTAssertEqual(cart.count, numOfMockData+numOfData)
    }

    func test카트아이템꺼내기() throws {
        for _ in 0..<cart.count {
            XCTAssertNotNil(cart.pop())
        }
    }
    
    func test카트아이템삭제withIndex() throws {
        for _ in 0..<cart.count {
            cart.remove(at: 0)
        }
        XCTAssertEqual(cart.count, 0)
    }
    
    func test카트아이템삭제WithEmoji() throws {
        for idx in 0..<cart.count {
            cart.remove(emoji: mockEmojis[idx])
        }
        XCTAssertEqual(cart.count, 0)
    }
    
    func test카트아이템전체삭제() throws {
        cart.clear()
        XCTAssertEqual(cart.count, 0)
    }

}
