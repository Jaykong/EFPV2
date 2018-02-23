//
//  SectionOfRecentSearchRecord.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/2.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxDataSources
struct SectionOfRecentSearchRecord {
    let title: String
    var items: [String]
}

extension SectionOfRecentSearchRecord: AnimatableSectionModelType {
    var identity: String {
        return title
    }

    init(original: SectionOfRecentSearchRecord, items: [String]) {
        self = original
        self.items = items
    }

    typealias Identity = String
}
