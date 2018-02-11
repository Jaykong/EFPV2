//
//  LoginViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/29.
//  Copyright © 2018 JayKong. All rights reserved.
//

import RxSwift
import UIKit
class EFPLoginViewController: UIViewController {
    var logViewModel: LoginViewModel

    init(logViewModel: LoginViewModel) {
        self.logViewModel = logViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        logViewModel.onSucessReturnToken()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
