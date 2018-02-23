//
//  UINavigationItem+Extension.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/21.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
extension UINavigationItem {
    func arrowBackBarBtn(target: Any?, action: Selector?) {
        leftItemsSupplementBackButton = false
        leftBarButtonItem = UIBarButtonItem(image: Asset.NavigationBar.naviBack.image, style: .plain, target: target, action: action)
    }
}

