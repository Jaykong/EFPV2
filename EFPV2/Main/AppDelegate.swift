//
//  AppDelegate.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/29.
//  Copyright © 2018 JayKong. All rights reserved.
//

import RxSwift
import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    fileprivate func transitToMain() {
        let router = EFPSceneRouter.shared
        window = router.window
        let scene = EFPRootScene.tabBar
        router.transit(to: scene, transitionType: .root)
    }

    fileprivate func transitToLogin() {

        let loginViewModel = LoginViewModel()
        let loginScene = EFPRootScene.login(loginViewModel)
        EFPSceneRouter.shared.transit(to: loginScene, transitionType: .root)
    }

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let option = NIMSDKOption()
        option.appKey = NIMConstant.appKey

        NIMSDK.shared().register(with: option)
        //test111
        // pa-zoey
        NIMSDK.shared().loginManager.autoLogin(NIMConstant.userName, token: NIMConstant.token)

        transitToMain()

        //transitToLogin()
        UITabBarItem.setupTabBarItemAttributes2()
        return true
    }

    func applicationWillResignActive(_: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
