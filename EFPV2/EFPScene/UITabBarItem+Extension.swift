//
//  UITabBarController+Extension.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/9.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarItem {
    static func setupTabBarItemAttributes2() {
        let highLightColor = UIColor(hex: 0xF32B6E)

        UITabBarItem.appearance()
            .setTitleTextAttributes([NSAttributedStringKey.foregroundColor: highLightColor], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)], for: .normal)
    }
}

// extension EFPHomeViewController {
//
//    func setupTabItem() {
//        UITabBarItem.tabBarAttributes()
//
//        self.tabBarItem = UITabBarItem(title:EFPLocalization.home , image: #imageLiteral(resourceName: "tabbar_home"), selectedImage: #imageLiteral(resourceName: "tabbar_home_selected").withRenderingMode(.alwaysOriginal))
//    }
// }
//
// extension EFPRecentSessionListViewController {
//    func setupTabItem() {
//       self.tabBarItem = UITabBarItem(title:EFPLocalization.messages , image: #imageLiteral(resourceName: "tabbar_messages_normal"), selectedImage: #imageLiteral(resourceName: "tabbar_messages_selected").withRenderingMode(.alwaysOriginal))
//    }
//
// }
//
// extension EFPStudyViewController {
//    func setupTabItem() {
//        self.tabBarItem = UITabBarItem(title:EFPLocalization.study , image: #imageLiteral(resourceName: "tabbar_study_normal"), selectedImage: #imageLiteral(resourceName: "tabbar_study_selected").withRenderingMode(.alwaysOriginal))
//    }
//
// }
//
// extension EFPScheduleViewController {
//    func setupTabItem() {
//        self.tabBarItem = UITabBarItem(title:EFPLocalization.schedule , image: #imageLiteral(resourceName: "tabbar_schedule_normal"), selectedImage: #imageLiteral(resourceName: "tabbar_schedule_selected").withRenderingMode(.alwaysOriginal))
//    }
//
// }
