import UIKit

extension UINavigationController: UINavigationControllerChaining { }
public protocol UINavigationControllerChaining { }
public extension UINavigationControllerChaining {
    @discardableResult
    func delegate(_ delegate: UINavigationControllerDelegate) -> Self {
        (self as! UINavigationController).delegate = delegate
        return self
    }
    @discardableResult
    func hidesBarsOnSwipe(_ hidesBarsOnSwipe: Bool) -> Self {
        (self as! UINavigationController).hidesBarsOnSwipe = hidesBarsOnSwipe
        return self
    }
    @discardableResult
    func hidesBarsOnTap(_ hidesBarsOnTap: Bool) -> Self {
        (self as! UINavigationController).hidesBarsOnTap = hidesBarsOnTap
        return self
    }
    @discardableResult
    func hidesBarsWhenKeyboardAppears(_ hidesBarsWhenKeyboardAppears: Bool) -> Self {
        (self as! UINavigationController).hidesBarsWhenKeyboardAppears = hidesBarsWhenKeyboardAppears
        return self
    }
    @discardableResult
    func isNavigationBarHidden(_ isNavigationBarHidden: Bool) -> Self {
        (self as! UINavigationController).isNavigationBarHidden = isNavigationBarHidden
        return self
    }
    @discardableResult
    func viewControllers(_ viewControllers: [UIViewController]) -> Self {
        (self as! UINavigationController).viewControllers = viewControllers
        return self
    }
}
