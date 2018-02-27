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

extension UIViewController {

}

class EFPGroupLocalSearchContainerViewController: UIViewController, BindableViewType, EFPTableViewAddConstraintsProtocol, EFPSearchBarAddProtocol {
    var searchBar: UISearchBar = UISearchBar()

    var tableView: UITableView = UITableView()

    typealias ViewModelType = EFPGroupLocalSearchContainerViewModel
    var viewModel: EFPGroupLocalSearchContainerViewModel!
    func bindViewModel() {

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addTableViewConstraints()
        addSearchBar()
       let controlledText = searchBar.rx.text
        
        viewModel.controlProperty = controlledText
        
        searchBar.rx.textDidBeginEditing
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
               

            })
        searchBar.rx.cancelButtonClicked
            .subscribe(onNext: {
                self.viewModel.pop()
            }).disposed(by: rx.disposeBag)
//
//        let sessionSearchRecordViewController = EFPSessionSearchRecordViewController()
//
//        addChildViewController(sessionSearchRecordViewController)
//        view.addSubview(sessionSearchRecordViewController.view)
//        sessionSearchRecordViewController.didMove(toParentViewController: self)
        // Do any additional setup after loading the view.

      /*  let value = searchBar.rx.value
        value.observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                print($0)
                // self.viewModel.addResultViewController()
            }) */

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

