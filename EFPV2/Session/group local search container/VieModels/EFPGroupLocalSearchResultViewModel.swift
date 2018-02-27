//
//  EFPGroupSearchViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/21.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources
class EFPGroupLocalSearchResultViewModel {
    var session: NIMSession
    
    var controlProperty:ControlProperty<String?>!

    init(session: NIMSession) {
        self.session = session
    }
    
    func messages() -> Observable<[AnimatableSectionModel<String, NIMMessage>]> {
        
        return
            controlProperty
                .filter({ (str) -> Bool in
                    str!.count > 0
                })
                .flatMap { (str)  in
                    
                    return self.messages(text: str!)
        }
        
    }

    private func messages(text: String) -> Observable<[AnimatableSectionModel<String, NIMMessage>]> {

        return NIMSDK.rx.search(session: self.session, text: text)
            .map({ (array) -> [AnimatableSectionModel<String, NIMMessage>] in
                return   [AnimatableSectionModel<String, NIMMessage>(model: text, items: array)]
            })

    }


    func cellViewModel(message: NIMMessage, searchText: String) -> EFPGroupSearchCellViewModel {

       return EFPGroupSearchCellViewModel(message: message, searchText: searchText)

    }
    func onCancellClicked() {
        EFPSceneRouter.shared.pop()

    }
    func onModelSelected(_ message: NIMMessage) {
        let viewModel = EFPLocalHistoryViewModel(message: message, session: session)
        let scene = EFPSessionScene.localHistory(viewModel)
        EFPSceneRouter.shared.transit(to: scene, transitionType: .modal)

    }

}

