//
//  UIBarButtonItem.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 25/12/2018.
//  Copyright © 2018 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

extension UIBarButtonItem: UIBarButtonItemChaining {}
protocol UIBarButtonItemChaining {}
extension UIBarButtonItemChaining {
    @discardableResult
    func title(_ title: String) -> Self {
        (self as! UIBarButtonItem).title = title
        return self
    }
    @discardableResult
    func style(_ style: UIBarButtonItem.Style) -> Self {
        (self as! UIBarButtonItem).style = style
        return self
    }
    @discardableResult
    func customView(_ customView: UIView) -> Self {
        (self as! UIBarButtonItem).customView = customView
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func isSpringLoaded(_ isSpringLoaded: Bool) -> Self {
        (self as! UIBarButtonItem).isSpringLoaded = isSpringLoaded
        return self
    }
}
