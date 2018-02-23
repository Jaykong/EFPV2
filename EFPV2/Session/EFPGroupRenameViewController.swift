//
//  EFPGroupRenameViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/22.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit
import SnapKit
class EFPGroupRenameViewController: UIViewController, BindableViewType {
    var viewModel: EFPGroupRenameViewModel!

    func bindViewModel() {

    }

    typealias ViewModelType = EFPGroupRenameViewModel

    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.lightGray
        textField.placeholder = "john's group name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.arrowBackBarBtn(target: self, action: #selector(pop))
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.leadingMargin.equalToSuperview()
            make.trailingMargin.equalToSuperview()
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(20)
            make.height.equalTo(44)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func pop() {
        viewModel.pop()
    }

}

