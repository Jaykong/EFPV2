//
//  LoginViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/29.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var logViewModel:LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logViewModel = LoginViewModel()
        logViewModel.logViewModelDelegate = {self}
        logViewModel.accessTokenSucess { (str) in
            print(str)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
