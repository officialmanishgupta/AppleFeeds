//
//  AppleFeedsTests.swift
//  AppleFeedsTests
//
//  Created by Manish Gupta on 8/24/20.
//  Copyright © 2020 Think Beyond. All rights reserved.
//

import XCTest

@testable import AppleFeeds

class AppleFeedsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	
	let something = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json"
	func testService() {
		
		
		// Create an expectation for a background download task.
		let expectation = XCTestExpectation(description: "Download apple.com home page")
		
	
			Service(scheme: "https",
				domain: "www.apple.com",
				path: nil,
			queryItems: nil).request()
		
		
	}

}
