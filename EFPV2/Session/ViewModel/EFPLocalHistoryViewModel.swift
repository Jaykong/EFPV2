//
//  EFPLocalHistoryViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/25.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
class EFPLocalHistoryViewModel {
    // MARK: - Initialization and deinitialization
    let message: NIMMessage
    let session: NIMSession

    init(message: NIMMessage, session: NIMSession) {
        self.message = message
        self.session = session
    }


    // MARK: - output
    lazy var indexPath: IndexPath = {

        let messages = NIMSDK.shared().conversationManager.messages(in: session, message: nil, limit: 0)
        let index = messages?.index(of: message)
        return IndexPath(row: index!, section: 0)

    }()


    func pop() {
        EFPSceneRouter.shared.pop()
    }



}

