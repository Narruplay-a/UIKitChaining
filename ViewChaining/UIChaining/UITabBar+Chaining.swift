//
//  UIAlertView+Chaining.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 22/03/2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

extension UITabBar: UIAlertViewChaining { }
public protocol UITabBarChaining { }
public extension UITabBarChaining {
    @discardableResult
    func backgroundImage(_ backgroundImage: UIImage?) -> Self {
        (self as! UITabBar).backgroundImage = backgroundImage
        return self
    }
    @discardableResult
    func barStyle(_ barStyle: UIBarStyle) -> Self {
        (self as! UITabBar).barStyle = barStyle
        return self
    }
    @discardableResult
    func tintColor(_ tintColor: UIColor) -> Self {
        (self as! UITabBar).tintColor = tintColor
        return self
    }
    @discardableResult
    func barTintColor(_ barTintColor: UIColor) -> Self {
        (self as! UITabBar).barTintColor = barTintColor
        return self
    }
    @discardableResult
    func delegate(_ delegate: UITabBarDelegate?) -> Self {
        (self as! UITabBar).delegate = delegate
        return self
    }
    @discardableResult
    func shadowImage(_ shadowImage: UIImage?) -> Self {
        (self as! UITabBar).shadowImage = shadowImage
        return self
    }
    @discardableResult
    func items(_ items: [UITabBarItem]?) -> Self {
        (self as! UITabBar).items = items
        return self
    }
    @discardableResult
    func selectionIndicatorImage(_ selectionIndicatorImage: UIImage?) -> Self {
        (self as! UITabBar).selectionIndicatorImage = selectionIndicatorImage
        return self
    }
}



