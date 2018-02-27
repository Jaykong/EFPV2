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
    case groupLocalSearchResult(EFPGroupLocalSearchResultViewModel)
    case groupInfo(EFPGroupInfoViewModel)
    case groupRename(EFPGroupRenameViewModel)
    case fullVideoPlay(FullVideoPlayerViewModel)
    case sessionImageView(SessionImageViewModel)
    case localHistory(EFPLocalHistoryViewModel)
    case groupSearchContainer(EFPGroupLocalSearchContainerViewModel)
}
extension EFPSessionScene: EFPSceneType {
    func viewController() -> UIViewController {
        switch self {
        case let .groupLocalSearchResult(viewmodel):
            var groupSearchViewController = EFPGroupLocalSearchResultViewController()
           // let navigation = UINavigationController(rootViewController: groupSearchViewController)

            groupSearchViewController.bindViewModel(to: viewmodel)

            return groupSearchViewController

        case let .groupInfo(viewmodel):
            var groupInfoViewController = EFPGroupInfoViewController()
            groupInfoViewController.bindViewModel(to: viewmodel)
            return groupInfoViewController

        case .groupRename(let viewMdoel):
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
        case let .localHistory(viewModel):
            var localHistorySessionViewController = EFPLocalHistorySessionViewController(session: viewModel.session)

            localHistorySessionViewController?.bindViewModel(to: viewModel)
            return localHistorySessionViewController!
        case let .groupSearchContainer(viewModel):
            var groupLocalSearchContainerViewController = EFPGroupLocalSearchContainerViewController()
            
            groupLocalSearchContainerViewController.bindViewModel(to: viewModel)
            let navigationController = UINavigationController(rootViewController: groupLocalSearchContainerViewController)
            return navigationController
        }
    }

}
