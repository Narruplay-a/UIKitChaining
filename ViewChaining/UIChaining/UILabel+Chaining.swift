import UIKit

extension UILabel: UILabelChaining { }
public protocol UILabelChaining { }
public extension UILabelChaining {
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        (self as! UILabel).attributedText = attributedText
        return self
    }
    @discardableResult
    func text(_ string: String) -> Self {
        (self as! UILabel).text = string
        return self
    }
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        (self as! UILabel).textColor = color
        return self
    }
    @discardableResult
    func numberOfLines(_ number: Int) -> Self {
        (self as! UILabel).numberOfLines = number
        return self
    }
    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        (self as! UILabel).textAlignment = alignment
        return self
    }
    @discardableResult
    func font(_ font: UIFont) -> Self {
        (self as! UILabel).font = font
        return self
    }
    @discardableResult
    func fontSize(_ fontSize: CGFloat) -> Self {
        (self as! UILabel).fontSize = fontSize
        return self
    }
}
