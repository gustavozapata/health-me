//
//  ValidationServiceTests.swift
//  HealthMeUITests
//
//  Created by Gustavo Zapata on 28/02/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

@testable import HealthMe
import XCTest

class ValidationServiceTests: XCTestCase {
    
    var account: AccountViewModel!

    override func setUp() {
        super.setUp()
        account = .account
    }
    
    override func tearDown() {
        account = nil
        super.tearDown()
    }
    
//    func testValidEmail() throws {
//        XCTAssertNoThrow(try account.login("tavo", "1"){})
//    }
}
