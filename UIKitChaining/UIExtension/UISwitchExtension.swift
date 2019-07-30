//
//  UISwitchExtension.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 21/12/2018.
//  Copyright © 2018 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

internal class UISwitchChangeAction {
    var action: (Bool) -> Void = { _ in }
    
    init(_ action: @escaping (Bool) -> Void) {
        self.action = action
    }
}

public extension UISwitch {
    struct AssociatedKeys {
        static var onValueChange: UISwitchChangeAction = UISwitchChangeAction({_ in })
    }
    internal var onValueChange: UISwitchChangeAction {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.onValueChange) as! UISwitchChangeAction
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.onValueChange, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    @objc internal func valueChangeProceed() {
        onValueChange.action(isOn)
    }
}
