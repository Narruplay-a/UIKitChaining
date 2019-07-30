import UIKit

public enum AKConstraint {
    case all(UIEdgeInsets)
    case left(CGFloat)
    case right(CGFloat)
    case top(CGFloat)
    case bottom(CGFloat)
    case sidesToSuperview(CGFloat)
    case topBottomToSuperview(CGFloat)
    
    case topLayout(UIViewController, CGFloat)
    case bottomLayout(UIViewController, CGFloat)
    
    case width(CGFloat)
    case height(CGFloat)
    case size(width: CGFloat, height: CGFloat)
    case widthTo(UIView?, multiplier: CGFloat)
    case heightTo(UIView?, multiplier: CGFloat)
    
    case centerInSuperview
    case vertical(CGFloat)
    case horizontal(CGFloat)
    case verticalTo(UIView?, CGFloat)
    case horizonatlTo(UIView?, CGFloat)
    
    case leftToRight(UIView?, CGFloat)
    case rightToLeft(UIView?, CGFloat)
    case leftToLeft(UIView?, CGFloat)
    case rightToRight(UIView?, CGFloat)
    case topToTop(UIView?, CGFloat)
    case bottomToBottom(UIView?, CGFloat)
    case topToBottom(UIView?, CGFloat)
    case bottomToTop(UIView?, CGFloat)
}

public enum AKSide {
    case top
    case bottom
    case left
    case right
}

public enum AKDimension {
    case width
    case height
    
    func getAttribute() -> NSLayoutConstraint.Attribute{
        if self == .width {
            return NSLayoutConstraint.Attribute.width
        } else {
            return NSLayoutConstraint.Attribute.height
        }
    }
}

public extension UIView {
    var lastSubview: UIView? {
        get {
            return subviews.last
        }
    }
    var beforeLastSubview: UIView? {
        get {
            return subviews.count > 1 ? subviews[self.subviews.count - 2] : nil
        }
    }
    
    func setConstraints(_ constraints: [AKConstraint]) {
        pinView(constraints)
    }
    
    func setConstraint(_ constraint: AKConstraint) {
        pinView([constraint])
    }
    
    @discardableResult
    func sideToSide(_ side: NSLayoutConstraint.Attribute, toView: UIView?, toSide: NSLayoutConstraint.Attribute, offset: CGFloat, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            ConstraintLogger.logSuperviewError(self)
            return nil }
        guard let view = toView else {
            ConstraintLogger.logError(self, attribute: side)
            return nil }
        let offset = side == .bottom || side == .right ? -offset : offset
        let const = NSLayoutConstraint(item: self, attribute: side, relatedBy: relation, toItem: view, attribute: toSide, multiplier: multiplier, constant: offset)
        superview.addConstraint(const)
        return const
    }
    
    @discardableResult
    func setDimension(_ dimension: AKDimension, offset: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint? {
        guard let _ = superview else {
            ConstraintLogger.logSuperviewError(self)
            return nil }
        let const = NSLayoutConstraint(item: self, attribute: dimension.getAttribute(), relatedBy: relation, toItem: nil, attribute: dimension.getAttribute(), multiplier: 1, constant: offset)
        addConstraint(const)
        return const
    }
    
    @discardableResult
    func alignDimension(_ dimension: AKDimension, toView: UIView?, multiplier: CGFloat, offset: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            ConstraintLogger.logSuperviewError(self)
            return nil }
        guard let view = toView else {
            ConstraintLogger.logError(self, attribute: dimension == .width ? .width : .height)
            return nil }
        let const = NSLayoutConstraint(item: self, attribute: dimension.getAttribute(), relatedBy: relation, toItem: view, attribute: dimension.getAttribute(), multiplier: multiplier, constant: offset)
        superview.addConstraint(const)
        return const
    }
    
    @discardableResult
    func alignVertical(_ view: UIView?, offset: CGFloat) -> NSLayoutConstraint? {
        guard let view = view else {
            ConstraintLogger.logError(self, attribute: .centerX)
            return nil }
        guard let superview = view.superview else {
            ConstraintLogger.logSuperviewError(self)
            return nil }
        let const = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: .equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: offset)
        superview.addConstraint(const)
        return const
    }
    
    @discardableResult
    func alignVerticalToSuperview(_ offset: CGFloat) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            ConstraintLogger.logError(self, attribute: .centerX)
            return nil }
        let const = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: .equal, toItem: superview, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: offset)
        superview.addConstraint(const)
        return const
    }
    
    @discardableResult
    func alignHorizontal(_ view: UIView?, offset: CGFloat) -> NSLayoutConstraint? {
        guard let view = view else {
            ConstraintLogger.logError(self, attribute: .centerY)
            return nil }
        guard let superview = view.superview else {
            ConstraintLogger.logSuperviewError(self)
            return nil }
        let const = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: .equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: offset)
        superview.addConstraint(const)
        return const
    }
    
    @discardableResult
    func alignHorizontalToSuperview(_ offset: CGFloat) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            ConstraintLogger.logError(self, attribute: .centerY)
            return nil }
        let const = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: .equal, toItem: superview, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: offset)
        superview.addConstraint(const)
        return const
    }
    
    @discardableResult
    func toTopLayout(_ controller: UIViewController, offset: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint? {
        let const = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.top, relatedBy: relation, toItem: controller.topLayoutGuide, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: offset)
        controller.view.addConstraint(const)
        return const
    }
    
    @discardableResult
    func toBottomLayout(_ controller: UIViewController, offset: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint? {
        let const = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: relation, toItem: controller.bottomLayoutGuide, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -offset)
        controller.view.addConstraint(const)
        return const
    }
    
    internal func pinView(_ constraints: [AKConstraint]) {
        guard let superview = self.superview else {
            ConstraintLogger.logSuperviewError(self)
            return }
        for constraint in constraints {
            switch constraint {
            case .all(let insets):
                sideToSide(.top, toView: superview, toSide: .top, offset: insets.top)
                sideToSide(.bottom, toView: superview, toSide: .bottom, offset: insets.bottom)
                sideToSide(.left, toView: superview, toSide: .left, offset: insets.left)
                sideToSide(.right, toView: superview, toSide: .right, offset: insets.right)
            case .sidesToSuperview(let offset):
                sideToSide(.left, toView: superview, toSide: .left, offset: offset)
                sideToSide(.right, toView: superview, toSide: .right, offset: offset)
            case .topBottomToSuperview(let offset):
                sideToSide(.top, toView: superview, toSide: .top, offset: offset)
                sideToSide(.bottom, toView: superview, toSide: .bottom, offset: offset)
            case .top(let offset):
                sideToSide(.top, toView: superview, toSide: .top, offset: offset)
            case .bottom(let offset):
                sideToSide(.bottom, toView: superview, toSide: .bottom, offset: offset)
            case .left(let offset):
                sideToSide(.left, toView: superview, toSide: .left, offset: offset)
            case .right(let offset):
                sideToSide(.right, toView: superview, toSide: .right, offset: offset)
            case .width(let offset):
                setDimension(.width, offset: offset)
            case .height(let offset):
                setDimension(.height, offset: offset)
            case .size(width: let width, height: let height):
                setDimension(.height, offset: height)
                setDimension(.width, offset: width)
            case .widthTo(let view, multiplier: let multiplier):
                alignDimension(.width, toView: view, multiplier: multiplier, offset: 0)
            case .heightTo(let view, multiplier: let multiplier):
                alignDimension(.height, toView: view, multiplier: multiplier, offset: 0)
            case .centerInSuperview:
                alignVertical(superview, offset: 0)
                alignHorizontal(superview, offset: 0)
            case .vertical(let offset):
                alignVertical(superview, offset: offset)
            case .horizontal(let offset):
                alignHorizontal(superview, offset: offset)
            case .verticalTo(let view, let offset):
                alignVertical(view, offset: offset)
            case .horizonatlTo(let view, let offset):
                alignHorizontal(view, offset: offset)
            case .leftToRight(let view, let offset):
                sideToSide(.left, toView: view, toSide: .right, offset: offset)
            case .rightToLeft(let view, let offset):
                sideToSide(.right, toView: view, toSide: .left, offset: offset)
            case .leftToLeft(let view, let offset):
                sideToSide(.left, toView: view, toSide: .left, offset: offset)
            case .rightToRight(let view, let offset):
                sideToSide(.left, toView: view, toSide: .right, offset: offset)
            case .topToTop(let view, let offset):
                sideToSide(.top, toView: view, toSide: .top, offset: offset)
            case .bottomToBottom(let view, let offset):
                sideToSide(.bottom, toView: view, toSide: .bottom, offset: offset)
            case .topToBottom(let view, let offset):
                sideToSide(.top, toView: view, toSide: .bottom, offset: offset)
            case .bottomToTop(let view, let offset):
                sideToSide(.bottom, toView: view, toSide: .top, offset: offset)
            case .topLayout(let controller, let offset):
                toTopLayout(controller, offset: offset)
            case .bottomLayout(let controller, let offset):
                toBottomLayout(controller, offset: offset)
            }
        }
    }
}
