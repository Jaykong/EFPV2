//
//  SceneCoordinator.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/8.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
class SceneCoordinator: SceneCoordinatorType {

    var currentViewController: UIViewController!

    func transitionTo(scene: Scene, type: TransitionType) {
        switch type {
        case .push:
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let rootViewController = delegate.window?.rootViewController
            currentViewController = rootViewController
            rootViewController?.show(scene.viewController(), sender: nil)

        case .modal:
            currentViewController.present(scene.viewController(), animated: true, completion: {

            })
        }
    }

    func pop(scene _: Scene) {
        currentViewController.dismiss(animated: true, completion: nil)
    }
}
