//
//  EFPContainerRouter.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/27.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
enum EFPContainerChildScene {
    case searchRecord(EFPSearchRecordViewModel)
    case groupLocalSearchResult(EFPGroupLocalSearchResultViewModel)
}

extension EFPContainerChildScene {
    func viewController() -> UIViewController {
        switch self {

        case let .searchRecord(searchResultViewModel):
            var sessionSearchResultViewController = EFPSessionSearchRecordViewController()
            sessionSearchResultViewController.bindViewModel(to: searchResultViewModel)
            sessionSearchResultViewController.hidesBottomBarWhenPushed = true
            // let navigationController = UINavigationController(rootViewController: sessionSearchResultViewController)

            return sessionSearchResultViewController
        case let .groupLocalSearchResult(viewmodel):
            var groupSearchViewController = EFPGroupLocalSearchResultViewController()
            //let navigation = UINavigationController(rootViewController: groupSearchViewController)

            groupSearchViewController.bindViewModel(to: viewmodel)

            return groupSearchViewController
        }
    }
}
protocol EFPContainerRouterProtocol {
    func add(childScene: EFPContainerChildScene)
    func remove(childScene: EFPContainerChildScene)
}
struct EFPContainerRouter: EFPContainerRouterProtocol {
    var parentVC: UIViewController

    func add(childScene: EFPContainerChildScene) {
        removeAll()
        let viewController = childScene.viewController()
        parentVC.view.addSubview(viewController.view)
        parentVC.addChildViewController(viewController)
        viewController.didMove(toParentViewController: parentVC)

    }

    func remove(childScene: EFPContainerChildScene) {
        let childVC = childScene.viewController()

        childVC.willMove(toParentViewController: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParentViewController()

    }

    private func removeAll() {
        
        var childControllers = parentVC.childViewControllers
        childControllers.removeAll()
    }

}

