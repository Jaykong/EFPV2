//
//  MessageViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/4.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit

class MessageViewController: NIMSessionViewController {

    @objc func search() {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBarBtn = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(MessageViewController.search))
        let searchBarBtn2 = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(MessageViewController.search))
        let groupBarBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "group"), style: .done, target: self, action: Selector.init(("groupProfile")))
        
        
        
        self.navigationItem.rightBarButtonItems = [searchBarBtn,searchBarBtn2]
        
       

     
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
