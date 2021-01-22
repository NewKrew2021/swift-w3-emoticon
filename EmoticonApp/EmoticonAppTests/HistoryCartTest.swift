//
//  HistoryCartTest.swift
//  EmoticonAppTests
//
//  Created by Hochang Lee on 2021/01/22.
//

import XCTest
@testable import EmoticonApp

class HistoryCartTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testHistoryCartGetInstanceWell() throws {
        XCTAssertNotNil(HistoryCart.getHistoryCart())
    }
    
    func testHistoryCartGetRightInstanceType() throws {
        XCTAssertNotNil(HistoryCart.getHistoryCart() as? HistoryCart)
    }
    
    func testHistoryCartGetHistoriesArrayWell() throws {
        let cart = HistoryCart.getHistoryCart()
        XCTAssertNotNil(cart.getHistories())
    }
    
    func testHistoryCartCountCanGetValidValue() throws {
        let cart = HistoryCart.getHistoryCart()
        XCTAssertEqual(cart.count, cart.getHistories().count)
    }
    
    func testHistoryCartClearHistoryWithNoError() throws {
        var cart = HistoryCart.getHistoryCart()
        XCTAssertNoThrow(cart.clearHistory())
    }
    
    func testHistoryCartClearHistoryMakesCountZero() throws {
        var cart = HistoryCart.getHistoryCart()
        cart.clearHistory()
        XCTAssertEqual(cart.count, 0)
    }
    
    func testHistoryCartAddHistoryWithNoError() throws {
        var cart = HistoryCart.getHistoryCart()
        let history = History(title: "sample1", time: Date())
        XCTAssertNoThrow(cart.addHistory(history: history))
    }
    
    func testHistoryCartGetHistoryWithNoError() throws {
        var cart = HistoryCart.getHistoryCart()
        cart.clearHistory()
        let history = History(title: "sample1", time: Date())
        cart.addHistory(history: history)
        XCTAssertNoThrow(cart.getHistory(index: 0))
    }
    
    func testHistoryCartGetHistoryWithVaileData() throws {
        var cart = HistoryCart.getHistoryCart()
        cart.clearHistory()
        let history = History(title: "sample1", time: Date())
        cart.addHistory(history: history)
        let history2 = cart.getHistory(index: 0)
        XCTAssertEqual(history, history2)
    }
    
    func testHistoryCartGetHistoryThrowErrorWhenInvalidIndex() throws {
        var cart = HistoryCart.getHistoryCart()
        cart.clearHistory()
        let history = History(title: "sample1", time: Date())
        cart.addHistory(history: history)
        XCTAssertThrowsError(cart.getHistory(index: 1))
    }
    
    func testHistoryCartDeleteHistoryWithNoError() throws {
        var cart = HistoryCart.getHistoryCart()
        cart.clearHistory()
        let history = History(title: "sample1", time: Date())
        cart.addHistory(history: history)
        XCTAssertNoThrow(cart.deleteHistory(index: 0))
    }
    
    func testHistoryCartDeleteDecreasingCountWell() throws {
        var cart = HistoryCart.getHistoryCart()
        cart.clearHistory()
        let history = History(title: "sample1", time: Date())
        let history2 = History(title: "sample2", time: Date())
        cart.addHistory(history: history)
        cart.addHistory(history: history2)
        let count1 = cart.count
        cart.deleteHistory(index: 0)
        XCTAssertEqual(cart.count, count1 - 1)
    }
    
    func testHistoryCartDeleteUnvaildIndexThrows() throws {
        var cart = HistoryCart.getHistoryCart()
        cart.clearHistory()
        let history = History(title: "sample1", time: Date())
        cart.addHistory(history: history)
        XCTAssertThrowsError(cart.deleteHistory(index: 1))
    }

}
