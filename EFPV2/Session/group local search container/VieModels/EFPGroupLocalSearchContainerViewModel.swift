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
    
    var controlProperty:ControlProperty<String?>!
    func addChild() {
        let viewModel = EFPSearchRecordViewModel()
        let scene = EFPRecentSessionScene.searchRecord(viewModel)
        EFPSceneRouter.shared.transit(to: scene, transitionType: .addChild)
    }
    
    func addResultViewController() {
        let viewModel = EFPGroupLocalSearchResultViewModel(session: session)
        viewModel.controlProperty = controlProperty
        
        let scene = EFPSessionScene.groupLocalSearchResult(viewModel)
        EFPSceneRouter.shared.transit(to: scene, transitionType: .addChild)
            
    }
    
    
    func pop() {
        EFPSceneRouter.shared.pop()
    }
}
