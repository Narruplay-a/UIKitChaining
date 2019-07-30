import UIKit

extension UISwitch: UISwitchChaining { }
public protocol UISwitchChaining { }
public extension UISwitchChaining {
    @discardableResult
    func isOn(_ isOn: Bool) -> Self {
        (self as! UISwitch).isOn = isOn
        return self
    }
    @discardableResult
    func thumbTintColor(_ thumbTintColor: UIColor) -> Self {
        (self as! UISwitch).thumbTintColor = thumbTintColor
        return self
    }
    @discardableResult
    func onTintColor(_ color: UIColor) -> Self {
        (self as! UISwitch).onTintColor = color
        return self
    }
    @discardableResult
    func onValueChanged(_ onValueChange: @escaping (Bool) -> Void) -> Self {
        (self as! UISwitch).addTarget(nil, action: #selector(UISwitch.valueChangeProceed), for: .touchUpInside)
        (self as! UISwitch).onValueChange = UISwitchChangeAction(onValueChange)
        return self
    }
}
