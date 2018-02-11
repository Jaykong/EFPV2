//
//  MessageViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/5.
//  Copyright © 2018 JayKong. All rights reserved.
//

import AVKit
import Foundation
import RxSwift
class SessionViewModel {

    let sceneCoordinator = EFPSceneRouter.shared

    var session: NIMSession?

    func onTapCell(_ event: NIMKitEvent!) -> Bool {
        var handle = false

        if event.eventName == NIMKitEventNameTapContent {
            if let message = event.messageModel.message {
                let messageType = message.messageType
                if messageType == .image {

                    onShowFullImage(message: message)
                    handle = true
                }

                if messageType == .video {
                    onShowFullVideo(message: message)
                    handle = true
                }
            }
        }

        return handle
    }

    private func onShowFullVideo(message: NIMMessage) {
        let videoObject = message.messageObject as! NIMVideoObject
        guard let filePath = videoObject.url else {
            return
        }
        let url = URL(fileURLWithPath: filePath)

        let viewModel = FullVideoPlayerViewModel(url: url)
        let scene = Scene.videoPlay(viewModel)

        //  EFPSceneRouter.shared.transitionTo(scene: scene, type: .modal)
    }

    private func onShowFullImage(message: NIMMessage) {
        if let imageObject = message.messageObject as? NIMImageObject {
            let galleryItem = GalleryItem(itemId: message.messageId, thumbPath: imageObject.thumbPath!, imageURL: imageObject.url!, name: imageObject.displayName!, size: imageObject.size)
            let observable =
                Observable<GalleryItem>.of(galleryItem)
            var sessionImageViewModel =
                SessionImageViewModel()

            let defaultItem = GalleryItem(itemId: "1", thumbPath: "1", imageURL: "1", name: "1", size: CGSize(width: 1, height: 1))
            let driver = observable.asDriver(onErrorJustReturn: defaultItem)
            sessionImageViewModel.galleryItem = driver
            let sessionImageViewScene =
                EFPRecentSessionScene.sessionImageView(sessionImageViewModel)
                EFPSceneRouter.shared.transit(to: sessionImageViewScene, transitionType: .modal)
        }
    }

    func onDismissViewController() {
       // let scene = Scene.session(self)
        EFPSceneRouter.shared.pop()
        // sceneCoordinator.pop(scene: scene)
    }
}
