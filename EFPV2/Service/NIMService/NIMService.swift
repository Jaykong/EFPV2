//
//  NIMService.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/30.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import SwiftyJSON
struct NIMService {

    static func userExt() -> Int {
        let tempUser = NIMSDK.shared().userManager.userInfo(NIMConstant.userName)
        
        guard let user = tempUser,let userInfo = user.userInfo,let ext = userInfo.ext else {
            return 0
        }

        let json = JSON(parseJSON: ext)

        return json["isPa"].intValue
    }
}
