//
//  RecentSessionListCellViewModel2.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/6.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxSwift
class RecentSessionListCellViewModel {
    let recentSession: NIMRecentSession

    init(recentSession: NIMRecentSession) {
        self.recentSession = recentSession
    }

    lazy var session = Observable<NIMSession>.create { (observer) -> Disposable in
        observer.onNext(self.recentSession.session!)

        return Disposables.create()
    }
}
