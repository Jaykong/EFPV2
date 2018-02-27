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
    func viewController(parent:UIViewController) -> UIViewController {
        switch self {
        
        case let .searchRecord(searchResultViewModel):
            var sessionSearchResultViewController = EFPSessionSearchRecordViewController()
            sessionSearchResultViewController.bindViewModel(to: searchResultViewModel)
            sessionSearchResultViewController.hidesBottomBarWhenPushed = true
            let navigationController = UINavigationController(rootViewController: sessionSearchResultViewController)
            
            return navigationController
        case let .groupLocalSearchResult(viewmodel):
            var groupSearchViewController = EFPGroupLocalSearchResultViewController()
            // let navigation = UINavigationController(rootViewController: groupSearchViewController)
            
            groupSearchViewController.bindViewModel(to: viewmodel)
            
            return groupSearchViewController
        }
    }
}
