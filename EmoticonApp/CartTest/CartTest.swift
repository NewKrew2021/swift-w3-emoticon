//
//  CartTest.swift
//  CartTest
//
//  Created by 지현우 on 2021/01/21.
//

import XCTest

class CartTest: XCTestCase {
    private let key = "histories"
    private var cart = Cart.shared
    private let db = UserDefault()
    private var count = 1

    override func setUpWithError() throws {
        cart.removeAll()
    }

    override func tearDownWithError() throws {}

    func test_구매이력추가_상세내용_성공() throws {
        var title: String = ""
        let date = Date()
        
        for index in 0..<count{
            title = "이모티콘\(index)"
            cart.buyEmoticon(title: title, date: date)
        }
        XCTAssertEqual(title, db.getData().last?.title)
        XCTAssertEqual(date, db.getData().last?.date)
    }

    func test_구매이력추가_개수_성공() throws {
        count = 5
        try test_구매이력추가_상세내용_성공()
        
        XCTAssertEqual(5, db.getData().count)
    }

    func test_하나삭제_개수_성공() throws {
        count = 2
        try test_구매이력추가_상세내용_성공()
        cart.remove(index: 0)
        XCTAssertEqual(1, db.getData().count)
    }
    
    func test_하나삭제_상세내용_성공() throws{
        count = 2
        try test_구매이력추가_상세내용_성공()
        
        cart.remove(index: 0)
        XCTAssertEqual("이모티콘1", db.getData().last?.title)
    }
    
    func test_모두삭제_개수_성공() throws{
        count = 100
        try test_구매이력추가_상세내용_성공()
        cart.removeAll()
        XCTAssertEqual(0, db.getData().count)
    }
}
