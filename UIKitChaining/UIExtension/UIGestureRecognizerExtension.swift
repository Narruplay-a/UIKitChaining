import UIKit

public extension UIGestureRecognizer {
    struct AssociatedKeys {
        static var touchAction: TouchAction = TouchAction({})
    }
    internal var touchAction: TouchAction{
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.touchAction) as? TouchAction ?? TouchAction({})
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.touchAction, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    @objc internal func proceedAction() {
        touchAction.proceedAction()
    }
}
