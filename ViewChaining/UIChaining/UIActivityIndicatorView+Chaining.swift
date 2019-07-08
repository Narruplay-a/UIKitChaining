import UIKit

extension UIActivityIndicatorView: UIViewControllerChaining { }
public protocol UIActivityIndicatorViewChaining { }
public extension UIActivityIndicatorViewChaining {
    @discardableResult
    func style(_ style: UIActivityIndicatorView.Style) -> Self {
        (self as! UIActivityIndicatorView).activityIndicatorViewStyle = style
        return self
    }
    @discardableResult
    func hidesWhenStopped(_ hidesWhenStopped: Bool) -> Self {
        (self as! UIActivityIndicatorView).hidesWhenStopped = hidesWhenStopped
        return self
    }
    @discardableResult
    func color(_ color: UIColor) -> Self {
        (self as! UIActivityIndicatorView).color = color
        return self
    }
}

