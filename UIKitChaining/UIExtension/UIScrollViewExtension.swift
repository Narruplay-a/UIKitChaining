//
//  UIScrollViewExtension.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 24/12/2018.
//  Copyright © 2018 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

public enum UIScrollViewScrollPosition {
    case top //Try to make view visible in scroll view's bounds with priority to view's top border
    case bottom //Try to make view visible in scroll view's bounds with priority to view's bottom border
}

public extension UIScrollView {
    private struct AssociatedKeys {
        static var tempContentOffset: CGPoint = CGPoint(x: 0, y: 0)
        static var tempContentInsets: UIEdgeInsets = .zero
        static var contentAdjustOffset: CGFloat = 10
    }
    
    internal var contentAdjustOffset: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.contentAdjustOffset) as! CGFloat
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.contentAdjustOffset, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    internal var tempContentOffset: CGPoint {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.tempContentOffset) as! CGPoint
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.tempContentOffset, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    internal var tempContentInsets: UIEdgeInsets {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.tempContentInsets) as! UIEdgeInsets
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.tempContentInsets, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @objc internal func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        tempContentOffset = contentOffset
        if let textField = firstResponderSubview() {
            scroll(to: textField, contentView: self.subviews[0], scrollPosition: .bottom, offset: keyboardFrame.height + contentAdjustOffset)
        }
    }
    
    @objc internal func keyboardWillHide() {
        restoreOffset()
    }
    
    //Scroll view will scroll to first responder view is visible after keyboard is shown
    //Don't forget to call disableFirstResponderViewAdjustToKeyboardFrame() func to remove observers and avoid memory leaks (usually in scrollview's controller deinit)
    func enableFirstResponderViewAdjustToKeyboardFrame(with offset: CGFloat = 10) {
        contentAdjustOffset = offset
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func disableFirstResponderViewAdjustToKeyboardFrame() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //Scroll to bottom of scroll view's content
    func scrollToBottom() {
        contentOffset = CGPoint(x: 0, y: contentSize.height)
    }
    
    //Scroll to top of scroll view's content
    func scrollToTop() {
        contentOffset = CGPoint(x: 0, y: 0)
    }
    
    //Scroll to make visible any view (in scroll view's bounds) (method is similar to tableview's method scrollToRow(at: IndexPath, at: , animated: ))
    //If !forced, scrollview wont't scroll if target view is fully visible with offset
    //If affectContentInset, scrollview content insets will be modified to comply with chosen scroll position
    func scroll(to view: UIView, contentView: UIView, scrollPosition: UIScrollViewScrollPosition = .bottom, offset: CGFloat = 0, forced: Bool = true, affectContentInset: Bool = true) {
        switch scrollPosition {
            case .bottom:
                scrollToRectVisibleOnBottom(view, offset: offset, superview: contentView, forced: forced, affectContentInset: affectContentInset)
            case .top:
                scrollToRectVisibleOnTop(view, offset: offset, superview: contentView, forced: forced, affectContentInset: affectContentInset)
        }
    }
    
    fileprivate func scrollToRectVisibleOnTop(_ view: UIView, offset: CGFloat, superview: UIView? = nil, forced: Bool = true, affectContentInset: Bool = true) {
        guard view.superview != nil else { return }
        let topPointY: CGFloat = view.superview!.convert(view.frame.origin, to: superview).y
        let viewHeight: CGFloat = view.frame.height
        let scrollHeight: CGFloat = bounds.height
        
        tempContentOffset = contentOffset
        tempContentInsets = contentInset
        
        let contentDiff: CGFloat = contentSize.height - scrollHeight
        
        guard forced else {
            contentOffset = CGPoint(x: 0, y: topPointY - offset)
            return
        }
        
        if contentDiff > 0 {
            if contentDiff < viewHeight {
                contentInset = UIEdgeInsets(top: contentInset.top, left: contentInset.left, bottom: contentInset.bottom + (viewHeight + offset - contentDiff), right: contentInset.right)
            }
        } else {
            if -contentDiff < viewHeight {
                contentInset = UIEdgeInsets(top: contentInset.top, left: contentInset.left, bottom: contentInset.bottom + (viewHeight + offset + contentDiff), right: contentInset.right)
            } else {
                contentInset = UIEdgeInsets(top: contentInset.top, left: contentInset.left, bottom: contentInset.bottom + viewHeight + offset, right: contentInset.right)
            }
        }
        
        contentOffset = CGPoint(x: 0, y: topPointY - offset)
    }
    
    fileprivate func scrollToRectVisibleOnBottom(_ view: UIView, offset: CGFloat, superview: UIView? = nil, forced: Bool = true, affectContentInset: Bool = true) {
        guard view.superview != nil else { return }
        let bottomPointY: CGFloat = view.superview!.convert(view.frame.origin, to: superview).y + view.frame.size.height
        let scrollHeight: CGFloat = bounds.height
        
        tempContentOffset = contentOffset
        tempContentInsets = contentInset
        
        if !forced && bottomPointY < scrollHeight {
            return
        }
        
        if affectContentInset {
            if bottomPointY + offset < scrollHeight {
                contentInset = UIEdgeInsets(top: contentInset.top + (scrollHeight - bottomPointY - offset), left: contentInset.left, bottom: contentInset.bottom, right: contentInset.right)
            }
            contentOffset = CGPoint(x: 0, y: -scrollHeight + bottomPointY + offset)
        } else {
            contentOffset = CGPoint(x: 0, y: -bottomPointY - offset)
        }
    }
    
    //Restore content insets and content offset to values saved before scroll() function was called
    func restoreOffset() {
        contentOffset = tempContentOffset
        contentInset = tempContentInsets
    }
}

