//
//  UISegmentedControl+Chaining.swift
//  UIKitChaining
//
//  Created by Adel Khaziakhmetov on 30.07.2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

extension UISegmentedControl: UISegmentedControlChaining { }
public protocol UISegmentedControlChaining { }
public extension UISegmentedControlChaining {
    @discardableResult
    func insertSegment(_ title: String?, at: Int, animated: Bool) -> Self {
        (self as! UISegmentedControl).insertSegment(withTitle: title, at: at, animated: animated)
        return self
    }
    @discardableResult
    func insertSegment(_ image: UIImage?, at: Int, animated: Bool) -> Self {
        (self as! UISegmentedControl).insertSegment(with: image, at: at, animated: animated)
        return self
    }
    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor) -> Self {
        (self as! UISegmentedControl).backgroundColor = backgroundColor
        return self
    }
    @discardableResult
    func titleTextAttributes(_ titleTextAttributes: [NSAttributedString.Key: Any]?, state: UIControl.State) -> Self {
        (self as! UISegmentedControl).setTitleTextAttributes(titleTextAttributes, for: state)
        return self
    }
    @discardableResult
    func enabled(_ enabled: Bool, segment: Int) -> Self {
        (self as! UISegmentedControl).setEnabled(enabled, forSegmentAt: segment)
        return self
    }
    @discardableResult
    func title(_ title: String?, segment: Int) -> Self {
        (self as! UISegmentedControl).setTitle(title, forSegmentAt: segment)
        return self
    }
    @discardableResult
    func backgroundImage(_ backgroundImage: UIImage?, state: UIControl.State, barMetrics: UIBarMetrics) -> Self {
        (self as! UISegmentedControl).setBackgroundImage(backgroundImage, for: state, barMetrics: barMetrics)
        return self
    }
    @discardableResult
    func image(_ image: UIImage?, segment: Int) -> Self {
        (self as! UISegmentedControl).setImage(image, forSegmentAt: segment)
        return self
    }
}
