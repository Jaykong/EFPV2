//
//  SearchResultViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/2.
//  Copyright © 2018 JayKong. All rights reserved.
//

import RxDataSources
import RxSwift
import SnapKit
import UIKit
import NSObject_Rx
class EFPSessionSearchRecordViewController: UIViewController, BindableViewType, EFPTableViewAddConstraintsProtocol {
    var tableView: UITableView = UITableView()
    var viewModel: EFPSearchRecordViewModel!
    var searchBar = UISearchBar()

    func bindViewModel() {

    }

    typealias ViewModelType = EFPSearchRecordViewModel

    fileprivate func setupRecentSearchRecordTableViewDatasource() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RecordCell")
        let datasource = RxTableViewSectionedAnimatedDataSource<SectionOfRecentSearchRecord>(configureCell: { (_, tv: UITableView, _, item) -> UITableViewCell in
            let cell = tv.dequeueReusableCell(withIdentifier: "RecordCell")
            cell?.textLabel?.text = item
            return cell!
        })
        datasource.titleForHeaderInSection = { ds, index in
            ds.sectionModels[index].title
        }
        let searchResultViewModel = EFPSearchRecordViewModel()

        searchResultViewModel.sectionOfRecent
            .bind(to: (tableView.rx.items(dataSource: datasource)))
            .disposed(by: rx.disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.becomeFirstResponder()
        searchBar.showsCancelButton = true
        self.parent?.navigationItem.titleView = searchBar

        addTableViewConstraints()

        setupRecentSearchRecordTableViewDatasource()
        // MARK: - item Selected

        Observable.zip(tableView.rx.itemSelected, tableView.rx.modelSelected(String.self)) .bind { (indexPath, model) in
            self.tableView.deselectRow(at: indexPath, animated: true)
            // self.viewModel.onSelectCell(at: indexPath, model: model)
            var searchResultViewController = EFPSearchResultViewController()
            let searchResultViewModel = SearchResultViewModel()
            searchResultViewController.bindViewModel(to:searchResultViewModel )
            self.parent?.addChildViewController(searchResultViewController)
            self.parent?.view.addSubview(searchResultViewController.view)
            searchResultViewController.didMove(toParentViewController: self.parent)

            self.willMove(toParentViewController: nil)
            self.view.removeFromSuperview()
            self.removeFromParentViewController()

        }

            .disposed(by: rx.disposeBag)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

