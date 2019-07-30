import UIKit

extension UIViewController: UIViewControllerChaining { }
public protocol UIViewControllerChaining { }
public extension UIViewControllerChaining {
    @discardableResult
    func title(_ title: String) -> Self {
        (self as! UIViewController).title = title
        return self
    }
    @available(iOS 5.0, *)
    @discardableResult
    func definesPresentationContext(_ definesPresentationContext: Bool) -> Self {
        (self as! UIViewController).definesPresentationContext = definesPresentationContext
        return self
    }
    @available(iOS 5.0, *)
    @discardableResult
    func providesPresentationContextTransitionStyle(_ providesPresentationContextTransitionStyle: Bool) -> Self {
        (self as! UIViewController).providesPresentationContextTransitionStyle = providesPresentationContextTransitionStyle
        return self
    }
    @available(iOS 10.0, *)
    @discardableResult
    func restoresFocusAfterTransition(_ restoresFocusAfterTransition: Bool) -> Self {
        (self as! UIViewController).restoresFocusAfterTransition = restoresFocusAfterTransition
        return self
    }
    @discardableResult
    func modalTransitionStyle(_ modalTransitionStyle: UIModalTransitionStyle) -> Self {
        (self as! UIViewController).modalTransitionStyle = modalTransitionStyle
        return self
    }
    @available(iOS 3.2, *)
    @discardableResult
    func modalPresentationStyle(_ modalPresentationStyle: UIModalPresentationStyle) -> Self {
        (self as! UIViewController).modalPresentationStyle = modalPresentationStyle
        return self
    }
    @available(iOS 7.0, *)
    @discardableResult
    func modalPresentationCapturesStatusBarAppearance(_ modalPresentationCapturesStatusBarAppearance: Bool) -> Self {
        (self as! UIViewController).modalPresentationCapturesStatusBarAppearance = modalPresentationCapturesStatusBarAppearance
        return self
    }
    @available(iOS 7.0, *)
    @discardableResult
    func edgesForExtendedLayout(_ edgesForExtendedLayout: UIRectEdge) -> Self {
        (self as! UIViewController).edgesForExtendedLayout = edgesForExtendedLayout
        return self
    }
    @available(iOS 7.0, *)
    @discardableResult
    func extendedLayoutIncludesOpaqueBars(_ extendedLayoutIncludesOpaqueBars: Bool) -> Self {
        (self as! UIViewController).extendedLayoutIncludesOpaqueBars = extendedLayoutIncludesOpaqueBars
        return self
    }
    @available(iOS 7.0, *)
    @discardableResult
    func automaticallyAdjustsScrollViewInsets(_ automaticallyAdjustsScrollViewInsets: Bool) -> Self {
        (self as! UIViewController).automaticallyAdjustsScrollViewInsets = automaticallyAdjustsScrollViewInsets
        return self
    }
    @available(iOS 7.0, *)
    @discardableResult
    func preferredContentSize(_ preferredContentSize: CGSize) -> Self {
        (self as! UIViewController).preferredContentSize = preferredContentSize
        return self
    }
}
