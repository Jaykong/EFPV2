//
//  Scene.swift
//  JKSFViewController
//
//  Created by JayKong on 2018/1/28.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation

enum Scene {

    case login(LoginViewModel)
    // case sessionList(RecentSessionListViewModel)
    case session(SessionViewModel)
    case sessionImageView(SessionImageViewModel)
    // case study(StudyViewModel)
    // case home(HomeViewModel)
    // case schedule(ScheduleViewModel)
    case videoPlay(FullVideoPlayerViewModel)
    case tabBar
}
