import UIKit

public extension UILabel {
    private struct AssociatedKeys {
        static var fontSize: CGFloat = 0
    }
    
    var fontSize: CGFloat {
        get {
            return font.pointSize
        }
        set {
            font = UIFont(descriptor: font.fontDescriptor, size: newValue)
            objc_setAssociatedObject(self, &AssociatedKeys.fontSize, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }

    func requiredHeight(_ width: CGFloat) -> CGFloat {
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        
        if attributedText != nil{
            label.attributedText = attributedText
        }else{
            label.text = text
        }
        
        label.sizeToFit()
        
        return label.frame.height
    }
    
    func requiredWidth() -> CGFloat {
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: bounds.height))
        
        label.numberOfLines = numberOfLines
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.width
    }
}
