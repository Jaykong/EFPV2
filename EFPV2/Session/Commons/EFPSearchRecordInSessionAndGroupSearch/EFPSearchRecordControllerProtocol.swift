//
//  EFPSearchRecordControllerProtocol.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/28.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxDataSources
import RxSwift
import RxCocoa
import NSObject_Rx
protocol EFPSearchRecordControllerProtocol: EFPSearchBarAddProtocol, EFPTableViewAddConstraintsProtocol {
    func setup()
    func configureTableView()
    func modelSelected()
}
extension EFPSearchRecordControllerProtocol where Self: UIViewController {
    func setup() {
        addSearchBar()
        addTableViewConstraints()
        configureTableView()
    }

    var sectionOfRecent: Observable<[SectionOfRecentSearchRecord]> {
        return Observable<[SectionOfRecentSearchRecord]>.create { (observer) -> Disposable in
            let sharedRecord = RecentSearchRecordStore.shared
            let completedSection = SectionOfRecentSearchRecord(title: "Others", items: ["#Completed Classes"])
            guard sharedRecord.count > 0 else {

                observer.onNext([completedSection])
                return Disposables.create()
            }

            let recentSection = SectionOfRecentSearchRecord(title: "Recent", items: sharedRecord.recentRecord)

            observer.onNext([recentSection, completedSection])

            return Disposables.create()
        }
    }
    func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RecordCell")
        let datasource = RxTableViewSectionedAnimatedDataSource<SectionOfRecentSearchRecord>(configureCell: { (_, tv: UITableView, _, item) -> UITableViewCell in
            let cell = tv.dequeueReusableCell(withIdentifier: "RecordCell")
            cell?.textLabel?.text = item
            return cell!
        })
        datasource.titleForHeaderInSection = { ds, index in
            ds.sectionModels[index].title
        }
        //let searchResultViewModel = EFPSearchRecordViewModel(session: viewModel.)

        sectionOfRecent
            .bind(to: (tableView.rx.items(dataSource: datasource)))
            .disposed(by: rx.disposeBag)
    }

    func modelSelected() {
        Observable.zip(tableView.rx.itemSelected, tableView.rx.modelSelected(String.self)) .bind { (indexPath, model) in
            self.tableView.deselectRow(at: indexPath, animated: true)
            // self.viewModel.onSelectCell(at: indexPath, model: model)
            self.modelSelected()

        }
            .disposed(by: rx.disposeBag)
    }
}
