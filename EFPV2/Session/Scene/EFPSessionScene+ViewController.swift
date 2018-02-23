//
//  EFPSessionScene.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/23.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import AVKit
// MARK: - session scene
enum EFPSessionScene {
    case groupSearch(EFPGroupSearchViewModel)
    case groupInfo(EFPGroupInfoViewModel)
    case groupRename(EFPGroupRenameViewModel)
    case fullVideoPlay(FullVideoPlayerViewModel)
    case sessionImageView(SessionImageViewModel)
}
extension EFPSessionScene: EFPSceneType {
    func viewController() -> UIViewController {
        switch self {
        case let .groupSearch(viewmodel):
            var groupSearchViewController = EFPGroupSearchViewController()
            let navigation = UINavigationController(rootViewController: groupSearchViewController)

            groupSearchViewController.bindViewModel(to: viewmodel)

            return navigation

        case let .groupInfo(viewmodel):
            var groupInfoViewController = EFPGroupInfoViewController()
            groupInfoViewController.bindViewModel(to: viewmodel)
            return groupInfoViewController

        case  .groupRename(let viewMdoel):
            var groupRenameViewController = EFPGroupRenameViewController()
            groupRenameViewController.bindViewModel(to: viewMdoel)
            return groupRenameViewController

        case let .sessionImageView(sessionImageViewModel):
            let sessionImageViewController = EFPSessionFullImageViewController()

            sessionImageViewController.sessionImageViewModel = sessionImageViewModel
            return sessionImageViewController

        case let .fullVideoPlay(viewModel):
            let playerViewController = AVPlayerViewController()
            playerViewController.player = AVPlayer(url: viewModel.url)

            return playerViewController
        }

    }
}

