//
//  EFPGroupLocalSearchRecordController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/28.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit

class EFPGroupLocalSearchRecordController: UIViewController,EFPSearchRecordControllerProtocol,BindableViewType {
    
    typealias ViewModelType = EFPGroupLocalSearchRecordViewModel
    var viewModel: EFPGroupLocalSearchRecordViewModel!
    
    func bindViewModel() {
        
    }
    
    var searchBar: UISearchBar = UISearchBar()
    
    var tableView: UITableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
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
