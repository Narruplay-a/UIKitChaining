//
//  UIAlertView+Chaining.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 22/03/2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

extension UIAlertView: UIAlertViewChaining { }
public protocol UIAlertViewChaining { }
public extension UIAlertViewChaining {
    @discardableResult
    func title(_ title: String) -> Self {
        (self as! UIAlertView).title = title
        return self
    }
    @discardableResult
    func message(_ message: String?) -> Self {
        (self as! UIAlertView).message = message
        return self
    }
    @discardableResult
    func delegate(_ delegate: AnyObject?) -> Self {
        (self as! UIAlertView).delegate = delegate
        return self
    }
    @discardableResult
    func cancelButtonIndex(_ cancelButtonIndex: Int) -> Self {
        (self as! UIAlertView).cancelButtonIndex = cancelButtonIndex
        return self
    }
    @available(iOS 5.0, *)
    @discardableResult
    func alertViewStyle(_ alertViewStyle: UIAlertViewStyle) -> Self {
        (self as! UIAlertView).alertViewStyle = alertViewStyle
        return self
    }
}
