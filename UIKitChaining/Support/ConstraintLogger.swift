//
//  ConstraintLogger.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 19/03/2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

class ConstraintLogger {
    static var enableLogging: Bool = false
    
    static func logError(_ mainView: UIView, attribute: NSLayoutConstraint.Attribute) {
        guard enableLogging else { return }
        print(String(format: "CONSTRAINT SETTING ERROR: from %@ attribute: %@. Nil target view", mainView, attribute as! CVarArg))
    }
    
    static func logSuperviewError(_ mainView: UIView) {
        guard enableLogging else { return }
        print(String(format: "CONSTRAINT SETTING ERROR: %@ doesn't have superview", mainView))
    }
}
