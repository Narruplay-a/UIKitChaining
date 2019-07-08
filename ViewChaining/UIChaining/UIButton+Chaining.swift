//
//  UIAlertView+Chaining.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 22/03/2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

extension UIButton: UIButtonChaining { }
public protocol UIButtonChaining { }
public extension UIButtonChaining {
    @discardableResult
    func setTitle(_ title: String, _ state: UIControl.State) -> Self {
        (self as! UIButton).setTitle(title, for: state)
        return self
    }
    @discardableResult
    func setAttributedTitle(_ title: NSAttributedString, _ state: UIControl.State) -> Self {
        (self as! UIButton).setAttributedTitle(title, for: state)
        return self
    }
    @discardableResult
    func setImage(_ image: UIImage?, _ state: UIControl.State) -> Self {
        (self as! UIButton).setImage(image, for: state)
        return self
    }
    @discardableResult
    func setTitleColor(_ color: UIColor?, _ state: UIControl.State) -> Self {
        (self as! UIButton).setTitleColor(color, for: state)
        return self
    }
    @discardableResult
    func setBackgroundImage(_ image: UIImage?, _ state: UIControl.State) -> Self {
        (self as! UIButton).setBackgroundImage(image, for: state)
        return self
    }
    @discardableResult
    func setTitleShadowColor(_ color: UIColor?, _ state: UIControl.State) -> Self {
        (self as! UIButton).setTitleShadowColor(color, for: state)
        return self
    }
    @discardableResult
    func showsTouchWhenHighlighted(_ showsTouchWhenHighlighted: Bool) -> Self {
        (self as! UIButton).showsTouchWhenHighlighted = showsTouchWhenHighlighted
        return self
    }
    @discardableResult
    func titleEdgeInsets(_ titleEdgeInsets: UIEdgeInsets) -> Self {
        (self as! UIButton).titleEdgeInsets = titleEdgeInsets
        return self
    }
    @discardableResult
    func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> Self {
        (self as! UIButton).contentEdgeInsets = contentEdgeInsets
        return self
    }
    @discardableResult
    func imageEdgeInsets(_ imageEdgeInsets: UIEdgeInsets) -> Self {
        (self as! UIButton).imageEdgeInsets = imageEdgeInsets
        return self
    }
}
