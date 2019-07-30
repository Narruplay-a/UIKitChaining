import UIKit
extension UINavigationItem: UINavigationItemChaining { }

public protocol UINavigationItemChaining { }
public extension UINavigationItemChaining {
    @discardableResult
    func backBarButtonItem(_ backBarButtonItem: UIBarButtonItem) -> Self {
        (self as! UINavigationItem).backBarButtonItem = backBarButtonItem
        return self
    }
    @discardableResult
    func hidesBackButton(_ hidesBackButton: Bool) -> Self {
        (self as! UINavigationItem).hidesBackButton = hidesBackButton
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func hidesSearchBarWhenScrolling(_ hidesSearchBarWhenScrolling: Bool) -> Self {
        (self as! UINavigationItem).hidesSearchBarWhenScrolling = hidesSearchBarWhenScrolling
        return self
    }
    @discardableResult
    func leftBarButtonItem(_ leftBarButtonItem: UIBarButtonItem) -> Self {
        (self as! UINavigationItem).leftBarButtonItem = leftBarButtonItem
        return self
    }
    @discardableResult
    func rightBarButtonItem(_ rightBarButtonItem: UIBarButtonItem) -> Self {
        (self as! UINavigationItem).rightBarButtonItem = rightBarButtonItem
        return self
    }
    @discardableResult
    func leftBarButtonItems(_ leftBarButtonItems: [UIBarButtonItem]) -> Self {
        (self as! UINavigationItem).leftBarButtonItems = leftBarButtonItems
        return self
    }
    @discardableResult
    func rightBarButtonItems(_ rightBarButtonItems: [UIBarButtonItem]) -> Self {
        (self as! UINavigationItem).rightBarButtonItems = rightBarButtonItems
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func largeTitleDisplayMode(_ largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode) -> Self {
        (self as! UINavigationItem).largeTitleDisplayMode = largeTitleDisplayMode
        return self
    }
    @discardableResult
    func title(_ title: String) -> Self {
        (self as! UINavigationItem).title = title
        return self
    }
    @discardableResult
    func titleView(_ titleView: UIView) -> Self {
        (self as! UINavigationItem).titleView = titleView
        return self
    }
}
