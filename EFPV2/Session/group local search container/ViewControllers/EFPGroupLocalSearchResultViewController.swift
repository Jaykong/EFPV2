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
import RxDataSources
import RxCocoa

class EFPGroupLocalSearchResultViewController: UIViewController, BindableViewType, EFPTableViewAddConstraintsProtocol {

    var tableView: UITableView = UITableView()

    var viewModel: EFPGroupLocalSearchResultViewModel!

    func bindViewModel() {

    }

    typealias ViewModelType = EFPGroupLocalSearchResultViewModel

    override func viewDidLoad() {
        super.viewDidLoad()

        addTableViewConstraints()
        tableView.register(cellWithClass: EFLocalMessageSearchResultCell.self)

        let dataSource = RxTableViewSectionedAnimatedDataSource<GroupLocalSearchResultSectionModel>(configureCell: { ds, tb, indexPath, item -> EFLocalMessageSearchResultCell in

            let cell = tb.dequeueReusableCell(withClass: EFLocalMessageSearchResultCell.self, for: indexPath)

            cell!.configure(withModel:item)

            return cell!

        })
        dataSource.decideViewTransition = { _, _, _ in .reload }
        viewModel.messages()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: rx.disposeBag)

        
        tableView.rx.modelSelected(EFPGroupLocalMessageSearchResultItem.self)
            .subscribe(onNext: {
                print($0)
                self.viewModel.onModelSelected($0)
                
            })
            .disposed(by: rx.disposeBag)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

