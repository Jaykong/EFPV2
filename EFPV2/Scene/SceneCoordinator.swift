//
//  SceneCoordinator.swift
//  JKSFViewController
//
//  Created by JayKong on 2018/1/28.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import UIKit
 class SceneCoordinator:SceneCoordinatorType {
    let window:UIWindow
    var currentViewController:UIViewController
    required init(window:UIWindow,currentViewController:UIViewController) {
        self.window = window
        self.currentViewController = currentViewController
    }
    
    func transitionTo(scene: Scene, type: TransitionType) {
        switch type {
        case .modal:
            let viewController = scene.viewController()
            
            currentViewController.present(viewController, animated: true, completion: nil)
        case .push:
            let viewController = scene.viewController()
            
            currentViewController.show(viewController, sender: nil)
            
            
        case .root:
            window.rootViewController = scene.viewController()
            
        }
        
    }
    
    func pop(scene: Scene) {
        
    }
    
    
}
