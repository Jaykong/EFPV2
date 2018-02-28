//
//  EFPSearchRecordViewModelProtocol.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/28.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxSwift

protocol EFPSearchRecordViewModelProtocol {
    var sectionOfRecent: Observable<[SectionOfRecentSearchRecord]> { get set }
    
}
extension EFPSearchRecordViewModelProtocol{
    var sectionOfRecent: Observable<[SectionOfRecentSearchRecord]> {
        return Observable<[SectionOfRecentSearchRecord]>.create { (observer) -> Disposable in
            let sharedRecord = RecentSearchRecordStore.shared
            let completedSection = SectionOfRecentSearchRecord(title: "Others", items: ["#Completed Classes"])
            guard sharedRecord.count > 0 else {
                
                observer.onNext([completedSection])
                return Disposables.create()
            }
            
            let recentSection = SectionOfRecentSearchRecord(title: "Recent", items: sharedRecord.recentRecord)
            
            observer.onNext([recentSection, completedSection])
            
            return Disposables.create()
        }
    }
}
