//
//  BindableViewType.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/11.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation

protocol BindableViewType {
    associatedtype ViewModelType
    var viewModel:ViewModelType! {get set}
    func bindViewModel()
    
}
extension BindableViewType where Self:UIViewController {
    mutating func bindViewModel(to model:Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }

}

