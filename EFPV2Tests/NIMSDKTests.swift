//
//  NIMSDKTests.swift
//  EFPV2Tests
//
//  Created by JayKong on 2018/1/30.
//  Copyright © 2018 JayKong. All rights reserved.
//

@testable import EFPV2
import Nimble
import RxBlocking
import RxNimble
import RxSwift
import RxTest
import SwiftyJSON
import XCTest
class NIMSDKTests: XCTestCase {
    let disposeBag: DisposeBag = DisposeBag()
    var qos: ConcurrentDispatchQueueScheduler!
    override func setUp() {
        super.setUp()
        // NIMSDK.shared().enableConsoleLog()
        qos = ConcurrentDispatchQueueScheduler(qos: .default)
    }

    /*
     func testRxRegister() {
     let registerResult = try! NIMSDK.rx.register().toBlocking().first()
     expect(registerResult) == true

     expect(NIMSDK.rx.login(account: NIMConstant.userName)).first == true

     let conversationList = try! NIMSDK.rx.conversationList().toBlocking().first()
     expect(conversationList!.count).notTo(equal(0))
     XCTAssert(Thread.current.isMainThread == true)

     print(Thread.current)

     }
     */

    func testUpdateUserProfileCustomInfoExt() {
        let testUserExt = expectation(description: "test User Ext")

        let number = NIMUserInfoUpdateTag.ext.rawValue

        NIMSDK.shared().userManager.updateMyUserInfo([number as NSNumber: "{\"isPa\":0}"]) { _ in
            testUserExt.fulfill()
        }

        wait(for: [testUserExt], timeout: 5)
    }

    func testUserProfileCustomInfoExt() {
        let user = NIMSDK.shared().userManager.userInfo(NIMConstant.userName)

        let json = JSON(parseJSON: user!.userInfo!.ext!)

        XCTAssert(json["isPa"].intValue == 1)
        XCTAssert(json["isPa"].intValue == 0)
    }

    override func tearDown() {

        super.tearDown()
    }
}
