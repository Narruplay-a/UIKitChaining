import UIKit

internal class TouchAction{
    var touchAction: () -> Void = { }
    
    public init(_ callback: @escaping ()-> Void) {
        touchAction = callback
    }
}

public extension UIView {
    func firstResponderSubview() -> UIView? {
        for view in subviews {
            if view.isFirstResponder { return view }
            if let textView = view.firstResponderSubview() {
                return textView
            }
        }
        return nil
    }
    
    func firstLeftConstraintView() -> UIView? {
        guard let _ = superview else { return nil }
        var leftView: UIView?
        
        let constraint: NSLayoutConstraint? = leftConstraint()
        guard constraint != nil else { return nil }
        
        leftView = constraint?.secondItem as? UIView
        if let view = constraint?.firstItem as? UIView, view != self {
            leftView = view
        }
        return leftView
    }
    
    func firstRightConstraintView() -> UIView? {
        guard let _ = superview else { return nil }
        var rightView: UIView?
        
        let constraint: NSLayoutConstraint? = rightConstraint()
        guard constraint != nil else { return nil }
        
        rightView = constraint?.secondItem as? UIView
        if let view = constraint?.firstItem as? UIView, view != self {
            rightView = view
        }
        return rightView
    }
    
    func firstTopConstraintView() -> UIView? {
        guard let _ = superview else { return nil }
        var topView: UIView?
        
        let constraint: NSLayoutConstraint? = topConstraint()
        guard constraint != nil else { return nil }
        
        topView = constraint?.secondItem as? UIView
        if let view = constraint?.firstItem as? UIView, view != self {
            topView = view
        }
        return topView
    }
    
    func firstBottomConstraintView() -> UIView? {
        guard let _ = superview else { return nil }
        var bottomView: UIView?
        
        let constraint: NSLayoutConstraint? = bottomConstraint()
        guard constraint != nil else { return nil }
        
        bottomView = constraint?.secondItem as? UIView
        if let view = constraint?.firstItem as? UIView, view != self {
            bottomView = view
        }
        return bottomView
    }
    
    //Return first view constraint where layoutAttribute == .top
    func topConstraint() -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        var constraint: NSLayoutConstraint? = nil
        for item in superview.constraints {
            if isTop(constraint: item) {
                constraint = item
                break
            }
        }
        return constraint
    }
    
    func rightConstraint() -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        var constraint: NSLayoutConstraint? = nil
        for item in superview.constraints {
            if isRight(constraint: item) {
                constraint = item
                break
            }
        }
        return constraint
    }
    
    func leftConstraint() -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        var constraint: NSLayoutConstraint? = nil
        for item in superview.constraints {
            if isLeft(constraint: item) {
                constraint = item
                break
            }
        }
        return constraint
    }
    
    func bottomConstraint() -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        var constraint: NSLayoutConstraint? = nil
        for item in superview.constraints {
            if isBottom(constraint: item) {
                constraint = item
                break
            }
        }
        return constraint
    }
    
    func heightConstraint() -> NSLayoutConstraint? {
        guard let _ = superview else { return nil }
        var constraint: NSLayoutConstraint? = nil
        for item in self.constraints {
            if item.firstAttribute == NSLayoutConstraint.Attribute.height {
                constraint = item
            }
        }
        return constraint
    }
    
    func widthConstraint() -> NSLayoutConstraint? {
        guard let _ = superview else { return nil }
        var constraint: NSLayoutConstraint? = nil
        for item in self.constraints{
            if item.firstAttribute == NSLayoutConstraint.Attribute.width{
                constraint = item
            }
        }
        return constraint
    }
    
    private func isTop(constraint: NSLayoutConstraint) -> Bool {
        if (constraint.firstItem as? NSObject == self &&
            constraint.firstAttribute == NSLayoutConstraint.Attribute.top) ||
            (constraint.secondItem as? NSObject == self &&
                constraint.secondAttribute == NSLayoutConstraint.Attribute.top) {
            return true
        } else {
            return false
        }
    }
    
    private func isBottom(constraint: NSLayoutConstraint) -> Bool {
        if (constraint.firstItem as? NSObject == self &&
            constraint.firstAttribute == NSLayoutConstraint.Attribute.bottom) ||
            (constraint.secondItem as? NSObject == self &&
                constraint.secondAttribute == NSLayoutConstraint.Attribute.bottom) {
            return true
        } else {
            return false
        }
    }
    
    private func isLeft(constraint: NSLayoutConstraint) -> Bool {
        if (constraint.firstItem as? NSObject == self &&
            constraint.firstAttribute == NSLayoutConstraint.Attribute.leading) ||
            (constraint.secondItem as? NSObject == self &&
                constraint.secondAttribute == NSLayoutConstraint.Attribute.leading) {
            return true
        } else if (constraint.firstItem as? NSObject == self &&
            constraint.firstAttribute == NSLayoutConstraint.Attribute.left) ||
            (constraint.secondItem as? NSObject == self &&
                constraint.secondAttribute == NSLayoutConstraint.Attribute.left) {
            return true
        } else {
            return false
        }
    }
    
    private func isRight(constraint: NSLayoutConstraint) -> Bool {
        if (constraint.firstItem as? NSObject == self &&
            constraint.firstAttribute == NSLayoutConstraint.Attribute.trailing) ||
            (constraint.secondItem as? NSObject == self &&
                constraint.secondAttribute == NSLayoutConstraint.Attribute.trailing) {
            return true
        } else if (constraint.firstItem as? NSObject == self &&
            constraint.firstAttribute == NSLayoutConstraint.Attribute.right) ||
            (constraint.secondItem as? NSObject == self &&
                constraint.secondAttribute == NSLayoutConstraint.Attribute.right) {
            return true
        } else {
            return false
        }
    }
    
    func setList(of views: [UIView], on view: UIView, with margin: UIEdgeInsets = .zero, offset: CGFloat = 0) {
        for i in 0..<views.count {
            setSubview(views[i])
                .leftToSuperview(margin.left)
                .rightToSuperview(margin.right)
            
            if i == 0 {
                views[i].topToSuperview(margin.top)
            } else  {
                views[i].topToBottom(of: views[i-1], offset)
            }
            if i == views.count - 1 {
                views[i].bottomToSuperview(margin.bottom)
            }
        }
    }
    
    func layoutList(_ views: [UIView], offset: UIEdgeInsets, elementOffset: CGFloat = 0, topView: UIView? = nil, bottomView: UIView? = nil) {
        for i in 0..<views.count {
            setSubview(views[i])
                .leftToSuperview(offset.left)
                .rightToSuperview(offset.right)
            
            if i == 0 {
                if let topView = topView {
                    views[i].topToBottom(of: topView, offset.top)
                } else {
                    views[i].topToSuperview(offset.top)
                }
            } else  {
                views[i].topToBottom(of: views[i-1], elementOffset)
            }
            if i == views.count - 1 {
                if let bottomView = bottomView {
                    views[i].bottomToTop(of: bottomView, offset.bottom)
                } else {
                    views[i].bottomToSuperview(offset.bottom)
                }
            }
        }
    }

    func firstSubviewWith(_ id: String) -> UIView? {
        for view in subviews {
            if view.id == id {
                return view
            }
        }
        return nil
    }
    
    func subviewsWith(_ id: String) -> [UIView] {
        var returnArray: [UIView] = []
        for view in subviews {
            if view.id == id {
                returnArray.append(view)
            }
        }
        return returnArray
    }
    
    func firstSubviewWith(_ tag: Int) -> UIView? {
        for view in subviews {
            if view.tag == tag {
                return view
            }
        }
        return nil
    }
    
    func subviewsWith(_ tag: Int) -> [UIView] {
        var returnArray: [UIView] = []
        for view in subviews {
            if view.tag == tag {
                returnArray.append(view)
            }
        }
        return returnArray
    }
    
    func firstSubviewWith(_ type: AnyClass) -> UIView? {
        for view in subviews {
            if view.tag == tag {
                return view
            }
        }
        return nil
    }
    
    func subviewsWith(_ type: AnyClass) -> [UIView] {
        var returnArray: [UIView] = []
        for view in subviews {
            if view.classForCoder == type {
                returnArray.append(view)
            }
        }
        return returnArray
    }
    
    func constraints(for attribute: NSLayoutConstraint.Attribute) -> [NSLayoutConstraint] {
        guard let superview = superview else { return [] }
        
        var returnArray: [NSLayoutConstraint] = []
        
        for item in superview.constraints {
            if (item.firstItem != nil && item.firstItem as! NSObject == self && attribute == item.firstAttribute) || (item.secondItem != nil && item.secondItem as! NSObject == self && attribute == item.secondAttribute) {
                returnArray.append(item)
            }
        }
        
        return returnArray
    }
    
    func updateConstraints(_ constraints: [NSLayoutConstraint?], offset: CGFloat, multiplier: CGFloat?, relation: NSLayoutConstraint.Relation?) {
        guard let superview = superview else { return }
        
        if multiplier != nil || relation != nil {
            for constraint in constraints {
                removeViewConstraint(constraint)
                if let constraint = constraint {
                    superview.addConstraint(NSLayoutConstraint(item: constraint.firstItem, attribute: constraint.firstAttribute, relatedBy: relation ?? .equal,
                                                               toItem: constraint.secondItem, attribute: constraint.secondAttribute, multiplier: multiplier ?? 1, constant: offset))
                }
            }
        } else {
            for constraint in constraints {
                constraint?.constant = offset
            }
        }
    }
    
    func updateConstraints(_ constraints: [NSLayoutConstraint?], offsetDiff: CGFloat) {
        for constraint in constraints {
            constraint?.constant += offsetDiff
        }
    }
    
    func removeViewConstraint(_ constraint: NSLayoutConstraint?) {
        guard let constraint = constraint else { return }
        
        let firstView = constraint.firstItem as? UIView
        let secondView = constraint.secondItem as? UIView
        
        if let superview = superview {
            if firstView == superview || secondView == superview {
                superview.removeConstraint(constraint)
            } else {
                removeConstraint(constraint)
            }
        } else {
            removeConstraint(constraint)
        }
    }
    
    func removeViewConstraints(for attributes: [NSLayoutConstraint.Attribute]) {
        for item in constraints {
            if (item.firstItem != nil && item.firstItem as! NSObject == self && attributes.contains(item.firstAttribute)) || (item.secondItem != nil && item.secondItem as! NSObject == self && attributes.contains(item.secondAttribute)) {
                self.removeConstraint(item)
            }
        }
        guard let superview = superview else { return }
        for item in superview.constraints {
            if (item.firstItem != nil && item.firstItem as! NSObject == self && attributes.contains(item.firstAttribute)) || (item.secondItem != nil && item.secondItem as! NSObject == self && attributes.contains(item.secondAttribute)) {
                superview.removeConstraint(item)
            }
        }
    }
    
    func removeAllConstraints(_ includeInternalConstraints: Bool = true) {
        if includeInternalConstraints {
            for item in constraints {
                self.removeConstraint(item)
            }
        }
        if let superview = self.superview {
            for item in superview.constraints {
                if (item.firstItem != nil && item.firstItem as! NSObject == self) || (item.secondItem != nil && item.secondItem as! NSObject == self) {
                    superview.removeConstraint(item)
                }
            }
        }
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat, rect: CGRect = CGRect.zero) {
        var rect = rect
        if rect == CGRect.zero {
            rect = self.bounds
        }
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    @discardableResult
    func setSubview<T: UIView>(_ view: T) -> T {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    @discardableResult
    func setGestureRecognizer<T: UIGestureRecognizer>(_ recognizer: T) -> T {
        addGestureRecognizer(recognizer)
        return recognizer
    }
    
    func clearSubviews(_ except: Int? = nil) {
        subviews.forEach {
            if let except = except {
                if $0.tag != except {
                    $0.removeFromSuperview()
                }
            } else {
                $0.removeFromSuperview()
            }
        }
    }
    
    func removeAction() {
        isUserInteractionEnabled = false
        touchAction = TouchAction({})
    }
    
    @objc internal func touch() {
        touchAction.touchAction()
    }
}

public extension UIView {
    private struct AssociatedKeys {
        static var id: String = ""
        static var cornerRadius: CGFloat = 0
        static var borderColor: UIColor = .black
        static var borderWidth: CGFloat = 1.0
        static var touchAction: TouchAction = TouchAction({})
    }
    
    @IBInspectable var id: String {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.id) as! String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.id, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.cornerRadius) as? CGFloat ?? 0.0
        }
        set {
            layer.cornerRadius = CGFloat(newValue)
            objc_setAssociatedObject(self, &AssociatedKeys.cornerRadius, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @IBInspectable var layerBorderColor: UIColor {
        get {
            let borderColor = objc_getAssociatedObject(self, &AssociatedKeys.borderColor) as? UIColor
            return borderColor != nil ? borderColor! : UIColor.colorFromHex(0xe6e6e6)
        }
        set {
            layer.borderColor = newValue.cgColor
            objc_setAssociatedObject(self, &AssociatedKeys.borderColor, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @IBInspectable var layerBorderWidth: CGFloat {
        get {
            let borderWidth = objc_getAssociatedObject(self, &AssociatedKeys.borderWidth) as? CGFloat
            return borderWidth != nil ? borderWidth! : 1.0
        }
        set {
            layer.borderWidth = newValue
            objc_setAssociatedObject(self, &AssociatedKeys.borderWidth, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    internal var touchAction: TouchAction {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.touchAction) as? TouchAction ?? TouchAction({})
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.touchAction, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}
