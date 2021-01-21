//
//  CartTest.swift
//  EmoticonAppTests
//
//  Created by bean Milky on 2021/01/21.
//

import XCTest

struct MockEmojiForCart: EmojiType {
    var id: String = ""
    var title: String = ""
    var author: String = ""
    var image: String = ""
}

class CartTest: XCTestCase {
    var cart: CartType = Cart()

    override func tearDown() {
        cart = Cart()
    }

    func test카트아이템추가() throws {
        let numOfData: Int = 1000

        for index in 0..<numOfData {
            let mockEmoji = MockEmojiForCart(id: "emoji-id-\(index)", title: "", author: "", image: "")
            cart.push(emoji: mockEmoji)
        }
        XCTAssertEqual(cart.count, numOfData)
    }

    func test카트아이템삭제() throws {

    }

}
