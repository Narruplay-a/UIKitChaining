//
//  DateExtension.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 19.06.2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

public extension Date {
    func string(with format: String) -> String {
        let dateFormatter = Foundation.DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
