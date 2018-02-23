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

            // shared.loginManager.autoLogin("test111", token: NIMConstant.token)

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

    static func startNIMSDK() {
        NIMSDK.rx.register()
            .subscribe(onNext: { _ in
                NIMSDK.rx.login(account: "test111")
            })
    }

    static func updateTeamCustomInfo(teamId: String, json: String) -> Observable<Bool> {
        return Observable<Bool>.create({ (observer) -> Disposable in
            let teamManager = NIMSDK.shared().teamManager

            teamManager.updateTeamCustomInfo(json, teamId: teamId) { _ in
                observer.onNext(true)

                observer.onCompleted()
            }

            return Disposables.create()
        })
    }

    static func search(session: NIMSession, text: String) -> Observable<[NIMMessage]> {
        return Observable<[NIMMessage]>.create({ (observer) -> Disposable in
            let option = NIMMessageSearchOption()
            option.searchContent = text
            option.limit = 0
            option.order = .desc
            NIMSDK.shared().conversationManager.searchMessages(session, option: option, result: { (error, messages) in
                if let error = error {
                    print(error.localizedDescription)
                    observer.onError(error)
                    return

                }
                if let messages = messages {
                    observer.onNext(messages)
                }
                
                

            })

            return Disposables.create()
        })

    }

}
