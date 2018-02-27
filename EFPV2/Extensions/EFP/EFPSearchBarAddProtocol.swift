//
//  EFPSearchBarAddProtocol.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/26.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
protocol EFPSearchBarAddProtocol {
    var searchBar:UISearchBar {get set}
}
extension EFPSearchBarAddProtocol where Self:UIViewController {
    func addSearchBar() {
        searchBar.showsCancelButton = true
        searchBar.becomeFirstResponder()
        navigationItem.titleView = searchBar
    }
    
    
}
