//
//  EmoticonTests.swift
//  EmoticonTests
//
//  Created by 이청원 on 2021/01/19.
//

import XCTest

class EmoticonTests: XCTestCase {

    var emoticon = Emoticon()
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testEmoticonSize() throws {
        let res = emoticon.size
        XCTAssertEqual(res, 12)
    }
    
    func testEmoticonTitle() throws {
        let res = emoticon.title(index: 1)
        XCTAssertEqual(res, "콩글리시 이즈 꿀잼2")
    }
    
    func testEmoticonAuthor() throws {
        let res = emoticon.author(index: 2)
        XCTAssertEqual(res, "mohe")
    }
}
