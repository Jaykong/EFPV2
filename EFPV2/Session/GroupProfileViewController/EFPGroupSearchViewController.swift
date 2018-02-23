//
//  EFPGroupSearchViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/21.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx
class EFPGroupSearchViewController: UIViewController, BindableViewType {
    var viewModel: EFPGroupSearchViewModel!

    func bindViewModel() {

    }

    typealias ViewModelType = EFPGroupSearchViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = true
        searchBar.becomeFirstResponder()
        navigationItem.titleView = searchBar

        searchBar.rx.cancelButtonClicked
            .subscribe(onNext: {
                self.viewModel.onCancellClicked()

            })
        .disposed(by: rx.disposeBag)
        
        searchBar.rx.value.subscribe(onNext:{
            print($0)
        })
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

