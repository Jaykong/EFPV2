//
//  EFPSearchParentViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/17.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit



class EFPSearchParentViewController: UIViewController, BindableViewType {
    var viewModel: SearchParentViewModel!

    func bindViewModel() {

    }

    typealias ViewModelType = SearchParentViewModel

// MARK: - Properties
    fileprivate var recordViewController: EFPSessionSearchRecordViewController!
    var searchBar: UISearchBar = UISearchBar()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchBar.becomeFirstResponder()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        recordViewController = EFPSessionSearchRecordViewController()
        addChildViewController(recordViewController)
        view.addSubview(recordViewController.view)
        
        recordViewController.bindViewModel(to: EFPSearchRecordViewModel())
        recordViewController.didMove(toParentViewController: self)

        navigationItem.titleView = searchBar
        searchBar.becomeFirstResponder()
        searchBar.showsCancelButton = true
        searchBar.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
// MARK: - Search Bar Delegate
extension EFPSearchParentViewController: UISearchBarDelegate {

    func searchBarCancelButtonClicked(_: UISearchBar) {
        viewModel.pop()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {

        // viewModel.onTextDidBeginEditing(searchBar)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if recordViewController != nil {
            recordViewController.willMove(toParentViewController: self)
            recordViewController.view.removeFromSuperview()
            recordViewController.removeFromParentViewController()
        }

        let searchResultViewController = EFPSearchResultViewController()
        addChildViewController(searchResultViewController)
        view.addSubview(searchResultViewController.view)
        searchResultViewController.didMove(toParentViewController: self)

    }

}

