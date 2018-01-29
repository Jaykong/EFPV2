//
//  SceneCoordinatorType.swift
//  JKSFViewController
//
//  Created by JayKong on 2018/1/28.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
protocol SceneCoordinatorType {
    func transitionTo(scene:Scene,type:TransitionType)
    func pop(scene:Scene)
}
