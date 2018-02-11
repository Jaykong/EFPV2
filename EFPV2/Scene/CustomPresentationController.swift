//
//  CustomPresentationController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/7.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit

class CustomPresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect(x: 200, y: 200, width: 200, height: 200)
    }
}
