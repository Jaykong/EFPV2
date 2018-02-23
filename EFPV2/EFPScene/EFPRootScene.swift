//
//  EFPRootScene.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/10.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
enum EFPRootScene: EFPSceneType {
    case login(LoginViewModel)
    case tabBar
}

extension EFPRootScene {

    func viewController() -> UIViewController {
        switch self {
        case let .login(vm):

            return EFPLoginViewController(logViewModel: vm)
        case .tabBar:
            let tabController = UITabBarController()

            let scenes = TabBarScene.all

            var controllers = [UIViewController]()

            for scene in scenes {
                let viewController = scene.viewController()

                switch scene {
                case let .sessionList(title, image, selectedImage), let .home(title, image, selectedImage), let .study(title, image, selectedImage), let .schedule(title, image, selectedImage):
                    viewController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage.withRenderingMode(.alwaysOriginal))
                }

                controllers.append(viewController)
            }

            tabController.viewControllers = controllers
            tabController.selectedIndex = 3

            return tabController
        }
    }
}

