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
    
    case session(SessionViewModel)
    case videoPlay(FullVideoPlayerViewModel)
    case sessionImageView(SessionImageViewModel)
}

extension EFPRecentSessionScene:EFPSceneType {
    func viewController() -> UIViewController {
        switch self {
        case let .session(sessionViewModel):
            let sessionViewController = EFPSessionViewController(session: sessionViewModel.session!)!
            sessionViewController.sessionViewModel = sessionViewModel
            sessionViewController.hidesBottomBarWhenPushed = true
           return sessionViewController
        case let .sessionImageView(sessionImageViewModel):
            let sessionImageViewController = EFPSessionFullImageViewController()
            
            sessionImageViewController.sessionImageViewModel = sessionImageViewModel
            return sessionImageViewController
        default:
            return UIViewController()
        }
    }
    
    
    
    
}
