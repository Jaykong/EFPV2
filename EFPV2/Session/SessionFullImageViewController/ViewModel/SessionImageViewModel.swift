//
//  SessionImageViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/5.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
struct SessionImageViewModel {
    let sceneCoordinator = EFPSceneRouter.shared

    // url
    var galleryItem: Driver<GalleryItem>!

    func onDismissViewController() {
        EFPSceneRouter.shared.pop()
       
    }
}
