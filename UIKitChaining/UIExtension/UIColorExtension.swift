//
//  UIColorExtension.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 15/04/2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

public extension UIColor {
    static func colorFromHex(_ hex: UInt, alpha: Double = 1.0) -> UIColor {
        let alphaFromHex = Double((hex & 0xFF000000) >> 24) / 255.0
        let alphaFinal = alphaFromHex > 0 ? alphaFromHex : alpha
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0xFF00) >> 8) / 255.0
        let blue = Double((hex & 0xFF)) / 255.0
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alphaFinal))
    }
}
