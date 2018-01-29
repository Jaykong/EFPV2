//
//  LoginViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/29.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit
import RxSwift
class LoginViewController: UIViewController {
    var logViewModel:LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logViewModel.onPresentMain()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
