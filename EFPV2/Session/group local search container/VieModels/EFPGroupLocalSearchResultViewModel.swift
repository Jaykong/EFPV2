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

typealias GroupLocalSearchResultSectionModel = AnimatableSectionModel<String, EFPGroupLocalMessageSearchResultItem>
class EFPGroupLocalSearchResultViewModel {
    var session: NIMSession
    
    var controlProperty:ControlProperty<String?>!

    init(session: NIMSession) {
        self.session = session
    }
    
    
    func messages() -> Observable<[GroupLocalSearchResultSectionModel]> {
        
        return
            controlProperty
                .filter({ (str) -> Bool in
                    str!.count > 0
                })
                .flatMap { (str)  in
                    
                    return self.messages(text: str!)
        }
        
    }

    private func messages(text: String) -> Observable<[GroupLocalSearchResultSectionModel]> {

        return NIMSDK.rx.search(session: self.session, text: text)
            .map({ (array) -> [GroupLocalSearchResultSectionModel] in
                
                
                return [GroupLocalSearchResultSectionModel(model: "", items: array.map({ (message) -> EFPGroupLocalMessageSearchResultItem in
                    let cellViewModel = EFPGroupSearchCellViewModel(message: message, searchText: text)
                    return cellViewModel.item
                }))]
            })

    }


    func cellViewModel(message: NIMMessage, searchText: String) -> EFPGroupSearchCellViewModel {

       return EFPGroupSearchCellViewModel(message: message, searchText: searchText)

    }
    func onCancellClicked() {
        EFPSceneRouter.shared.pop()

    }
    func insertRecord(text:String) {
        RecentSearchRecordStore.shared.insert(atFirst: text)
    }
    func onModelSelected(_ item: EFPGroupLocalMessageSearchResultItem) {
        insertRecord(text: item.searchText)
        let viewModel = EFPLocalHistoryViewModel(message: item.message, session: session)
        let scene = EFPSessionScene.localHistory(viewModel)
        EFPSceneRouter.shared.transit(to: scene, transitionType: .modal)

    }

}

