import UIKit

extension UIScrollView: UIScrollViewChainingProtocol { }
public protocol UIScrollViewChainingProtocol { }
public extension UIScrollViewChainingProtocol {
    @discardableResult
    func contentInset(_ offset: UIEdgeInsets) -> Self {
        (self as! UIScrollView).contentInset = offset
        return self
    }
    @discardableResult
    func contentOffset(_ offset: CGPoint) -> Self {
        (self as! UIScrollView).contentOffset = offset
        return self
    }
    @discardableResult
    func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> Self {
        (self as! UIScrollView).alwaysBounceVertical = alwaysBounceVertical
        return self
    }
    @discardableResult
    func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> Self {
        (self as! UIScrollView).alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }
    @discardableResult
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        (self as! UIScrollView).isScrollEnabled = isScrollEnabled
        return self
    }
    @discardableResult
    func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> Self {
        (self as! UIScrollView).showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    @discardableResult
    func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> Self {
        (self as! UIScrollView).showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    @discardableResult
    func delegate(_ delegate: UIScrollViewDelegate) -> Self {
        (self as! UIScrollView).delegate = delegate
        return self
    }
    
    //Make editable views (UITextField, UITextView) always visible after keyboard is shown. Keyboard notification's observers WILL BE REMOVED after removeFromSuperview() is called (after scroll view's holding controller disapears or manual call), so you don't need to remove it manually.
    @discardableResult
    func autoAdjustScrollToKeyboardFrame(with offset: CGFloat) -> Self {
        let selfValue = self as! UIScrollView
        selfValue.contentAdjustOffset = offset
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(selfValue.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(selfValue.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        return self
    }
}


