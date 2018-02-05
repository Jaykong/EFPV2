//
//  SearchResultViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/2.
//  Copyright © 2018 JayKong. All rights reserved.
//

import SnapKit
import UIKit
import RxDataSources
import RxSwift
class SearchResultViewController: UIViewController {
    var tableView: UITableView!
    var searchbar:UISearchBar!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        
       





    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
