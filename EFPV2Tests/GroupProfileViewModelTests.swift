//
//  GroupProfileViewModelTests.swift
//  EFPV2Tests
//
//  Created by JayKong on 2018/2/7.
//  Copyright © 2018 JayKong. All rights reserved.
//

@testable import EFPV2
import Nimble
import RxBlocking
import RxNimble
import XCTest

class GroupProfileViewModelTests: XCTestCase {
    var groupProfileViewModel: GroupProfileViewModel!
    let teamId = "316999439"
    let teamManager = NIMSDK.shared().teamManager

    override func setUp() {
        super.setUp()
//        try! NIMSDK.rx.register().toBlocking().first()
        //
//        try! NIMSDK.rx.login(account: NIMConstant.userName).toBlocking().first()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_team_client_update_custom_info() {

        let json = "{\"isPa\":0,\"paName\":\"paJoe3\",\"parentGroupName\":\"parentGroupName3\",\"paGroupName\":\"paGroupName3\"}"
        let test = expectation(description: "test")

        NIMSDK.shared().teamManager.updateTeamCustomInfo(json, teamId: teamId) { _ in
            test.fulfill()
        }
        print("1 start. \(Thread.current)")

        wait(for: [test], timeout: 10)
        print("1 end. \(Thread.current)")

        expect("1").to(equal("2"))
        XCTAssert(1 == 1)
    }

    func testFetchTeamInfo() {
        let fetchTeamInfo = expectation(description: "fetch team info")

        print("2 start. \(Thread.current)")

        NIMSDK.shared().teamManager.fetchTeamInfo(teamId) { _, team in
            print(team?.teamName)
            print(team?.teamId)
            print(team?.serverCustomInfo)
            print(team?.clientCustomInfo)
            fetchTeamInfo.fulfill()
        }

        wait(for: [fetchTeamInfo], timeout: 10)
        print("2 end. \(Thread.current)")
    }
}
