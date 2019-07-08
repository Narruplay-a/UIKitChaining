import UIKit

extension UINavigationBar: UINavigationBarChaining { }
public protocol UINavigationBarChaining { }
public extension UINavigationBarChaining {
    @discardableResult
    func barStyle(_ barStyle: UIBarStyle) -> Self {
        (self as! UINavigationBar).barStyle = barStyle
        return self
    }
    @discardableResult
    func barTintColor(_ barTintColor: UIColor) -> Self {
        (self as! UINavigationBar).barTintColor = barTintColor
        return self
    }
    @discardableResult
    func isTranslucent(_ isTranslucent: Bool) -> Self {
        (self as! UINavigationBar).isTranslucent = isTranslucent
        return self
    }
    @discardableResult
    func shadowImage(_ shadowImage: UIImage) -> Self {
        (self as! UINavigationBar).shadowImage = shadowImage
        return self
    }
    @discardableResult
    func items(_ items: [UINavigationItem]) -> Self {
        (self as! UINavigationBar).items = items
        return self
    }
}
