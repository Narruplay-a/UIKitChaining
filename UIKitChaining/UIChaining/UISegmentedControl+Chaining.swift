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
}
