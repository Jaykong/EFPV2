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

    

    // MARK: - output

    /* public lazy var messages: Driver<[NIMMessage]> = {
        return NIMSDK.rx.search(session: self.session, text: searchText)
            .asDriver(onErrorJustReturn: [])

    }()
 */
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

    func messages(controlPropety searchText: ControlProperty<String?>) -> Observable<[AnimatableSectionModel<String, NIMMessage>]> {

       return
        searchText
            .filter({ (str) -> Bool in
                str!.count > 0
            })
            .flatMap { (str)  in

           return self.messages(text: str!)
        }

    }

    func messages(text: String) -> Observable<[AnimatableSectionModel<String, NIMMessage>]> {

        return NIMSDK.rx.search(session: self.session, text: text)
            .map({ (array) -> [AnimatableSectionModel<String, NIMMessage>] in
                return   [AnimatableSectionModel<String, NIMMessage>(model: text, items: array)]
            })

    }

    /*
    func messages(text: String) -> Driver<[AnimatableSectionModel<String, NIMMessage>]> {

        return NIMSDK.rx.search(session: self.session, text: text)
            .map({ (array) -> [AnimatableSectionModel<String, NIMMessage>] in
               return   [AnimatableSectionModel<String, NIMMessage>(model: "header", items: array)]
            })
            .asDriver(onErrorJustReturn: [AnimatableSectionModel<String, NIMMessage>(model: "header", items: [])])

    } */
    /*
    public lazy var messages: Driver<[AnimatableSectionModel]> = { _ in
     
        return NIMSDK.rx.search(session: self.session, text: searchText)
            .map({ (messages:[NIMMessage]) in
     
            })
     
     
        //return Driver<[AnimatableSectionModel]>()
     
    }()
    */

    func cellViewModel(message: NIMMessage, searchText: String) -> EFPGroupSearchCellViewModel {

       return EFPGroupSearchCellViewModel(message: message, searchText: searchText)

    }
    func onCancellClicked() {
        EFPSceneRouter.shared.pop()

    }
    func onModelSelected(_ message: NIMMessage) {
        let viewModel = EFPLocalHistoryViewModel(message: message, session: session)
        let scene = EFPSessionScene.localHistory(viewModel)
        EFPSceneRouter.shared.transit(to: scene, transitionType: .push)

    }

}

