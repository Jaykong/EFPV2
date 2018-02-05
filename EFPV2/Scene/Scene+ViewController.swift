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

    func viewController() -> UIViewController {
        switch self {
        case let .login(loginViewModel):
            let sb = UIStoryboard(name: "Login", bundle: nil)
            let loginViewController = sb.instantiateInitialViewController() as! LoginViewController
            loginViewController.logViewModel = loginViewModel
            return loginViewController

        case let .main(mainViewModel):

            let mainViewController = MainViewController()
            mainViewController.viewModel = mainViewModel
            return mainViewController

        case let .message(messageViewModel):
            let messageViewController = MessageViewController()
            return messageViewController

        }
    }

}

