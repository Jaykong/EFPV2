//
//  RecentSession.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/31.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxDataSources

struct SessionSearchResult {
    let timeStamp: Date
    let message: String
    let customTeamName: String
    let paName: String
    let avatar:String
}

struct SectionOfSearchResult {
    let header: String
    var items: [SessionSearchResult]
}

extension SectionOfSearchResult: SectionModelType {
    init(original: SectionOfSearchResult, items: [SessionSearchResult]) {
        self = original
        self.items = items
    }
}
