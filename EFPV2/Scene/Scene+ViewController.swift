//
//  Scene+ViewController.swift
//  JKSFViewController
//
//  Created by JayKong on 2018/1/28.
//  Copyright © 2018 JayKong. All rights reserved.
//

import AVKit
import Foundation
import UIKit
extension Scene {

    func viewController() -> UIViewController {
        switch self {
        case let .login(loginViewModel):
            let sb = UIStoryboard(name: "Login", bundle: nil)
            let loginViewController = sb.instantiateInitialViewController() as! EFPLoginViewController
            loginViewController.logViewModel = loginViewModel
            return loginViewController

//        case let .sessionList(mainViewModel):
            //
//            let mainViewController = RecentSessionListViewController()
//            mainViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
//            mainViewController.viewModel = mainViewModel
//            return mainViewController

        case let .session(sessionViewModel):
            let messageViewController = EFPSessionViewController(session: sessionViewModel.session!)!
            messageViewController.sessionViewModel = sessionViewModel

            return messageViewController
        case let .sessionImageView(sessionImageViewModel):
            let sessionImageViewController = EFPSessionFullImageViewController()

            sessionImageViewController.sessionImageViewModel = sessionImageViewModel
            return sessionImageViewController
        case let .videoPlay(viewModel):
            let playerViewController = AVPlayerViewController()
            let url = viewModel.url
            let avPlayer = AVPlayer(url: url)
            playerViewController.player = avPlayer

            return playerViewController
        //        case .study(let viewModel):
        //            let studyViewController = StudyViewController()
        //            studyViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        //            studyViewController.viewModel = viewModel
        //            return studyViewController
        //        case .home(let viewModel):
        //            let homeViewController = HomeViewController()
        //            homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        //            homeViewController.viewModel = viewModel
        //            return homeViewController
        //        case .schedule(let viewModel):
        //            let scheduleViewController = ScheduleViewController()
        //            scheduleViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        //            scheduleViewController.viewModel = viewModel
        //            return scheduleViewController
        case .tabBar:
            let tabBarController = EFPTabViewController()
            tabBarController.selectedIndex = 1
            return tabBarController
        }
    }
}
