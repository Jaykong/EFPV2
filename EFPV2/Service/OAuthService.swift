//
//  OAuthService.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/29.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import AppAuth
enum OAuthService {
    static func authorizationRequestCompletionHandler(handler:@escaping (OIDAuthorizationRequest) -> ()) {
        let issuerURL = NSURL(string: OAuthConstant.kIssuer)
        OIDAuthorizationService.discoverConfiguration(forIssuer: issuerURL! as URL) { configuration, error in            
            guard let configuration = configuration else {
                return
            }
            let redirectURL = URL(string: OAuthConstant.redirect_uris)
            let request = OIDAuthorizationRequest(configuration: configuration, clientId:OAuthConstant.client_id, scopes:OAuthConstant.scope , redirectURL:redirectURL! , responseType: OIDResponseTypeCode, additionalParameters: nil)
            handler(request)
        }
    }
    
}
