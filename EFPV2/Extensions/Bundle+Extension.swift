//
//  Bundle+Extension.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/8.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation

// MARK: -

extension Bundle {

    /// 获取命名空间
    var nameSpaceStirng: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
