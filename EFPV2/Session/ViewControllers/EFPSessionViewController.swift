//
//  MessageViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/4.
//  Copyright © 2018 JayKong. All rights reserved.
//

import RxSwift
import UIKit
class EFPSessionViewController: NIMSessionViewController {
    var sessionViewModel: EFPSessionViewModel!

    @objc func search() {
        sessionViewModel.onSearchBtnClicked()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.arrowBackBarBtn(target: self, action: #selector(dismissViewController))

        let searchBarBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "navi_search").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(EFPSessionViewController.search))
        searchBarBtn.tintColor = UIColor.gray

        let imageView = UIImageView(image: #imageLiteral(resourceName: "icon_session_info_normal"))
        imageView.isUserInteractionEnabled = true
        let groupBarBtn = UIBarButtonItem(customView: imageView)

        navigationItem.rightBarButtonItems = [groupBarBtn, searchBarBtn]

        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(groupInfoClicked))
        imageView.addGestureRecognizer(tapgesture)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func groupInfoClicked() {
        sessionViewModel.onGroupInfoClicked()
    }
    override func onTapCell(_ event: NIMKitEvent!) -> Bool {
        var handle = super.onTapCell(event)

        handle = sessionViewModel.onTapCell(event)

        return handle
    }

    @objc func dismissViewController() {

        sessionViewModel.onDismissViewController()
    }

}

