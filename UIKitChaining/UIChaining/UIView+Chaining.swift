import UIKit

extension UIView: UIViewChainingProtocol { }
public protocol UIViewChainingProtocol { }
public extension UIViewChainingProtocol {
    @discardableResult
    func action(_ action: @escaping () -> Void) -> Self {
        (self as! UIView).isUserInteractionEnabled = true
        (self as! UIView).touchAction = TouchAction(action)
        (self as! UIView).addGestureRecognizer(UITapGestureRecognizer(target: (self as! UIView), action: #selector((self as! UIView).touch)))
        return self
    }
    @discardableResult
    func optional(_ option: Bool, _ block: (Self) -> Void) -> Self {
        if option {
            block(self)
        }
        return self
    }
    @discardableResult
    func updateDimension(_ dimension: AKDimension, value: CGFloat) -> Self {
        guard let selfView = self as? UIView, let _ = selfView.superview else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        if dimension == .height {
            selfView.firstHeightConstraint()?.constant = value
        } else {
            selfView.firstWidthConstraint()?.constant = value
        }
        return self
    }
    @discardableResult
    func setSubviewsOnList(_ views: [UIView], _ margin: UIEdgeInsets = UIEdgeInsets.zero, _ offset: CGFloat = 0) -> Self {
        (self as! UIView).setList(of: views, on: (self as! UIView), with: margin, offset: offset)
        return self
    }
    @discardableResult
    func horizontalToSuperview(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.alignHorizontalToSuperview(offset)
        return self
    }
    @discardableResult
    func verticalToSuperview(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.alignVerticalToSuperview(offset)
        return self
    }
    @discardableResult
    func verticalTo(_ view: UIView?, with offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.alignVertical(view, offset: offset)
        return self
    }
    @discardableResult
    func horizontalTo(_ view: UIView?, with offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.alignHorizontal(view, offset: offset)
        return self
    }
    @discardableResult
    func apectRatio(_ widthToHeight: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.alignDimension(.width, toView: selfView, toDimesion: .height, multiplier: widthToHeight, offset: 0, relation: .equal)
        return self
    }
    @discardableResult
    func widthTo(_ view: UIView?, multiplier: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.alignDimension(.width, toView: view, multiplier: multiplier, offset: 0)
        return self
    }
    @discardableResult
    func heightTo(_ view: UIView?, multiplier: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.alignDimension(.height, toView: view, multiplier: multiplier, offset: 0)
        return self
    }
    @discardableResult
    func centerInSuperview() -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.horizontalToSuperview(0)
            .verticalToSuperview(0)
        return self
    }
    @discardableResult
    func centerToView(_ view: UIView?, offset: CGPoint) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.horizontalTo(view, with: offset.y)
            .verticalTo(view, with: offset.x)
        return self
    }
    @discardableResult
    func size(_ size: CGSize) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.setDimension(.height, offset: size.height)
        selfView.layoutProxy.setDimension(.width, offset: size.width)
        return self
    }
    @discardableResult
    func width(_ value: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.setDimension(.width, offset: value)
        return self
    }
    @discardableResult
    func height(_ value: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.setDimension(.height, offset: value)
        return self
    }
    @discardableResult
    func all(_ edge: UIEdgeInsets, _ except: [NSLayoutConstraint.Attribute] = []) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        
        if except.count == 0 {
            selfView.layoutProxy.sideToSide(.top, toView: selfView.superview, toSide: .top, offset: edge.top)
            selfView.layoutProxy.sideToSide(.bottom, toView: selfView.superview, toSide: .bottom, offset: edge.bottom)
            selfView.layoutProxy.sideToSide(.left, toView: selfView.superview, toSide: .left, offset: edge.left)
            selfView.layoutProxy.sideToSide(.right, toView: selfView.superview, toSide: .right, offset: edge.right)
        } else {
            if !except.contains(.top) {
                selfView.layoutProxy.sideToSide(.top, toView: selfView.superview, toSide: .top, offset: edge.top)
            }
            if !except.contains(.bottom) {
                selfView.layoutProxy.sideToSide(.bottom, toView: selfView.superview, toSide: .bottom, offset: edge.bottom)
            }
            if !except.contains(.left) {
                selfView.layoutProxy.sideToSide(.left, toView: selfView.superview, toSide: .left, offset: edge.left)
            }
            if !except.contains(.right) {
                selfView.layoutProxy.sideToSide(.right, toView: selfView.superview, toSide: .right, offset: edge.right)
            }
        }
        return self
    }
    @discardableResult
    func topToLast(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        guard let previousView = selfView.superview?.beforeLastSubview else {
            selfView.layoutProxy.sideToSide(.top, toView: selfView.superview, toSide: .top, offset: offset)
            return self
        }
        selfView.layoutProxy.sideToSide(.top, toView: previousView, toSide: .bottom, offset: offset)
        return self
    }
    @discardableResult
    func topToSuperview(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.top, toView: selfView.superview, toSide: .top, offset: offset)
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func topSafeLayout(_ controller: UIViewController, offset: CGFloat) -> Self {
        (self as! UIView).layoutProxy.toTopSafeLayout(controller, offset: offset)
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func bottomSafeLayout(_ controller: UIViewController, offset: CGFloat) -> Self {
        (self as! UIView).layoutProxy.toBottomSafeLayout(controller, offset: offset)
        return self
    }
    @discardableResult
    func topLayout(_ controller: UIViewController, offset: CGFloat) -> Self {
        (self as! UIView).layoutProxy.toTopLayout(controller, offset: offset)
        return self
    }
    @discardableResult
    func bottomLayout(_ controller: UIViewController, offset: CGFloat) -> Self {
        (self as! UIView).layoutProxy.toBottomLayout(controller, offset: offset)
        return self
    }
    @discardableResult
    func topToBottom(of view: UIView?, _ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.top, toView: view, toSide: .bottom, offset: offset)
        return self
    }
    @discardableResult
    func topToTop(of view: UIView?, _ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.top, toView: view, toSide: .top, offset: offset)
        return self
    }
    @discardableResult
    func bottomToSuperview(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.bottom, toView: selfView.superview, toSide: .bottom, offset: offset)
        return self
    }
    @discardableResult
    func bottomToTop(of view: UIView?, _ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.bottom, toView: view, toSide: .top, offset: offset)
        return self
    }
    @discardableResult
    func bottomToBottom(of view: UIView?, _ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.bottom, toView: view, toSide: .bottom, offset: offset)
        return self
    }
    @discardableResult
    func leftToSuperview(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.left, toView: selfView.superview, toSide: .left, offset: offset)
        return self
    }
    @discardableResult
    func leftToRight(of view: UIView?, _ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.left, toView: view, toSide: .right, offset: offset)
        return self
    }
    @discardableResult
    func leftToLeft(of view: UIView?, _ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.left, toView: view, toSide: .left, offset: offset)
        return self
    }
    @discardableResult
    func rightToSuperview(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.right, toView: selfView.superview, toSide: .right, offset: offset)
        return self
    }
    @discardableResult
    func rightToRight(of view: UIView?, _ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.right, toView: view, toSide: .right, offset: offset)
        return self
    }
    @discardableResult
    func rightToLeft(of view: UIView?, _ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.right, toView: view, toSide: .left, offset: offset)
        return self
    }
    @discardableResult
    func rightToLastLeft(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.right, toView: selfView.superview?.beforeLastSubview, toSide: .left, offset: offset)
        return self
    }
    @discardableResult
    func rightToLastRight(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.right, toView: selfView.superview?.beforeLastSubview, toSide: .right, offset: offset)
        return self
    }
    @discardableResult
    func leftToLastRight(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.left, toView: selfView.superview?.beforeLastSubview, toSide: .right, offset: offset)
        return self
    }
    @discardableResult
    func leftToLastLeft(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.left, toView: selfView.superview?.beforeLastSubview, toSide: .left, offset: offset)
        return self
    }
    @discardableResult
    func sidesToSuperview(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.left, toView: selfView.superview, toSide: .left, offset: offset)
        selfView.layoutProxy.sideToSide(.right, toView: selfView.superview, toSide: .right, offset: offset)
        return self
    }
    @discardableResult
    func topBottomToSuperview(_ offset: CGFloat) -> Self {
        guard let selfView = self as? UIView else { return self }
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.layoutProxy.sideToSide(.left, toView: selfView.superview, toSide: .left, offset: offset)
        selfView.layoutProxy.sideToSide(.right, toView: selfView.superview, toSide: .right, offset: offset)
        return self
    }
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        (self as! UIView).backgroundColor = color
        return self
    }
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        (self as! UIView).alpha = alpha
        return self
    }
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        (self as! UIView).cornerRadius = radius
        return self
    }
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        (self as! UIView).isHidden = isHidden
        return self
    }
    @discardableResult
    func isOpaque(_ isOpaque: Bool) -> Self {
        (self as! UIView).isOpaque = isOpaque
        return self
    }
    @discardableResult
    func clipsToBounds(_ clipsToBounds: Bool) -> Self {
        (self as! UIView).clipsToBounds = clipsToBounds
        return self
    }
    @discardableResult
    func center(_ center: CGPoint) -> Self {
        (self as! UIView).center = center
        return self
    }
    @discardableResult
    func accessibilityIdentifier(_ accessibilityIdentifier: String) -> Self {
        (self as! UIView).accessibilityIdentifier = accessibilityIdentifier
        return self
    }
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        (self as! UIView).isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    @discardableResult
    func borderColor(_ color: UIColor) -> Self {
        (self as! UIView).layerBorderColor = color
        return self
    }
    @discardableResult
    func borderWidth(_ width: CGFloat) -> Self {
        (self as! UIView).layerBorderWidth = width
        return self
    }
    @discardableResult
    func tintColor(_ tintColor: UIColor) -> Self {
        (self as! UIView).tintColor = tintColor
        return self
    }
    @discardableResult
    func tag(_ tag: Int) -> Self {
        (self as! UIView).tag = tag
        return self
    }
    @discardableResult
    func id(_ id: String) -> Self {
        (self as! UIView).id = id
        return self
    }
    @discardableResult
    func frame(_ frame: CGRect) -> Self {
        (self as! UIView).frame = frame
        return self
    }
    @discardableResult
    func sendToBack() -> Self {
        guard let superview = (self as! UIView).superview else { return self }
        superview.sendSubviewToBack((self as! UIView))
        return self
    }
    @discardableResult
    func bringToFront() -> Self {
        guard let superview = (self as! UIView).superview else { return self }
        superview.bringSubviewToFront((self as! UIView))
        return self
    }
    @discardableResult
    func addTopBorder(_ color: UIColor, _ height: CGFloat, _ insets: UIEdgeInsets = .zero) -> Self{
        let view = self as! UIView
        let border = UIView()
        view.setSubview(border)
            .topToSuperview(insets.top)
            .leftToSuperview(insets.left)
            .rightToSuperview(insets.right)
            .height(height)
            .backgroundColor(color)
        return self
    }
    @discardableResult
    func addBottomBorder(_ color: UIColor, _ height: CGFloat, _ insets: UIEdgeInsets = .zero) -> Self {
        let view = self as! UIView
        let border = UIView()
        view.setSubview(border)
            .bottomToSuperview(insets.bottom)
            .leftToSuperview(insets.left)
            .rightToSuperview(insets.right)
            .height(height)
            .backgroundColor(color)
        return self
    }
    func designSubviews(_ callback: (Self) -> Void) {
        callback(self)
    }
}
