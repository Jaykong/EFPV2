//
//  Scene+ViewController.swift
//  JKSFViewController
//
//  Created by JayKong on 2018/1/28.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import UIKit
extension Scene {

    /// given different model, instantiate different view controller
    ///
    /// - Returns: ui view controller
    func viewController() -> UIViewController {
        switch self {
        case .login(let loginViewModel):
            let sb = UIStoryboard(name: "Login", bundle: nil)
            let loginViewController = sb.instantiateInitialViewController() as! LoginViewController
            loginViewController.logViewModel = loginViewModel
            return loginViewController
            
        case .main(let maiviewModel):
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let mainViewController = sb.instantiateInitialViewController()
            return mainViewController!
        }
    }
    
   
}
