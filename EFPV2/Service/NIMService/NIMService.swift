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
        let user = NIMSDK.shared().userManager.userInfo(NIMConstant.userName)

        let json = JSON(parseJSON: user!.userInfo!.ext!)

        return json["isPa"].intValue
    }
}
