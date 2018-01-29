//
//  LoginViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/29.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import AppAuth
import RxSwift
class LoginViewModel {
    

   private var authorizationFlowSession:OIDAuthorizationFlowSession!
    let sceneCoordinate:SceneCoordinator
    // MARK: - Init
    init(sceneCoordinate:SceneCoordinator) {
        self.sceneCoordinate = sceneCoordinate
    }
    // MARK: - Input
    
    // MARK: - Output
    var isLogin = Variable<Bool>(false)
    
    func accessTokenSucess(handler: @escaping (String) -> ()) {
        OAuthService.authorizationRequestCompletionHandler { (request) in
            let viewController = Scene.login(self).viewController()
            
            self.authorizationFlowSession = OIDAuthState.authState(byPresenting: request, presenting:viewController , callback: { (state, error) in
                //TODO: - save
                handler(state?.lastTokenResponse?.accessToken ?? "")
                
            })
        }
    }
    
    func onPresentMain() {
        accessTokenSucess {[weak self] (str) in
            let mainModel = MainViewModel()
            let scene = Scene.main(mainModel)
            
            self?.sceneCoordinate.transitionTo(scene: scene, type: .root)
            
        }
    }
}

