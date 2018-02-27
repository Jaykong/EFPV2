//
//  EFPRecentSessionScene+ViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/10.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
enum EFPRecentSessionScene {
    //case sessionList(RecentSessionListViewModel)

    case session(EFPSessionViewModel)
    case searchParent(SearchParentViewModel)
    case searchRecord(EFPSearchRecordViewModel)
    case sessionHistory(EFPSearchRecordViewModel)
    case searchResult(SearchResultViewModel)

   

}

extension EFPRecentSessionScene: EFPSceneType {
    func viewController() -> UIViewController {
        switch self {
        case let .session(sessionViewModel):
            let sessionViewController = EFPSessionViewController(session: sessionViewModel.session)
            sessionViewController?.sessionViewModel = sessionViewModel
            sessionViewController?.hidesBottomBarWhenPushed = true
            return sessionViewController!
       

        case let .searchRecord(searchResultViewModel):
            var sessionSearchResultViewController = EFPSessionSearchRecordViewController()
            sessionSearchResultViewController.bindViewModel(to: searchResultViewModel)
            sessionSearchResultViewController.hidesBottomBarWhenPushed = true
            let navigationController = UINavigationController(rootViewController: sessionSearchResultViewController)

            return navigationController

        case let .searchResult(searchResultViewModel):
            var sessionSearchResultViewController = EFPSearchResultViewController()
            sessionSearchResultViewController.bindViewModel(to: searchResultViewModel)
            sessionSearchResultViewController.hidesBottomBarWhenPushed = true
            let navigationController = UINavigationController(rootViewController: sessionSearchResultViewController)

            return navigationController

        case let .searchParent(searchParentViewModel):
            var searchParentViewController = EFPSearchParentViewController()
            searchParentViewController.bindViewModel(to: searchParentViewModel)

            searchParentViewController.hidesBottomBarWhenPushed = true
            let navigationController = UINavigationController(rootViewController: searchParentViewController)

            return navigationController
        default:
            return UIViewController()
        }
    }

}

