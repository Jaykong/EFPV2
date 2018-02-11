//
//  CustomViewControllerTransitioning.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/7.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation

class CustomViewControllerTransitioning: NSObject, UIViewControllerTransitioningDelegate {
    func animationController(forPresented _: UIViewController, presenting _: UIViewController, source _: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        return nil
    }

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source _: UIViewController) -> UIPresentationController? {

        let presentationController = CustomPresentationController(presentedViewController: presented, presenting: presenting)
        return presentationController
    }
}
