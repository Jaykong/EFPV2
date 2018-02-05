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
import XCTest

class NIMSDKTests: XCTestCase {
    var scheduler: ConcurrentDispatchQueueScheduler!
    var subscription: Disposable!
    let disposeBag: DisposeBag = DisposeBag()
    override func setUp() {
        super.setUp()
        NIMSDK.rx.register()

        scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
    }

    func testRxRegister2() {
        let loginObservable = NIMSDK.rx.login(account: "test111")
            .filter({ $0 == true })

        let convationlistObservalbe = NIMSDK.rx.conversationList()

        NIMSDK.rx.register()
            .subscribe(onCompleted: {
                loginObservable.subscribe(onNext: { _ in
                    convationlistObservalbe.subscribe(onNext: {
                        print($0)
                    }).disposed(by: self.disposeBag)
                }).disposed(by: self.disposeBag)
            }).disposed(by: disposeBag)
    }

    func testRxRegister() {
        NIMSDK.rx.register()
            .subscribe(onCompleted: {
                NIMSDK.rx.login(account: "test111")
                    .filter({ $0 == true })
                    .subscribe(onNext: { _ in
                        NIMSDK.rx.conversationList()
                            .subscribe(onNext: { sessions in
                                print(sessions)
                            }, onError: { err in
                                print(err)
                            }, onCompleted: {
                                print("completed")
                            }, onDisposed: {
                                print("disposed")
                            }).disposed(by: self.disposeBag)
                    }).disposed(by: self.disposeBag)

            })
            .disposed(by: disposeBag)
    }

    func testLoign() {
        let trueOrFaulse = try! NIMSDK.rx.login(account: "test111")
            .subscribeOn(scheduler)
            .toBlocking().first()
        expect(trueOrFaulse) == true
    }

//    func testConversationList() {
//        testLoign()
//        let result = try! NIMSDK.rx.conversationList()
//        .subscribeOn(scheduler)
//        .toBlocking().first()
//        expect(result?.count) == 1
    //
    //
//    }

    func testConcat() {
        let register = NIMSDK.rx.register()
        let login = NIMSDK.rx.login(account: "test111")
        let registerAndLogin =
            Observable<Bool>.merge([register, login])
            // .takeLast(1)
            // .filter({ $0 == true })
            .subscribe(onNext: { x in
                print(x)
            }, onError: { err in
                print(err)
            }, onCompleted: {
                print("completed")
            }) {
                print("onDisposed")
            }
    }

    override func tearDown() {

        super.tearDown()
    }
}
