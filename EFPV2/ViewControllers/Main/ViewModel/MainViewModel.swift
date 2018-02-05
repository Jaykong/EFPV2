//
//  MainViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/29.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxDataSources
import RxSwift

class MainViewModel {
    let sceneCoordinator:SceneCoordinatorType
    
    init(sceneCoordinator:SceneCoordinatorType) {
        self.sceneCoordinator = sceneCoordinator
        
    }
    
    private let bag = DisposeBag()
    lazy var navigationTitle = Observable<String>.create { (observer) -> Disposable in

        NIMSDK.rx.totalUnreadCount().subscribe(onNext: {
            if $0 > 0 {
                observer.onNext("Messages(\($0))")
            } else {
                observer.onNext("Messages")
            }
        }).disposed(by: self.bag)

        return Disposables.create()
    }

    lazy var sections = Observable<[SectionOfRecentSession]>.create { (observer) -> Disposable in
        NIMSDK.rx.register()
            .subscribe(onNext: { _ in
                NIMSDK.rx.login(account: "test111")
                    .subscribe(onNext: { _ in

                        NIMSDK.rx.conversationList().subscribe(onNext: { sessions in

                            let recentSessions =

                                sessions.map({ (nimSession) -> RecentSession in
                                    guard let lastMessage = nimSession.lastMessage else {
                                        return RecentSession(date: Date(), unreadMessage: 999, courseName: "default", paName: "pa-jenny")
                                    }

                                    let date = Date(timeIntervalSince1970: lastMessage.timestamp)
                                    

                                    return RecentSession(date: date, unreadMessage: nimSession.unreadCount, courseName: "summer camp", paName: "pa-joey")
                                })

                            let sectionOfRecentSessions = SectionOfRecentSession(header: "header2", items: recentSessions)

                            observer.onNext([sectionOfRecentSessions])

                        }).disposed(by: self.bag)

                    }).disposed(by: self.bag)

            }).disposed(by: self.bag)

        return Disposables.create()
    }
   
    func onCreateMessage(recent:RecentSession) {
        let messageViewModel = MessageViewModel(sceneCoordinator:sceneCoordinator )
        
        let messageScene = Scene.message(messageViewModel)
        
        self.sceneCoordinator.transitionTo(scene: messageScene, type: .push)
        
    }
}
