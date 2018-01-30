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
    
let disposeBag = DisposeBag()
   private var authorizationFlowSession:OIDAuthorizationFlowSession!
    let sceneCoordinate:SceneCoordinator
    // MARK: - Init
    init(sceneCoordinate:SceneCoordinator) {
        self.sceneCoordinate = sceneCoordinate
    }
    // MARK: - Input
    
    // MARK: - Output
    
    func onSucessReturnToken() {
        requestAuthState().subscribe(onNext: { (state) in
            
            print((state.lastTokenResponse?.accessToken ?? ""))
            let mainModel = MainViewModel()
            let scene = Scene.main(mainModel)
            
            self.sceneCoordinate.transitionTo(scene: scene, type: .root)
        })
            .disposed(by: disposeBag)
    }
  
    private func requestAuthState() -> Observable<OIDAuthState> {
        
      return  Observable<OIDAuthState>.create({ (observer) -> Disposable in
            
            OAuthService.authorizationRequestCompletionHandler { (request) in
                let viewController = Scene.login(self).viewController()
                
                self.authorizationFlowSession = OIDAuthState.authState(byPresenting: request, presenting:viewController , callback: { (state, error) in
                    //TODO: - save
                    //TODO: - error will emit here, you shall comment this error handler here
                    /*
                    print(error?.localizedDescription)
                    guard let error = error  else {
                        print("error")
                        return
                    }
 */
                    guard let  state = state else {
                        print("state is empty")
                        return
                        
                    }
                    observer.onNext(state)
                    observer.onCompleted()
                    
                    return
                })
            }
            
            return Disposables.create()
        })
        
        
        
        
    }
    
  
  
}

