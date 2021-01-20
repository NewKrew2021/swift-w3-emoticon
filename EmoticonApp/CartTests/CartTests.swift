//
//  CartTests.swift
//  CartTests
//
//  Created by 이청원 on 2021/01/20.
//

import XCTest

class CartTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdd() throws {
        let histories = HistoryData.getData() ?? [History]()
        Cart.add(history: History(title: "test", data: Date()))
        XCTAssertEqual(histories.count + 1, HistoryData.getData()?.count)
    }
    
    func testRemoveAll() throws {
        Cart.removeAll()
        XCTAssertEqual(0, HistoryData.getData()?.count)
    }
    
    func testRemove() throws {
        Cart.add(history: History(title: "test", data: Date()))
        let histories = HistoryData.getData() ?? [History]()
        Cart.remove(index: 0)
        XCTAssertEqual(histories.count - 1, HistoryData.getData()?.count)
    }
}
