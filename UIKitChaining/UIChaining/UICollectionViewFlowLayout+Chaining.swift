//
//  UICollectionViewFlowLayout+Chaining.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 22/03/2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

extension UICollectionViewFlowLayout: UICollectionViewFlowLayoutChaining { }
public protocol UICollectionViewFlowLayoutChaining { }
public extension UICollectionViewFlowLayoutChaining {
    @discardableResult
    func estimatedItemSize(_ estimatedItemSize: CGSize) -> Self {
        (self as! UICollectionViewFlowLayout).estimatedItemSize = estimatedItemSize
        return self
    }
    @discardableResult
    func scrollDirection(_ scrollDirection: UICollectionView.ScrollDirection) -> Self {
        (self as! UICollectionViewFlowLayout).scrollDirection = scrollDirection
        return self
    }
    @discardableResult
    func headerReferenceSize(_ headerReferenceSize: CGSize) -> Self {
        (self as! UICollectionViewFlowLayout).headerReferenceSize = headerReferenceSize
        return self
    }
    @discardableResult
    func footerReferenceSize(_ footerReferenceSize: CGSize) -> Self {
        (self as! UICollectionViewFlowLayout).footerReferenceSize = footerReferenceSize
        return self
    }
}
