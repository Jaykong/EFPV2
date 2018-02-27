//
//  EFPGroupInfoViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/21.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxSwift
struct EFPGroupInfoViewModel {
    var team: NIMTeam!
    var session:NIMSession
    
    var groupName: Observable<TeamClientCustomInfo> {
        let observable = Observable<TeamClientCustomInfo>.create { (observer) -> Disposable in

            let json = self.team.clientCustomInfo!
            let data = try! JSONSerialization.jsonObject(with: json.data(using: .utf8)!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: Any]

            guard let isPa = data["isPa"] as? Int,
                let paName = data["paName"] as? String,
                let parentGroupName = data["parentGroupName"] as? String,
                let paGroupName = data["paGroupName"] as? String else {
                    return Disposables.create()
            }

            let teamClientCustomInfo = TeamClientCustomInfo(isPa: isPa, paName: paName, parentGroupName: parentGroupName, paGroupName: paGroupName)

            observer.onNext(teamClientCustomInfo)
            observer.onCompleted()

            return Disposables.create()
        }
        return observable
    }

    func pop() {
        EFPSceneRouter.shared.pop()
    }

    func onSelectedGroupRenameSectionItem() {
        let groupRenameViewModel = EFPGroupRenameViewModel()
        let scene = EFPSessionScene.groupRename(groupRenameViewModel)
        EFPSceneRouter.shared.transit(to: scene, transitionType: .push)
    }

    func onSearchBtnClicked() {
        

        let viewModel = EFPGroupLocalSearchResultViewModel(session: session)
        let scene = EFPSessionScene.groupLocalSearchResult(viewModel)
        EFPSceneRouter.shared.transit(to: scene, transitionType: .modal)

    }

}
