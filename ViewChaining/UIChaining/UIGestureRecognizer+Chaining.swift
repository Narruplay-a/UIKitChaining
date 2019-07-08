import UIKit

extension UIGestureRecognizer: UIGestureRecognizerChainingProtocol { }
public protocol UIGestureRecognizerChainingProtocol { }
public extension UIGestureRecognizerChainingProtocol {
    @discardableResult
    func setAction(_ action: @escaping () -> Void) -> Self {
        (self as! UIGestureRecognizer).touchAction = TouchAction(action)
        (self as! UIGestureRecognizer).addTarget(self, action: #selector(UIGestureRecognizer.proceedAction))
        return self
    }
}

extension UISwipeGestureRecognizer: UISwipeGestureRecognizerChainingProtocol { }
public protocol UISwipeGestureRecognizerChainingProtocol { }
public extension UISwipeGestureRecognizerChainingProtocol {
    @discardableResult
    func direction(_ direction: UISwipeGestureRecognizer.Direction) -> Self {
        (self as! UISwipeGestureRecognizer).direction = direction
        return self
    }
    @discardableResult
    func numberOfTouchesRequired(_ numberOfTouchesRequired: Int) -> Self {
        (self as! UISwipeGestureRecognizer).numberOfTouchesRequired = numberOfTouchesRequired
        return self
    }
}

extension UITapGestureRecognizer: UITapGestureRecognizerChainingProtocol { }
public protocol UITapGestureRecognizerChainingProtocol { }
public extension UITapGestureRecognizerChainingProtocol {
    @discardableResult
    func numberOfTapsRequired(_ numberOfTapsRequired: Int) -> Self {
        (self as! UITapGestureRecognizer).numberOfTapsRequired = numberOfTapsRequired
        return self
    }
    @discardableResult
    func numberOfTouchesRequired(_ numberOfTouchesRequired: Int) -> Self {
        (self as! UITapGestureRecognizer).numberOfTouchesRequired = numberOfTouchesRequired
        return self
    }
}

extension UILongPressGestureRecognizer: UILongPressGestureRecognizerChainingProtocol { }
public protocol UILongPressGestureRecognizerChainingProtocol { }
public extension UILongPressGestureRecognizerChainingProtocol {
    @discardableResult
    func minimumPressDuration(_ minimumPressDuration: TimeInterval) -> Self {
        (self as! UILongPressGestureRecognizer).minimumPressDuration = minimumPressDuration
        return self
    }
    @discardableResult
    func allowableMovement(_ allowableMovement: CGFloat) -> Self {
        (self as! UILongPressGestureRecognizer).allowableMovement = allowableMovement
        return self
    }
    @discardableResult
    func numberOfTapsRequired(_ numberOfTapsRequired: Int) -> Self {
        (self as! UILongPressGestureRecognizer).numberOfTapsRequired = numberOfTapsRequired
        return self
    }
    @discardableResult
    func numberOfTouchesRequired(_ numberOfTouchesRequired: Int) -> Self {
        (self as! UILongPressGestureRecognizer).numberOfTouchesRequired = numberOfTouchesRequired
        return self
    }
}

