//
//  LoginViewModel.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/29.
//  Copyright © 2018 JayKong. All rights reserved.
//

import AppAuth
import Foundation
import RxSwift
class LoginViewModel {
    let disposeBag = DisposeBag()
    private var authorizationFlowSession: OIDAuthorizationFlowSession!
    // let sceneCoordinator = SceneCoordinator

    // MARK: - Init

    // MARK: - Input

    // MARK: - Output

    func onSucessReturnToken() {
        requestAuthState().subscribe(onNext: { state in

            print((state.lastTokenResponse?.accessToken ?? ""))

            let scene = EFPRootScene.tabBar

            EFPSceneRouter.shared.transit(to: scene, transitionType: .root)
        })
            .disposed(by: disposeBag)
    }

    private func requestAuthState() -> Observable<OIDAuthState> {

        return Observable<OIDAuthState>.create({ (observer) -> Disposable in

            OAuthService.authorizationRequestCompletionHandler { request in

                let viewController = EFPRootScene.login(self).viewController()

                self.authorizationFlowSession = OIDAuthState.authState(byPresenting: request, presenting: viewController, callback: { state, _ in
                    // TODO: - save
                    // TODO: - error will emit here, you shall comment this error handler here
                    /*
                     print(error?.localizedDescription)
                     guard let error = error  else {
                     print("error")
                     return
                     }
                     */
                    guard let state = state else {
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
