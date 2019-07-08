//
//  UITableViewCell+Chaining.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 22/03/2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

extension UITableViewCell: UITableViewCellChaining { }
public protocol UITableViewCellChaining { }
public extension UITableViewCellChaining {
    @discardableResult
    func isSelected(_ isSelected: Bool) -> Self {
        (self as! UITableViewCell).isSelected = isSelected
        return self
    }
    @discardableResult
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        (self as! UITableViewCell).isHighlighted = isHighlighted
        return self
    }
    @discardableResult
    func selectedBackgroundView(_ selectedBackgroundView: UIView?) -> Self {
        (self as! UITableViewCell).selectedBackgroundView = selectedBackgroundView
        return self
    }
    @available(iOS 5.0, *)
    @discardableResult
    func selectionStyle(_ selectionStyle: UITableViewCell.SelectionStyle) -> Self {
        (self as! UITableViewCell).selectionStyle = selectionStyle
        return self
    }
    @discardableResult
    func showsReorderControl(_ showsReorderControl: Bool) -> Self {
        (self as! UITableViewCell).showsReorderControl = showsReorderControl
        return self
    }
    @discardableResult
    func shouldIndentWhileEditing(_ shouldIndentWhileEditing: Bool) -> Self {
        (self as! UITableViewCell).shouldIndentWhileEditing = shouldIndentWhileEditing
        return self
    }
    @discardableResult
    func accessoryType(_ accessoryType: UITableViewCell.AccessoryType) -> Self {
        (self as! UITableViewCell).accessoryType = accessoryType
        return self
    }
    @discardableResult
    func accessoryView(_ accessoryView: UIView?) -> Self {
        (self as! UITableViewCell).accessoryView = accessoryView
        return self
    }
    @discardableResult
    func indentationWidth(_ indentationWidth: CGFloat) -> Self {
        (self as! UITableViewCell).indentationWidth = indentationWidth
        return self
    }
    @available(iOS 7.0, *)
    @discardableResult
    func separatorInset(_ separatorInset: UIEdgeInsets) -> Self {
        (self as! UITableViewCell).separatorInset = separatorInset
        return self
    }
    @discardableResult
    func isEditing(_ isEditing: Bool) -> Self {
        (self as! UITableViewCell).isEditing = isEditing
        return self
    }
    @available(iOS 9.0, *)
    @discardableResult
    func focusStyle(_ focusStyle: UITableViewCell.FocusStyle) -> Self {
        (self as! UITableViewCell).focusStyle = focusStyle
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func userInteractionEnabledWhileDragging(_ userInteractionEnabledWhileDragging: Bool) -> Self {
        (self as! UITableViewCell).userInteractionEnabledWhileDragging = userInteractionEnabledWhileDragging
        return self
    }
}
