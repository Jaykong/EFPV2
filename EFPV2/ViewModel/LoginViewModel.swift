//
//  LoginViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/29.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import AppAuth

protocol LoginViewModelDelegate {
    
}

class LoginViewModel {
 typealias  LogViewModelDelegate = () -> UIViewController

   private var authorizationFlowSession:OIDAuthorizationFlowSession!
    var logViewModelDelegate:LogViewModelDelegate!
    // MARK: - Init
    
    // MARK: - Input
    
    // MARK: - Output
    
    func accessTokenSucess(handler: @escaping (String) -> ()) {
        OAuthService.authorizationRequestCompletionHandler { (request) in
            let viewController = self.logViewModelDelegate()
            self.authorizationFlowSession = OIDAuthState.authState(byPresenting: request, presenting:viewController , callback: { (state, error) in
                //TODO: - save
                handler(state?.lastTokenResponse?.accessToken ?? "")
            })
        }
    }
}


