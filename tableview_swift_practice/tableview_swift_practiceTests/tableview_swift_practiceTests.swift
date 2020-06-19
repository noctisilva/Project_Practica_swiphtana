//
//  tableview_swift_practiceTests.swift
//  tableview_swift_practiceTests
//
//  Created by Tae Hong Min on 6/16/20.
//  Copyright © 2020 tableview.practice.com. All rights reserved.
//

import XCTest
@testable import tableview_swift_practice

class tableview_swift_practiceTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAllWordsLoaded() {
        let playData = PlayData()
        XCTAssertEqual(playData.allWords.count, 0, "allWords must be 0")
    }
}
