//
//  EFPGroupInfoViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/21.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit
import RxDataSources
import NSObject_Rx
import RxSwift
import SnapKit
import RxCocoa
class EFPGroupInfoViewController: UIViewController, BindableViewType {
    var viewModel: EFPGroupInfoViewModel!
    var tableView: UITableView!

    func bindViewModel() {

    }

    typealias ViewModelType = EFPGroupInfoViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        navigationItem.arrowBackBarBtn(target: self, action: #selector(pop))

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)

        tableView.register(EFPGroupMemberIconTableViewCell.self, forCellReuseIdentifier: EFPGroupMemberIconTableViewCell.reuseIdentifier)
        tableView.register(EFPGroupNameTableViewCell.self, forCellReuseIdentifier: EFPGroupNameTableViewCell.reuseIdentifier)
        tableView.register(EFPGroupToggleTableViewCell.self, forCellReuseIdentifier: EFPGroupToggleTableViewCell.reuseIdentifier)
        tableView.register(EFPGroupPhoneNumberTableViewCell.self, forCellReuseIdentifier: EFPGroupPhoneNumberTableViewCell.reuseIdentifier)

        let dataSource: RxTableViewSectionedReloadDataSource<MultipleGroupSectionModel> = RxTableViewSectionedReloadDataSource<MultipleGroupSectionModel>(configureCell: { (ds, tb, indexPath, item) -> UITableViewCell in

            switch ds[indexPath] {

            case .groupMemberSectionItem(let image, let title):
                let cell: EFPGroupMemberIconTableViewCell = tb.dequeueReusableCell(forIndexPath: indexPath)
//                cell.dataSource = self
//                cell.delegate = self
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                return cell
            case .toggleableSectionItem(let title, let enabled):
                let cell: EFPGroupToggleTableViewCell = tb.dequeueReusableCell(forIndexPath: indexPath)
                cell.textLabel?.text = title
                return cell
            case .photoNumberSectionItem(let title, let number):
                let cell: EFPGroupPhoneNumberTableViewCell = tb.dequeueReusableCell(forIndexPath: indexPath)
                cell.textLabel?.text = title

                return cell
            case .groupNameSectionItem(let title, let name):
                let cell: EFPGroupNameTableViewCell = tb.dequeueReusableCell(forIndexPath: indexPath)
                cell.titleLbl.text = title
                cell.groupNameLbl.text = name

                return cell
            case .chatHistorySectionItem(let title):
                let cell: UITableViewCell = tb.dequeueReusableCell(forIndexPath: indexPath)
                cell.textLabel?.text = title
                return cell
            }
        })

        let sections = Observable<[MultipleGroupSectionModel]>.of([.groupMemberSection(title: "section0", items: [.groupMemberSectionItem(image: #imageLiteral(resourceName: "group_icon"), title: "jenny")]), .toggleableSection(title: "section1", items: [.toggleableSectionItem(title: "Mute Notifications", enabled: true), .toggleableSectionItem(title: "Sticky on Top", enabled: true)]), .photoNumberSection(title: "section2", items: [.photoNumberSectionItem(title: "School Phone Number", number: "500-500-600")]), .groupNameSection(title: "section3", items: [.groupNameSectionItem(title: "Group Name", name: "John's ummer course")]), .chatHistorySection(title: "section4", items: [.chatHistorySectionItem(title: "Search Chat History"), .chatHistorySectionItem(title: "Clear Chat History")])])

        sections.bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: rx.disposeBag)

        let controlEvent = tableView.rx.modelSelected(GroupSectionItem.self)
        controlEvent.filter { (item) -> Bool in
            switch item {
            case .groupNameSectionItem(title: "Group Name", name: "John's ummer course"):
                return true
            default:
                return false
            }
            }.subscribe(onNext: {
                print($0)
                self.viewModel.onSelectedGroupRenameSectionItem()
            })
        .disposed(by: rx.disposeBag)
        
        controlEvent.filter { (item) -> Bool in
            switch item {
            case .chatHistorySectionItem(title: "Search Chat History"):
                return true
            default:
                return false
            }
            }.subscribe(onNext: {
                print($0)
                self.viewModel.onSearchBtnClicked()
            })
            .disposed(by: rx.disposeBag)
        
        _ = tableView.rx.setDelegate(self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func pop() {

        viewModel.pop()
    }

}

extension EFPGroupInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80 * 3 + 15
        }
        return 44
    }
}
extension EFPGroupInfoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withClass: EFPGroupMemberIconCollectionViewCell.self, for: indexPath)
        collectionCell?.nameLbl.text = "Johnny"

        return collectionCell!
    }

}
extension EFPGroupInfoViewController: UICollectionViewDelegate {

}

