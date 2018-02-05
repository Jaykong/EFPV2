//
//  RecentSession.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/31.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxDataSources

struct RecentSession {
    let date: Date
    let unreadMessage: Int
    let courseName: String
    let paName: String
}

struct SectionOfRecentSession {
    let header: String
    var items: [RecentSession]
}

extension SectionOfRecentSession: SectionModelType {
    init(original: SectionOfRecentSession, items: [RecentSession]) {
        self = original
        self.items = items
    }
}

