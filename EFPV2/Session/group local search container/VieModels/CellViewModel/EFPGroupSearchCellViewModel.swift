//
//  EFPGroupSearchCellViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/24.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
class EFPGroupSearchCellViewModel {
    let message: NIMMessage
    let searchText:String

    init(message: NIMMessage, searchText: String) {
        self.message = message
        self.searchText = searchText
    }

    

    enum GroupSearchError {
        case invalid
    }
    lazy var item: EFPGroupLocalMessageSearchResultItem = {
        let option = NIMKitInfoFetchOption()
        option.message = message

        let info = NIMKit.shared().info(byUser: message.from, option: option)
        let date = Date(timeIntervalSince1970:message.timestamp)
        
        guard let senderName = message.from,let text = message.text,let avatarImage = info?.avatarImage else {
            return EFPGroupLocalMessageSearchResultItem(messageId: "", senderName: "", content:NSAttributedString(),  timeStamp: "", avtarImage: UIImage(),searchText: "", message: NIMMessage())
            
//
        }

        let attri:NSAttributedString = NSAttributedString(string: text)
        
        let newAttri = attri.applying(attributes: [NSAttributedStringKey.foregroundColor:UIColor.green], toOccurrencesOf: searchText)
        

        var localItem = EFPGroupLocalMessageSearchResultItem(messageId: message.messageId, senderName: senderName, content:newAttri, timeStamp: date.string(), avtarImage: avatarImage, searchText: searchText, message: message)
        return localItem

    }()
}

