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

class MainViewController: UIViewController {
    var tableView: UITableView!
    var recentTableView: UITableView!
    var sectionedReloadDataSource: RxTableViewSectionedReloadDataSource<SectionOfRecentSession>!

    var viewModel: MainViewModel!
    let disposeBag = DisposeBag()
    //var searchController: UISearchController!
    var searchBar: UISearchBar!

    func addSearchbar() {

        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(tableView.snp.top)
        }
    }
    fileprivate func addTableview() {

        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    fileprivate func setupRecentDatasource() {
        self.recentTableView.register(UITableViewCell.self, forCellReuseIdentifier: "RecordCell")
        let datasource = RxTableViewSectionedAnimatedDataSource<SectionOfRecentSearchRecord>(configureCell: { (ds, tv: UITableView, indexPath, item) -> UITableViewCell in
            let cell = tv.dequeueReusableCell(withIdentifier: "RecordCell")
            cell?.textLabel?.text = item
            return cell!
        })
        datasource.titleForHeaderInSection = { ds, index in
            return ds.sectionModels[index].title

        }
        let searchResultViewModel = SearchResultViewModel()

        searchResultViewModel.sectionOfRecent
            .bind(to: (self.recentTableView.rx.items(dataSource: datasource)))
            .disposed(by: self.disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //searchController = UISearchController(searchResultsController: nil)

        //  searchController.searchResultsUpdater = self
        //searchBar = searchController.searchBar

        recentTableView = UITableView()
        view.addSubview(recentTableView)

        searchBar = UISearchBar()
        searchBar.configure()

        tableView = UITableView()
        view.addSubview(tableView)
        view.addSubview(searchBar)

       
        viewModel.navigationTitle.subscribe(onNext: {
            self.title = $0
        }).disposed(by: disposeBag)

        addSearchbar()

        addTableview()

        recentTableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        tableView.delegate = self

        let nib = UINib(nibName: "RecentSessionCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "RecentSessionCell")

        let sectionedReloadDataSource = RxTableViewSectionedReloadDataSource<SectionOfRecentSession>(configureCell: { (_: TableViewSectionedDataSource<SectionOfRecentSession>, tv: UITableView, ip: IndexPath, recentSession: RecentSession) -> RecentSessionCell in
            let cell = tv.dequeueReusableCell(withIdentifier: "RecentSessionCell", for: ip) as! RecentSessionCell

            let cellViewModel = RecentSessionCellViewModel(recentSession: recentSession)
            cell.configure(withViewModel: cellViewModel)
            return cell
        })

        viewModel.sections
            .bind(to: tableView.rx.items(dataSource: sectionedReloadDataSource))
            .disposed(by: disposeBag)

        setupRecentDatasource()

        // MARK: - click cell

        tableView.rx.modelSelected(RecentSession.self)
            .subscribe(onNext: { model in

                self.viewModel.onCreateMessage(recent: model)

            }).disposed(by: disposeBag)

        // MARK:

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
        searchBar.delegate = self
        // MARK: - Start edit search content

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 68.0
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for _: UISearchController) {

    }
}
extension MainViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true

        self.navigationController?.setNavigationBarHidden(true, animated: true)

        self.view.bringSubview(toFront: self.recentTableView)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.bringSubview(toFront: self.tableView)
        self.searchBar.showsCancelButton = false
        self.searchBar.resignFirstResponder()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        self.view.bringSubview(toFront: self.tableView)

    }

}

