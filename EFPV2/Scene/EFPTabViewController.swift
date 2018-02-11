//
//  EFPTabViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/8.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit

class EFPTabViewController: UITabBarController, UITabBarControllerDelegate {

    var sceneCoordinate: SceneCoordinator = SceneCoordinator()

    var highLightColor: UIColor!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()

        highLightColor = UIColor(hex: 0xF32B6E)
    }

    override func viewWillAppear(_: Bool) {
    }

    private func setupChildControllers() {

        var arrayM = [UIViewController]()

        for dict in controllerInfoArray {
            arrayM.append(controller(dict: dict))
        }

        let messageVC = EFPRecentSessionListViewController()

        //    messageVC.viewModel = RecentSessionListViewModel(EFPSceneRouter.shared)
        messageVC.title = NSLocalizedString("Messages", comment: "recent session")
        messageVC.tabBarItem.image = UIImage(named: "tabbar_messages_normal")
        messageVC.tabBarItem.selectedImage = UIImage(named: "tabbar_messages_selected")?.withRenderingMode(.alwaysOriginal)
        messageVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: highLightColor], for: .selected)
        messageVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        let naviSessionListVC = UINavigationController(rootViewController: messageVC)
        arrayM.append(naviSessionListVC)

        viewControllers = arrayM
    }

    private func controller(dict: [String: Any]) -> UIViewController {

        guard let clsName = dict["vcClassName"] as? String,
            let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let navTag = dict["tag"] as? Int,
            let cls = NSClassFromString(Bundle.main.nameSpaceStirng + "." + clsName) as? UIViewController.Type
        else {
            return UIViewController()
        }

        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: "tabbar_\(imageName)_normal")
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_\(imageName)_selected")?.withRenderingMode(.alwaysOriginal)

        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: highLightColor], for: .selected)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.tag = navTag

        return nav
    }

    // MARK: page config array

    private let controllerInfoArray = [
        ["vcClassName": "HomeViewController", "tag": 1, "title": NSLocalizedString("Home", comment: "home page"), "imageName": "homepage"],
        ["vcClassName": "StudyViewController", "tag": 2, "title": NSLocalizedString("Study", comment: "study page"), "imageName": "study"],
        ["vcClassName": "ScheduleViewController", "tag": 3, "title": NSLocalizedString("Schedule", comment: "schedule page"), "imageName": "schedule"],
    ]
}
