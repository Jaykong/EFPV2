//
//  GroupSearchResult.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/24.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxDataSources
struct GroupLocalMessageSearchResultItem {
//    let userId:String
    let messageId: String
    let senderName: String
    let content: NSAttributedString
    let timeStamp: String
    let avtarImage:UIImage
}
extension GroupLocalMessageSearchResultItem: IdentifiableType, Equatable {
    static func == (lhs: GroupLocalMessageSearchResultItem, rhs: GroupLocalMessageSearchResultItem) -> Bool {
        return lhs.messageId == rhs.messageId
    }

    typealias Identity = String

    var identity: Identity {
        return messageId
    }

}

extension NIMMessage :IdentifiableType {
    public var identity: String {
        return messageId
    }
    
    public typealias Identity = String
    
    
    
}
