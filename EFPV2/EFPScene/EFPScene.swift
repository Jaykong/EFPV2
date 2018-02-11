//
//  EFPScene.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/9.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit

protocol EFPSceneType {
    func viewController() -> UIViewController
}

enum TabBarScene: EFPSceneType {
    static var all: [TabBarScene] {
        var scenes = [TabBarScene]()
        scenes.append(.home(EFPLocalization.home, #imageLiteral(resourceName: "tabbar_homepage_normal"), #imageLiteral(resourceName: "tabbar_home_selected")))
        scenes.append(.study(EFPLocalization.study, #imageLiteral(resourceName: "tabbar_study_normal"), #imageLiteral(resourceName: "tabbar_study_selected")))
        scenes.append(.schedule(EFPLocalization.schedule, #imageLiteral(resourceName: "tabbar_schedule_normal"), #imageLiteral(resourceName: "tabbar_schedule_selected")))
        scenes.append(.sessionList(EFPLocalization.messages, #imageLiteral(resourceName: "tabbar_messages_normal"), #imageLiteral(resourceName: "tabbar_messages_selected")))

        return scenes
    }

    case sessionList(String, UIImage, UIImage)
    case home(String, UIImage, UIImage)

    case study(String, UIImage, UIImage)
    case schedule(String, UIImage, UIImage)
}



extension TabBarScene {
    func viewController() -> UIViewController {
        switch self {
        case .sessionList:

            let recentSessionListViewController = EFPRecentSessionListViewController()
            let navigationController = UINavigationController(rootViewController: recentSessionListViewController)
            
            return navigationController

        case .home:
            let homeViewController = EFPHomeViewController()
            return homeViewController
        case .study:
            let studyViewController = EFPStudyViewController()
            return studyViewController
        case .schedule:
            let scheduleViewController = EFPScheduleViewController()
            return scheduleViewController
        }
    }
}
