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
    var sessionViewModel: SessionViewModel!

    @objc func search() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftItemsSupplementBackButton = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Asset.NavigationBar.naviBack.image, style: .plain, target: self, action: #selector(dismissViewController))
       
//        let searchBtn = UIButton(type: .custom)
//        let searchImage = #imageLiteral(resourceName: "navi_search").withRenderingMode(.alwaysTemplate)
//
//        searchBtn.imageView?.tintColor = UIColor.black
//
//        searchBtn.setImage(#imageLiteral(resourceName: "navi_search"), for: .normal)
        
        
        let searchBarBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "navi_search").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(EFPSessionViewController.search))
        searchBarBtn.tintColor = UIColor.black


       
        let imageView = UIImageView(image: #imageLiteral(resourceName: "icon_session_info_normal"))
        let groupBarBtn = UIBarButtonItem(customView: imageView)

        navigationItem.rightBarButtonItems = [groupBarBtn, searchBarBtn]

//        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
//        view.addGestureRecognizer(tapgesture)

//        sessionViewModel.session.subscribe(onNext: { (session) in
        //
//            self.session = session
//        })

        // self.session = sessionViewModel.session!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
