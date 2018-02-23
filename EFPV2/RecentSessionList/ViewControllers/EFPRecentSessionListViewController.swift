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
/*
extension NIMSessionListCell {
    open override func layoutSubviews() {

        super.layoutSubviews()
        let offset = 15


        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        badgeView.translatesAutoresizingMaskIntoConstraints = false

        avatarImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leadingMargin.equalToSuperview().offset(offset)
            make.width.height.equalTo(40)
        }

        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(offset)
            make.bottom.equalTo(messageLabel.snp.top).offset(offset)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(offset)
            make.trailing.equalTo(timeLabel.snp.leading).priority(.low)
        }
        messageLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(nameLabel.snp.leading)
            make.bottom.equalToSuperview().offset(offset)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.top)
            make.trailing.equalToSuperview().offset(offset).priority(.high)
        }
        badgeView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.width.height.equalTo(8)
        }

    }



}
*/
class EFPRecentSessionListViewController: NIMSessionListViewController {
    // var tableView:UITableView!
    var sectionedReloadDataSource: RxTableViewSectionedReloadDataSource<SectionOfSearchResult>!

    var viewModel: RecentSessionListViewModel!
    let disposeBag = DisposeBag()



    func createTitleView() -> UIView {
        let titleView = UIView()
        titleView.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 66)
        let searchBar = UISearchBar()
        let titleLbl = UILabel()
        titleLbl.text = "messages"
        titleView.addSubview(titleLbl)
        titleView.addSubview(searchBar)

        titleLbl.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(searchBar.snp.top)

        }
        searchBar.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()

        }

        return titleView
    }

    func createCustomView() -> UIView {

        let customView = UIView()

        let btn = UIButton(type: .custom)
        customView.addSubview(btn)
        let color = UIColor(red: 249 / 255.0, green: 249 / 255.0, blue: 249 / 255.0, alpha: 1)
        customView.backgroundColor = color

        btn.backgroundColor = UIColor.white
        btn.setImage(#imageLiteral(resourceName: "navi_search").withRenderingMode(.alwaysTemplate), for: .normal)

        btn.setTitle("Search", for: .normal)
        btn.setTitleColor(UIColor.lightGray, for: .normal)
        btn.tintColor = UIColor.lightGray


        btn.addTarget(self, action: #selector(EFPRecentSessionListViewController.onSearchBtnClicked), for: .touchUpInside)
        btn.layer.cornerRadius = 10


        btn.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(8)
        }


        return customView
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.navigationTitle.subscribe(onNext: {
            self.title = $0
        }).disposed(by: disposeBag)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RecentSessionListViewModel()





        let customView = createCustomView()
        view.addSubview(customView)

        customView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.height.equalTo(48)

        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(customView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }



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
        /*
        searchBar.rx.textDidBeginEditing.bind { [weak self] in
            self?.viewModel.onSearchDidBegin()
            
        }.disposed(by: rx.disposeBag) */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension EFPRecentSessionListViewController {
    @objc func onSearchBtnClicked() {
        self.viewModel.onSearchBtnClicked()
//        let parentViewController = EFPSearchParentViewController()
//        let navigation = UINavigationController(rootViewController: parentViewController)
//
//        self.present(navigation, animated: true, completion: nil)

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
