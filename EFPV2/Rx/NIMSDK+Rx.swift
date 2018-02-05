//
//  NIMSDK+Rx.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/30.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

extension Reactive where Base: NIMSDK {
    enum NIMError: Error {
        case noSession
    }

    static var shared: NIMSDK {
        return NIMSDK.shared()
    }

    @discardableResult
    static func register() -> Observable<Bool> {
        return Observable<Bool>.create({ (observer) -> Disposable in
            let option = NIMSDKOption()
            option.appKey = NIMConstant.appKey
            shared.register(with: option)
            observer.onNext(true)
            return Disposables.create()
        })
    }

    @discardableResult
    static func login(account: String) -> Observable<Bool> {

        return Observable<Bool>.create({ observer in
            shared.loginManager.login(account, token: NIMConstant.token, completion: { _ in
                observer.onNext(true)
            })

            return Disposables.create()
        })
    }

    static func conversationList() -> Observable<[NIMRecentSession]> {
        return Observable<[NIMRecentSession]>.create({ observer in
            guard let allRecentSessions = shared.conversationManager.allRecentSessions() else {
                observer.onError(NIMError.noSession)
                return Disposables.create()
            }
            observer.onNext(allRecentSessions)
            return Disposables.create()
        })
    }

    static func totalUnreadCount() -> Observable<Int> {
        return Observable<Int>.create({ (observer) -> Disposable in
            observer.onNext(shared.conversationManager.allUnreadCount())

            return Disposables.create()
        })
    }
}
