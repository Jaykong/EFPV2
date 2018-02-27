//
//  EFPGroupLocalSearchContainerViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/26.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxCocoa
struct EFPGroupLocalSearchContainerViewModel {
    let session:NIMSession

    init(session: NIMSession) {
        self.session = session
    }
    
    func pop() {
        EFPSceneRouter.shared.pop()
    }
}
