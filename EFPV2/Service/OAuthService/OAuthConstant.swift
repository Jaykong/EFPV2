//
//  OAuthConstant.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/29.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation

enum OAuthConstant {
    static let client_id = "efpv2.mobile.client"
    static let kIssuer = "https://passport-qa.ef.com"
    static let scope = ["efpv2", "openid"]
    static let redirect_uris = "com.ef.appauthexample:/oauth2callback"
}
