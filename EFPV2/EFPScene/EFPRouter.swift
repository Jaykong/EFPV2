//
//  EFPRouter.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/9.
//  Copyright © 2018 JayKong. All rights reserved.
//

import RxSwift
import UIKit
import AVKit
protocol EFPSceneRouterProtocol {

    @discardableResult
    func transit(to scene: EFPSceneType, transitionType: EFPTransitionType) -> Observable<Void>
    @discardableResult
    func pop() -> Observable<Void>
    @discardableResult
    func removeChild() -> Observable<Void>

}

enum EFPTransitionType {
    case root
    case push
    case modal
    case video
    case addChild
}

class EFPSceneRouter: EFPSceneRouterProtocol {
    func removeChild() -> Observable<Void> {
        let subject = PublishSubject<Void>()
        currentViewController.willMove(toParentViewController: nil)
        currentViewController.view.removeFromSuperview()
        currentViewController.removeFromParentViewController()
        
        currentViewController = EFPSceneRouter.actionalViewController(for: currentViewController.parent!)
        subject.onCompleted()
        return subject.asObservable()

    }

    let disposeBag = DisposeBag()
    var currentViewController: UIViewController!
    @discardableResult
    func pop() -> Observable<Void> {
        let publishedObject = PublishSubject<Void>()
        if let presentingViewController = currentViewController.presentingViewController {
            presentingViewController.dismiss(animated: true, completion: {
                self.currentViewController = EFPSceneRouter.actionalViewController(for: presentingViewController)
                publishedObject.onCompleted()
            })

        } else
        if let navigationController = currentViewController.navigationController {
            navigationController.rx.delegate.sentMessage(#selector(UINavigationControllerDelegate.navigationController(_: didShow: animated:)))
                .map({ _ in })
                .bind(to: publishedObject)
                .disposed(by: disposeBag)
            navigationController.popViewController(animated: true)
            self.currentViewController = EFPSceneRouter.actionalViewController(for: navigationController.topViewController!)
            publishedObject.onCompleted()


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
    fileprivate func addChildViewController(_ parent: UIViewController, _ viewController: UIViewController) {
        parent.addChildViewController(viewController)
        parent.view.addSubview(viewController.view)
        viewController.didMove(toParentViewController:parent )
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
            print(#function)
            
        case .video:

            currentViewController.present(viewController, animated: true, completion: {
                if let playerViewController = viewController as? AVPlayerViewController {
                    playerViewController.player?.play()
                }
            })
        case .addChild:
            addChildViewController(currentViewController, viewController)
//            if let parent = currentViewController.parent {
//                addChildViewController(parent, viewController)
//            } else {
//
//            }
//            self.currentViewController = EFPSceneRouter.actionalViewController(for: viewController)

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

