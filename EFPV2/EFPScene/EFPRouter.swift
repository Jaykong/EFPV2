//
//  EFPRouter.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/9.
//  Copyright © 2018 JayKong. All rights reserved.
//

import RxSwift
import UIKit
protocol EFPSceneRouterProtocol {

    @discardableResult
    func transit(to scene: EFPSceneType, transitionType: EFPTransitionType) -> Observable<Void>
    @discardableResult
    func pop() -> Observable<Void>

}

enum EFPTransitionType {
    case root
    case push
    case modal
}

class EFPSceneRouter: EFPSceneRouterProtocol {
    let disposeBag = DisposeBag()
    var currentViewController: UIViewController!
    @discardableResult
    func pop() -> Observable<Void> {
        let publishedObject = PublishSubject<Void>()

        if let navigationController = currentViewController.navigationController {
            navigationController.rx.delegate.sentMessage(#selector(UINavigationControllerDelegate.navigationController(_: didShow: animated:)))
                .map({ _ in })
                .bind(to: publishedObject)
                .disposed(by: disposeBag)
            navigationController.popViewController(animated: true)
            self.currentViewController = EFPSceneRouter.actionalViewController(for: navigationController.topViewController!)

        } else if let presentingViewController = currentViewController.presentingViewController{
            presentingViewController.dismiss(animated: true, completion: {
                self.currentViewController = EFPSceneRouter.actionalViewController(for: presentingViewController)
                publishedObject.onCompleted()
            })
            
        }
        return publishedObject.asObservable()
    }

    static func actionalViewController(for controller: UIViewController) -> UIViewController {
        if let tabController = controller as? UITabBarController {
            if let navigationController = tabController.selectedViewController as? UINavigationController {
                return navigationController.topViewController!
            }
            return tabController.selectedViewController!
        }

        if let navigationController = controller as? UINavigationController {
            return navigationController.topViewController!
        }

        return controller

    }
    @discardableResult
    func transit(to scene: EFPSceneType, transitionType: EFPTransitionType) -> Observable<Void> {
        let publishedObject = PublishSubject<Void>()
        let viewController = scene.viewController()

        switch transitionType {
        case .root:
            window?.rootViewController = viewController
            publishedObject.onCompleted()
            currentViewController = EFPSceneRouter.actionalViewController(for: viewController)
        case .push:
            guard let navigationController = currentViewController.navigationController else {
                fatalError("not a navigation controler, can not push")
            }
            navigationController.rx.delegate.sentMessage(#selector(UINavigationControllerDelegate.navigationController(_: didShow: animated:)))
                .map({ _ in })
                .bind(to: publishedObject)
                .disposed(by: disposeBag)
            navigationController.pushViewController(viewController, animated: true)
            currentViewController = EFPSceneRouter.actionalViewController(for: viewController)
        case .modal:
            currentViewController.present(viewController, animated: true, completion: {
                self.currentViewController = EFPSceneRouter.actionalViewController(for: viewController)
                publishedObject.onCompleted()
            })
        }

        return publishedObject.asObservable().take(1)
    }

    static let shared = EFPSceneRouter()

    var window: UIWindow?
    private init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
    }
}
