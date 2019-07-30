import UIKit

extension UITextField: UITextFieldChaining { }
public protocol UITextFieldChaining {}
public extension UITextFieldChaining {
    @discardableResult
    func text(_ text: String) -> Self {
        (self as! UITextField).text = text
        return self
    }
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        (self as! UITextField).attributedText = attributedText
        return self
    }
    @discardableResult
    func font(_ font: UIFont) -> Self {
        (self as! UITextField).font = font
        return self
    }
    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        (self as! UITextField).textAlignment = textAlignment
        return self
    }
    @discardableResult
    func delegate(_ delegate: UITextFieldDelegate) -> Self {
        (self as! UITextField).delegate = delegate
        return self
    }
    @discardableResult
    func spellCheckingType(_ spellCheckingType: UITextSpellCheckingType) -> Self {
        (self as! UITextField).spellCheckingType = spellCheckingType
        return self
    }
    @discardableResult
    func keyboardType(_ keyboardType: UIKeyboardType) -> Self {
        (self as! UITextField).keyboardType = keyboardType
        return self
    }
    @discardableResult
    func autocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) -> Self {
        (self as! UITextField).autocapitalizationType = autocapitalizationType
        return self
    }
    @discardableResult
    func placeholder(_ placeholder: String) -> Self {
        (self as! UITextField).placeholder = placeholder
        return self
    }
    @discardableResult
    func autocorrectionType(_ autocorrectionType: UITextAutocorrectionType) -> Self {
        (self as! UITextField).autocorrectionType = autocorrectionType
        return self
    }
    @discardableResult
    func fontSize(_ fontSize: CGFloat) -> Self {
        (self as! UITextField).fontSize = fontSize
        return self
    }
}
