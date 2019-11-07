//
//  UIControl+Chaining.swift
//  UIKitChaining
//
//  Created by Adel Khaziakhmetov on 01.08.2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

extension UIControl: UIControlChainingProtocol { }
public protocol UIControlChainingProtocol { }
public extension UIControlChainingProtocol {
    @discardableResult
    func addTarget(_ target: Any?, action: Selector, event: UIControl.Event) -> Self {
        (self as! UIControl).addTarget(target, action: action, for: event)
        return self
    }
    @discardableResult
    func removeTarget(_ target: Any?, action: Selector, event: UIControl.Event) -> Self {
        (self as! UIControl).removeTarget(target, action: action, for: event)
        return self
    }
}
