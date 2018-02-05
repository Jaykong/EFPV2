//
//  MainViewModelTests.swift
//  EFPV2Tests
//
//  Created by JayKong on 2018/2/4.
//  Copyright © 2018 JayKong. All rights reserved.
//

import XCTest
import RxSwift
import Nimble
import RxNimble
import RxBlocking
import RxTest
@testable import EFPV2
class MainViewModelTests: XCTestCase {
    var viewModel: MainViewModel!
    var testScheduler: TestScheduler!
    var subscription: Disposable!

    var qosScheduler: ConcurrentDispatchQueueScheduler!

    override func setUp() {
        super.setUp()
        testScheduler = TestScheduler(initialClock: 0)
        qosScheduler = ConcurrentDispatchQueueScheduler(qos: .default)
        viewModel = MainViewModel()
        viewModel.sections = Observable<[SectionOfRecentSession]>.create({ (observer) -> Disposable in
            let r1 = RecentSession(date: Date(), unreadMessage: 10, courseName: "Summer course", paName: "pa-john")
            let r2 = RecentSession(date: Date(), unreadMessage: 10, courseName: "Winter course", paName: "pa-jenny")
            let sec1 = SectionOfRecentSession(header: "header1", items: [r1, r2])
            observer.onNext([sec1])


            return Disposables.create()
        })


    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testScheduler.scheduleAt(1000) {
            self.subscription.dispose()
        }
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let section = viewModel.sections.filter { (sec) -> Bool in
            sec.filter({ (session) -> Bool in
                session.items.contains(where: { (session) -> Bool in
                    session.paName == "pa-jenny"
                })
            }).count == 1
        }
       let obserSec = viewModel.sections.subscribeOn(qosScheduler)
        
      let first = try! obserSec.toBlocking().first()
        expect(first!.count) == 1

    }



}
