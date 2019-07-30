//
//  UITextFieldExtension.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 19.06.2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

public extension UITextField {
    private struct AssociatedKeys {
        static var fontSize: CGFloat = 0
    }

    var fontSize: CGFloat {
        get {
            return font?.pointSize ?? 12.0
        }
        set {
            if let font = font {
                self.font = UIFont(descriptor: font.fontDescriptor, size: newValue)
            }
            font = UIFont.systemFont(ofSize: newValue)
            objc_setAssociatedObject(self, &AssociatedKeys.fontSize, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}
