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
class EFPSessionSearchResultViewController: UIViewController {
   // var searchResultTableView: UITableView!
    var searchbar: UISearchBar!
    var recentRecordTableView: UITableView!
    var searchBar: UISearchBar!

    fileprivate func setupRecentSearchRecordTableViewDatasource() {
        recentRecordTableView.register(UITableViewCell.self, forCellReuseIdentifier: "RecordCell")
        let datasource = RxTableViewSectionedAnimatedDataSource<SectionOfRecentSearchRecord>(configureCell: { (_, tv: UITableView, _, item) -> UITableViewCell in
            let cell = tv.dequeueReusableCell(withIdentifier: "RecordCell")
            cell?.textLabel?.text = item
            return cell!
        })
        datasource.titleForHeaderInSection = { ds, index in
            ds.sectionModels[index].title
        }
        let searchResultViewModel = SearchResultViewModel()
        
        searchResultViewModel.sectionOfRecent
            .bind(to: (recentRecordTableView.rx.items(dataSource: datasource)))
            .disposed(by: rx.disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchResultTableView = UITableView()
//        view.addSubview(searchResultTableView)
        
        recentRecordTableView = UITableView()
        view.addSubview(recentRecordTableView)
        
        searchBar = UISearchBar()
        view.addSubview(searchBar)
        
//        searchResultTableView.snp.makeConstraints { make in
//            make.edges.equalTo(view)
//        }
//
        recentRecordTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        setupRecentSearchRecordTableViewDatasource()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
