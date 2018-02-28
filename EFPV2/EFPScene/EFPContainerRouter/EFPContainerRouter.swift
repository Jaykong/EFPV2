//
//  EFPContainerRouter.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/27.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
enum EFPContainerChildScene {
    case searchRecord(EFPGroupLocalSearchRecordViewModel)
    case groupLocalSearchResult(EFPGroupLocalSearchResultViewModel)
}

extension EFPContainerChildScene {
    func viewController() -> UIViewController {
        switch self {

        case let .searchRecord(viewModel):
            var groupLocalSearchRecordController = EFPGroupLocalSearchRecordController()
            groupLocalSearchRecordController.bindViewModel(to: viewModel)
            groupLocalSearchRecordController.hidesBottomBarWhenPushed = true
            // let navigationController = UINavigationController(rootViewController: sessionSearchResultViewController)

            return groupLocalSearchRecordController
        case let .groupLocalSearchResult(viewModel):
            var groupSearchViewController = EFPGroupLocalSearchResultViewController()
            //let navigation = UINavigationController(rootViewController: groupSearchViewController)

            groupSearchViewController.bindViewModel(to: viewModel)

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

