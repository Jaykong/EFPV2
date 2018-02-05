//
//  RecentSessionCellViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/2.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
struct RecentSessionCellViewModel: RecentSessionRepresentable {

    let dateFromatter: DateFormatter = {
        let dateFromatter = DateFormatter()
        dateFromatter.timeStyle = .long
        dateFromatter.dateStyle = .long
        return dateFromatter
    }()

    let recentSession: RecentSession

    var date: String {
        return dateFromatter.string(from: recentSession.date)
    }

    var unreadMessage: Int {
        return recentSession.unreadMessage
    }

    var courseName: String {
        return recentSession.courseName
    }

    var paName: String {
        return recentSession.paName
    }
}
