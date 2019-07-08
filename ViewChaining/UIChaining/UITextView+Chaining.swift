import UIKit

extension UITextView: UITextViewChaining { }
public protocol UITextViewChaining { }
public extension UITextViewChaining {
    @discardableResult
    func text(_ text: String) -> Self {
        (self as! UITextView).text = text
        return self
    }
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        (self as! UITextView).attributedText = attributedText
        return self
    }
    @discardableResult
    func font(_ font: UIFont) -> Self {
        (self as! UITextView).font = font
        return self
    }
    @discardableResult
    func isEditable(_ isEditable: Bool) -> Self {
        (self as! UITextView).isEditable = isEditable
        return self
    }
    @discardableResult
    func isSelectable(_ isSelectable: Bool) -> Self {
        (self as! UITextView).isSelectable = isSelectable
        return self
    }
    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        (self as! UITextView).textAlignment = textAlignment
        return self
    }
    @discardableResult
    func delegate(_ delegate: UITextViewDelegate) -> Self {
        (self as! UITextView).delegate = delegate
        return self
    }
}
