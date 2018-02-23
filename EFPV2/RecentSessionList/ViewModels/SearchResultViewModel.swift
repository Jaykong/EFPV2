//
//  SearchResultViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/11.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxSwift
struct SearchResultViewModel {
    //var searchedText:Observable<String>!
    var selectedModel:Variable<String>!
    func pop() {
        EFPSceneRouter.shared.pop()
    }
}
