//
//  EFPEFPGroupSearchViewModelTests.swift
//  EFPV2Tests
//
//  Created by JayKong on 2018/2/23.
//  Copyright © 2018 JayKong. All rights reserved.
//

import XCTest
@testable import EFPV2
import Nimble
import RxBlocking
import RxNimble
import RxSwift
import RxCocoa
import RxTest
import SwiftyJSON
class EFPGroupSearchViewModelTests: XCTestCase {
    let searchText = "Hello"
    var viewModel: EFPGroupSearchViewModel! = nil
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let sesssion = NIMSession(teamId, type: .team)
        viewModel = EFPGroupSearchViewModel(searchText: searchText, session: sesssion)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMessagesNotNil() {
        let messages = try! viewModel.messages.toBlocking(timeout: 10).first()
        expect(messages).notTo(beNil())
        //  print(messages)
        expect(messages?.first!.text).to(contain(searchText))
    }



}
