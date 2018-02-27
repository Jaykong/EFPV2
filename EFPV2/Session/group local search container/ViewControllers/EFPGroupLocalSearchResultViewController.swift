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
   
    
   // var searchBar: UISearchBar = UISearchBar()
    

    var tableView: UITableView = UITableView()

    var viewModel: EFPGroupLocalSearchResultViewModel!
    var sectionOfMessages: Observable<[AnimatableSectionModel<String, NIMMessage>]>!
    var searchedText: Variable<String>!

    func bindViewModel() {

    }

    typealias ViewModelType = EFPGroupLocalSearchResultViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let groupLocalSearchContainerViewController = parent! as! EFPGroupLocalSearchContainerViewController
//        let searchBar = groupLocalSearchContainerViewController.searchBar
//
//        searchBar.rx.cancelButtonClicked
//            .subscribe(onNext: {
//                self.viewModel.onCancellClicked()
//
//            })
//            .disposed(by: rx.disposeBag)

        addTableViewConstraints()
        tableView.register(cellWithClass: EFLocalMessageSearchResultCell.self)

        let dataSource = RxTableViewSectionedAnimatedDataSource<AnimatableSectionModel<String, NIMMessage>>(configureCell: { ds, tb, indexPath, msg -> EFLocalMessageSearchResultCell in

            let cell = tb.dequeueReusableCell(withClass: EFLocalMessageSearchResultCell.self, for: indexPath)

            print(ds.sectionModels[indexPath.section].model)
            cell!.configure(withViewModel: self.viewModel.cellViewModel(message: msg, searchText: ds.sectionModels[indexPath.section].model))

            return cell!

        })
        dataSource.decideViewTransition = { _, _, _ in .reload }

        
     // let messages = viewModel.messages(controlPropety: searchBar.rx.text)
        let messages = viewModel.messages()

        .bind(to: tableView.rx.items(dataSource: dataSource))
       .disposed(by: rx.disposeBag)

        /*
        searchBar.rx.text.subscribe(onNext: { text in

            self.sectionOfMessages =
                self.viewModel.messages(text: text!)

            print(text!)

        })
            .disposed(by: rx.disposeBag)
*/

//        sectionOfMessages.asObservable().subscribe(onNext:{
//         //   print($0)
//        })
//
      /*  self.sectionOfMessages.drive(self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: self.rx.disposeBag)*/

        tableView.rx.modelSelected(NIMMessage.self)
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

