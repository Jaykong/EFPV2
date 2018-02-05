//
//  RecentSearchRecordStoreTests.swift
//  EFPV2Tests
//
//  Created by JayKong on 2018/2/3.
//  Copyright © 2018 JayKong. All rights reserved.
//

import XCTest
import Nimble
@testable import EFPV2
class RecentSearchRecordStoreTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        RecentSearchRecordStore.shared.insert(atFirst: "test1")
        RecentSearchRecordStore.shared.insert(atFirst: "test2")
        RecentSearchRecordStore.shared.insert(atFirst: "test3")
        RecentSearchRecordStore.shared.insert(atFirst: "test4")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFirst() {
        expect(RecentSearchRecordStore.shared[0]).to(equal("test4"))
       
    }
    func testSecond() {
        expect(RecentSearchRecordStore.shared[1]).to(equal("test3"))
        
    }
    
    func testMaxCount() {
        expect(RecentSearchRecordStore.shared.count).to(equal(3))
    }
    
}
