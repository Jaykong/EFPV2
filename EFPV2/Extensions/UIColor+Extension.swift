//
//  UIColor+Extension.swift
//  EFParents
//
//  Created by yuency on 11/08/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    convenience init(hex: UInt32) {
        let r = (hex & 0xFF0000) >> 16
        let g = (hex & 0x00FF00) >> 8
        let b = hex & 0x0000FF
        self.init(red: r, green: g, blue: b)
    }

    convenience init(red: UInt32, green: UInt32, blue: UInt32) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1)
    }

    static var randomColor: UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256)) / 255.0, green: CGFloat(arc4random_uniform(256)) / 255.0, blue: CGFloat(arc4random_uniform(256)) / 255.0, alpha: 1)
    }
}
