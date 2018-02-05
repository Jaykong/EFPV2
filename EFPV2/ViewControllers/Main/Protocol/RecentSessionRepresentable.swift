//
//  RecentSessionRepresentable.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/2.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
protocol RecentSessionRepresentable {
    var date: String { get }
    var unreadMessage: Int { get }
    var courseName: String { get }
    var paName: String { get }
}
