//////
//////  AppDelegate+tabBarController.swift
//////  EFPV2
//////
//////  Created by JayKong on 2018/2/8.
//////  Copyright © 2018 JayKong. All rights reserved.
//////
////
// import Foundation
// extension AppDelegate {
//    var tabBarController:UITabBarController  {
//
//        let homeViewModel = HomeViewModel()
//        let homeScene = Scene.home(homeViewModel)
//        let homeViewController = homeScene.viewController()
//
//        let studyViewModel = StudyViewModel()
//        let studyScene = Scene.study(studyViewModel)
//        let studyViewController = studyScene.viewController()
//
//        let scheduleViewModel = ScheduleViewModel()
//        let scheduleScene = Scene.schedule(scheduleViewModel)
//        let scheduleViewController = scheduleScene.viewController()
//
//        let recentSessionViewModel = RecentSessionListViewModel()
//        let recentSessionScene = Scene.sessionList(recentSessionViewModel)
//        let recentSessionListViewController = recentSessionScene.viewController()
//
//        let tabController = UITabBarController()
//        tabController.viewControllers = [homeViewController,studyViewController,scheduleViewController,recentSessionListViewController]
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.backgroundColor = UIColor.white
//        window?.makeKeyAndVisible()
//        window?.rootViewController = tabController
//        return tabController
//    }
//
//
//
// }
//
