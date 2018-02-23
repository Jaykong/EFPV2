//
//  EFPGroupInfoTableViewData.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/22.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import RxDataSources
enum MultipleGroupSectionModel {

    case groupMemberSection(title: String, items: [GroupSectionItem])
    case toggleableSection(title: String, items: [GroupSectionItem])
    case photoNumberSection(title: String, items: [GroupSectionItem])
    case groupNameSection(title: String, items: [GroupSectionItem])
    case chatHistorySection(title: String, items: [GroupSectionItem])
}

enum GroupSectionItem {
    case groupMemberSectionItem(image: UIImage, title: String)
    case toggleableSectionItem(title: String, enabled: Bool)
    case photoNumberSectionItem(title: String, number: String)
    case groupNameSectionItem(title: String, name: String)
    case chatHistorySectionItem(title: String)

}
extension MultipleGroupSectionModel:SectionModelType {
    var items: [GroupSectionItem] {
        switch self {
        case .groupMemberSection(let title, let items):
            return items

        case .toggleableSection(let title, let items):
            return items

        case .photoNumberSection(let title, let items):
            return items

        case .chatHistorySection(let title, let items):
            return items

        case .groupNameSection(let title, let items):
            return items

        }
        
    }
    
    init(original: MultipleGroupSectionModel, items: [GroupSectionItem]) {
//        switch original {
//
//        case .groupMemberSection(let title, let items):
//            self = .groupNameSection(title: title, items: items)
//        case .toggleableSection(let title, let items):
//            <#code#>
//        case .photoNumberSection(let title, let items):
//            <#code#>
//        case .groupNameSection(let title, let items):
//            <#code#>
//        case .chatHistorySection(let title, let items):
//            <#code#>
//        }
        self = original
    }
    
    typealias Item = GroupSectionItem
    
    
}

