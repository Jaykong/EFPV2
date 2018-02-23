//
//  File.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/11.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import SnapKit
protocol EFPTableViewProtocol {
    var tableView:UITableView {get set}
    
}

extension EFPTableViewProtocol where Self:UIViewController {
   
   
    func addTableViewConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

}

