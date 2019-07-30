//
//  UICollectionViewCell+Chaining.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 22/03/2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

extension UICollectionViewCell: UICollectionViewCellChaining { }
public protocol UICollectionViewCellChaining { }
public extension UICollectionViewCellChaining {
    @discardableResult
    func isSelected(_ isSelected: Bool) -> Self {
        (self as! UICollectionViewCell).isSelected = isSelected
        return self
    }
}
