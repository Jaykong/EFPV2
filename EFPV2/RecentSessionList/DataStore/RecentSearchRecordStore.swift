//
//  RecentSearchRecordStore.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/2.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation

class RecentSearchRecordStore {
    static let shared = RecentSearchRecordStore()
    private(set) var recentRecord: [String]
    private init() {
        if let record = NSArray(contentsOfFile: recentSearchRecordPath) as? [String] {
            recentRecord = record
        } else {
            #if DEBUG
                let filePath = Bundle.main.path(forResource: "recentSearchRecords", ofType: "plist")
                recentRecord = NSArray(contentsOfFile: filePath!) as! [String]
            #else
                recentRecord = [String]()
            #endif
        }
    }

    subscript(index: Int) -> String {
        return recentRecord[index]
    }

    func insert(atFirst newElement: String) {
        if count == 3 {
            recentRecord.removeLast()
        }
        recentRecord.insert(newElement, at: 0)
    }

    var count: Int {
        return recentRecord.count
    }

    private let recentSearchRecordPath: String = {
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString
        let recordPath = docPath.appendingPathComponent("recentSearchRecords.plist")
        return recordPath
    }()

    func save() {

        let dic = recentRecord as NSArray

        dic.write(toFile: recentSearchRecordPath, atomically: true)
    }
}
