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
    let teamManager = NIMSDK.shared().teamManager

    override func setUp() {
        super.setUp()

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNIMTeamUpdateClientCustomMode() {
        let updateExpectation = expectation(description: "UpdateClientCustomMode")
        NIMSDK.shared().teamManager.update(NIMTeamUpdateClientCustomMode.all, teamId: teamId) { (error) in
            expect(error).to(beNil())
            updateExpectation.fulfill()

        }
        wait(for: [updateExpectation], timeout: 10)

    }

    func testUpdateTeamCustomInfo() {

        let json = "{\"isPa\":0,\"paName\":\"paJoe3\",\"parentGroupName\":\"parentGroupName5\",\"paGroupName\":\"paGroupName3\"}"
        let test = expectation(description: "test")

        NIMSDK.shared().teamManager.updateTeamCustomInfo(json, teamId: teamId) { (error) in
            XCTAssertNil(error)
            expect(error).to(beNil())
            test.fulfill()

        }

        wait(for: [test], timeout: 10)

        XCTAssert(1 == 1)
    }

    func testFetchTeamInfo() {
        let fetchTeamInfo = expectation(description: "fetch team info")

        NIMSDK.shared().teamManager.fetchTeamInfo(teamId) { _, team in

            let vm = EFPGroupInfoViewModel(team: team, session: NIMSession())
            expect(try! vm.groupName.toBlocking(timeout: 5).first()!.parentGroupName).to(equal("parentGroupName5"))

            fetchTeamInfo.fulfill()
        }

        wait(for: [fetchTeamInfo], timeout: 10)
    }
}

