import UIKit

extension UIImageView: UIImageViewChaining { }
public protocol UIImageViewChaining { }
public extension UIImageViewChaining {
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        (self as! UIImageView).image = image
        return self
    }
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        (self as! UIImageView).contentMode = mode
        return self
    }
    @discardableResult
    func animationDuration(_ animationDuration: TimeInterval) -> Self {
        (self as! UIImageView).animationDuration = animationDuration
        return self
    }
    @discardableResult
    func animationImages(_ animationImages: [UIImage]) -> Self {
        (self as! UIImageView).animationImages = animationImages
        return self
    }
    @discardableResult
    func animationRepeatCount(_ animationRepeatCount: Int) -> Self {
        (self as! UIImageView).animationRepeatCount = animationRepeatCount
        return self
    }
    @discardableResult
    func highlightedImage(_ highlightedImage: UIImage) -> Self {
        (self as! UIImageView).highlightedImage = highlightedImage
        return self
    }
}

