//
//  EFPGroupLocalSearchContainerViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/26.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx


class EFPGroupLocalSearchContainerViewController: UIViewController, BindableViewType, EFPTableViewAddConstraintsProtocol, EFPSearchBarAddProtocol {
    var router:EFPContainerRouter!
    
    var searchBar: UISearchBar = UISearchBar()

    var tableView: UITableView = UITableView()

    typealias ViewModelType = EFPGroupLocalSearchContainerViewModel
    var viewModel: EFPGroupLocalSearchContainerViewModel!
    func bindViewModel() {

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        router = EFPContainerRouter(parentVC: self)
        addTableViewConstraints()
        addSearchBar()
        
        viewModel.controlProperty = searchBar.rx.text
        
        searchBar.rx.textDidBeginEditing
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                let viewModel = EFPSearchRecordViewModel()
                let scene = EFPContainerChildScene.searchRecord(viewModel)

                self.router.add(childScene: scene)
                
            })
        searchBar.rx.cancelButtonClicked
            .subscribe(onNext: {
                self.viewModel.pop()
            }).disposed(by: rx.disposeBag)


       let value = searchBar.rx.value
        value.observeOn(MainScheduler.instance)
            .subscribe({_ in
                let viewModel = EFPGroupLocalSearchResultViewModel(session: self.viewModel.session)
                viewModel.controlProperty = self.viewModel.controlProperty
                let scene = EFPContainerChildScene.groupLocalSearchResult(viewModel)
                self.router.add(childScene: scene)
            })
 

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //viewModel.addChild()
        print(#function)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

