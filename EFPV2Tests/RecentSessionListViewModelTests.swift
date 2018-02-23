//
//  RecentSessionListViewModelTests.swift
//  EFPV2Tests
//
//  Created by JayKong on 2018/2/6.
//  Copyright © 2018 JayKong. All rights reserved.
//

@testable import EFPV2
import Nimble
import SwiftyJSON
import XCTest
class RecentSessionListViewModelTests: XCTestCase {
    var recentSessionListViewModel: RecentSessionListViewModel!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let sceneCoordinatorType = SceneCoordinator()
        recentSessionListViewModel = RecentSessionListViewModel()

        NIMSDK.shared()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    /*
     func test_json_to_dictionary() {
     // This is an example of a functional test case.
     // Use XCTAssert and related functions to verify your tests produce the correct results.
     let json = "{\"paName\":\"paJoe\",\"parentGroupName\":\"parentGroupName\",\"paGroupName\":\"paGroupName\"}"
     let data = try! JSONSerialization.jsonObject(with: json.data(using: .utf8)!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:String]
     XCTAssert(data["paName"]! == "paJoe")
     }
     */
}
