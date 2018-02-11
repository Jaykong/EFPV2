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
import SwiftyJSON
class RecentSessionListViewModel {
    private let bag = DisposeBag()

    let sceneCoordinator = EFPSceneRouter.shared

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

    func onSelectedRecent(_ recent: NIMRecentSession!, at _: IndexPath!) {
        var sessionViewModel = SessionViewModel()

        sessionViewModel.session = recent.session

        let messageScene = EFPRecentSessionScene.session(sessionViewModel)
            
            //Scene.session(sessionViewModel)
        EFPSceneRouter.shared.transit(to: messageScene, transitionType: .push)

    }

    func name(for recent: NIMRecentSession!) -> String! {
        guard let sessionId = recent.session?.sessionId, let team = NIMSDK.shared().teamManager.team(byId: sessionId) else {
            return ""
        }

        guard let name = team.clientCustomInfo else {
            return ""
        }
        let json = try! JSON(data: name.data(using: .utf8)!, options: .allowFragments)
        if NIMService.userExt() == 0 {
            return json["parentGroupName"].stringValue
        } else {
            return json["paGroupName"].stringValue
        }
    }
}
