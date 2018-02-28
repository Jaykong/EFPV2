//
//  EFPSearchResultViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/11.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx
import RxDataSources

class EFPSearchResultViewController: UIViewController, EFPTableViewAddConstraintsProtocol,BindableViewType {
    typealias ViewModelType = EFPSearchResultViewModel

    var viewModel: EFPSearchResultViewModel!
    
    func bindViewModel() {
        
    }
    
    
    
    var tableView: UITableView = UITableView()

    var items:[SessionSearchResult]!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = SessionSearchResult(timeStamp: Date(), message: "weclome to summper camp", customTeamName: "Jonny's Summer Camp", paName: "pa-joey", avatar: "avatar")
        
        
        items = [result]
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    
       // addTableViewConstraints()
        
        tableView.register(EFPSearchResultCell.self, forCellReuseIdentifier: "EFPSearchResultCell")
        
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.delegate = self
        tableView.dataSource = self
//        searchBar.rx.cancelButtonClicked
//            .subscribe(onNext: {
//                self.viewModel.pop()
//            })
//            .disposed(by: rx.disposeBag)
//        
//        viewModel.selectedModel.asObservable().subscribe(onNext:{
//            self.searchBar.text = $0
//        })
        
        
        
        
        /*
        let dataSource =
            RxTableViewSectionedReloadDataSource<SectionOfSearchResult>( configureCell: { (ds, tb:UITableView, indexPath, searchResult) -> EFPSearchResultCell in
            let cell = tb.dequeueReusableCell(withIdentifier: "EFPSearchResultCell") as! EFPSearchResultCell
            cell.customTeamName.text = searchResult.customTeamName
            cell.message.text = searchResult.message
            cell.paName.text = searchResult.paName
            cell.timeStamp.text = formater.string(from: searchResult.timeStamp)
            return cell
            
        })
        let result = SessionSearchResult(timeStamp: Date(), message: "weclome to summper camp", customTeamName: "Jonny's Summer Camp", paName: "pa-joey", avatar: "avatar")
        let section = SectionOfSearchResult(header: "header1", items: [result])
        
        Observable.of([section])
        .bind(to: tableView.rx.items(dataSource: dataSource))
        
        */
        
        
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension EFPSearchResultViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}

extension EFPSearchResultViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EFPSearchResultCell") as! EFPSearchResultCell
        let searchResult:SessionSearchResult = items[indexPath.row]
        cell.customTeamName.text = searchResult.customTeamName
        cell.message.text = searchResult.message
        cell.paName.text = searchResult.paName
        let formater = DateFormatter()
        formater.timeStyle = .short
        formater.dateStyle = .short
        cell.timeStamp.text = formater.string(from: searchResult.timeStamp)
        return cell
    }
    
    
}

