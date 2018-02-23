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
class EFPGroupSearchViewModel {
    // MARK: - input
    var searchText: String
    var session: NIMSession

    init(searchText: String, session: NIMSession) {
        self.searchText = searchText
        self.session = session
    }
    // MARK: - Initialization and deinitialization

    

  

    // MARK: - output
    

    public lazy var messages: Driver<[NIMMessage]> = {
        return NIMSDK.rx.search(session: self.session, text: searchText)
            .asDriver(onErrorJustReturn: [])

    }()

    func onCancellClicked() {
        EFPSceneRouter.shared.pop()

    }

}

