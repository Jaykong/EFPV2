//
//  MainViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/29.
//  Copyright © 2018 JayKong. All rights reserved.
//

import BadgeSwift
import RxDataSources
import RxSwift
import SnapKit
import UIKit

class EFPRecentSessionListViewController: NIMSessionListViewController {
    // var tableView:UITableView!
    var sectionedReloadDataSource: RxTableViewSectionedReloadDataSource<SectionOfRecentSession>!

    var viewModel: RecentSessionListViewModel!
    let disposeBag = DisposeBag()
    var searchBar: UISearchBar!

    func addSearchbarConstraints() {

        searchBar.snp.makeConstraints { make in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(tableView.snp.top)
        }
    }

    fileprivate func addTableviewConstraints() {

        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

   
 
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RecentSessionListViewModel()

       

        searchBar = UISearchBar()

        view.addSubview(searchBar)

        //        viewModel.navigationTitle.subscribe(onNext: {
        //           // self.title = $0
        //        }).disposed(by: disposeBag)

        addSearchbarConstraints()

        addTableviewConstraints()

       
        searchBar.delegate = self

        view.bringSubview(toFront: tableView)

        /*
         // MARK: - click cell

         tableView.rx.modelSelected(RecentSession.self)
         .subscribe(onNext: { model in

         self.viewModel.onCreateMessage(recent: model)

         }).disposed(by: disposeBag)
         */

        /*
         searchBar.rx.cancelButtonClicked.bind { [weak self] in
         if let strongSelf = self {
         strongSelf.view.bringSubview(toFront: strongSelf.tableView)
         strongSelf.searchBar.showsCancelButton = false
         strongSelf.searchBar.resignFirstResponder()
         strongSelf.navigationController?.setNavigationBarHidden(false, animated: true)
         }

         }
         .disposed(by: disposeBag)
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension EFPRecentSessionListViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(_: UISearchBar) {
        searchBar.showsCancelButton = true

        navigationController?.setNavigationBarHidden(true, animated: true)

    }

    func searchBarCancelButtonClicked(_: UISearchBar) {
        view.bringSubview(toFront: tableView)
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func searchBar(_: UISearchBar, textDidChange _: String) {

        view.bringSubview(toFront: tableView)
    }
}

// MARK: - overide tableview delegate

extension EFPRecentSessionListViewController {

    override func onSelectedRecent(_ recent: NIMRecentSession!, at indexPath: IndexPath!) {
        viewModel.onSelectedRecent(recent, at: indexPath)
    }

    override func name(for recent: NIMRecentSession!) -> String {

        return viewModel.name(for: recent)
    }
}
