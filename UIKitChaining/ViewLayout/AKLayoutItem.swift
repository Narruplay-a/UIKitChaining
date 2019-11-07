////
////  AKLayoutItem.swift
////  UIKitChaining
////
////  Created by Adel Khaziakhmetov on 31.07.2019.
////  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
////
//
//import UIKit
//
//class AKLayoutItem {
//    var view: UIView
//
//    init(_ view: UIView) {
//        self.view = view
//    }
//}
//
//class AKSizeLayoutItem: AKLayoutItem {
//    func equalTo(_ item: AKSizeLayoutItem) -> AKSettedLayoutItem {
//        let consts = [view.layoutProxy.alignDimension(.height, toView: item.view, multiplier: 1, offset: 0),
//                      view.layoutProxy.alignDimension(.width, toView: item.view, multiplier: 1, offset: 0)]
//        return AKSettedLayoutItem(view, constraints: consts)
//    }
//
//    func equalTo(_ size: CGFloat) {
//        view.layoutProxy.setDimension(.height, offset: size)
//        view.layoutProxy.setDimension(.width, offset: size)
//    }
//}
//
//class AKEdgeLayoutItem: AKLayoutItem {
//    var attribute: NSLayoutConstraint.Attribute
//    func equalTo(_ item: AKEdgeLayoutItem) -> AKSettedLayoutItem {
//        let const = view.layoutProxy.sideToSide(<#T##side: NSLayoutConstraint.Attribute##NSLayoutConstraint.Attribute#>, toView: <#T##UIView?#>, toSide: <#T##NSLayoutConstraint.Attribute#>, offset: <#T##CGFloat#>)
//        return AKSettedLayoutItem(view, constraints: [const])
//    }
//
//    func greaterThan(_ item: AKEdgeLayoutItem) -> AKSettedLayoutItem {
//        
//    }
//
//    func lessThan(_ item: AKEdgeLayoutItem) -> AKSettedLayoutItem {
//
//    }
//}
//
//class AKAlignLayoutItem: AKLayoutItem { }
//
//class AKVerticalLayoutItem: AKAlignLayoutItem {
//    func equalTo(_ item: AKAlignLayoutItem) -> AKSettedLayoutItem {
//        let const = view.layoutProxy.alignVertical(item.view, offset: 0)
//        return AKSettedLayoutItem(view, constraints: [const])
//    }
//
//    func greaterThan(_ item: AKAlignLayoutItem) -> AKSettedLayoutItem {
//        let const = view.layoutProxy.alignVertical(item.view, offset: 0, relation: .greaterThanOrEqual)
//        return AKSettedLayoutItem(view, constraints: [const])
//    }
//
//    func lessThan(_ item: AKAlignLayoutItem) -> AKSettedLayoutItem {
//        let const = view.layoutProxy.alignVertical(item.view, offset: 0, relation: .lessThanOrEqual)
//        return AKSettedLayoutItem(view, constraints: [const])
//    }
//}
//
//class AKHorizontalLayoutItem: AKAlignLayoutItem {
//    func equalTo(_ item: AKAlignLayoutItem) -> AKSettedLayoutItem {
//        let const = view.layoutProxy.alignHorizontal(item.view, offset: 0)
//        return AKSettedLayoutItem(view, constraints: [const])
//    }
//
//    func greaterThan(_ item: AKAlignLayoutItem) -> AKSettedLayoutItem {
//        let const = view.layoutProxy.alignHorizontal(item.view, offset: 0, relation: .greaterThanOrEqual)
//        return AKSettedLayoutItem(view, constraints: [const])
//    }
//
//    func lessThan(_ item: AKAlignLayoutItem) -> AKSettedLayoutItem {
//        let const = view.layoutProxy.alignHorizontal(item.view, offset: 0, relation: .lessThanOrEqual)
//        return AKSettedLayoutItem(view, constraints: [const])
//    }
//}
//
//class AKDimensionLayoutItem: AKLayoutItem { }
//
//class AKHeightLayoutItem: AKDimensionLayoutItem {
//    func equalTo(_ item: AKDimensionLayoutItem) -> AKSettedLayoutItem {
//        let consts = [view.layoutProxy.alignDimension(.height, toView: item.view, multiplier: 1, offset: 0)]
//        return AKSettedLayoutItem(view, constraints: consts)
//    }
//
//    func equalTo(_ size: CGFloat) {
//        view.layoutProxy.setDimension(.height, offset: size)
//    }
//}
//
//class AKWidthLayoutItem: AKDimensionLayoutItem {
//    func equalTo(_ item: AKDimensionLayoutItem) -> AKSettedLayoutItem {
//        let consts = [view.layoutProxy.alignDimension(.width, toView: item.view, multiplier: 1, offset: 0)]
//        return AKSettedLayoutItem(view, constraints: consts)
//    }
//
//    func equalTo(_ size: CGFloat) {
//        view.layoutProxy.setDimension(.width, offset: size)
//    }
//}
//
//class AKEdgesLayoutItem: AKLayoutItem {
//    func withMargin(_ insets: UIEdgeInsets) {
//        view.all(insets)
//    }
//
//    func withMargin(_ insets: UIEdgeInsets, except: [NSLayoutConstraint.Attribute]) {
//        view.all(insets, except)
//    }
//
//    func withOffset(_ offset: CGFloat) {
//        view.all(UIEdgeInsets(top: offset, left: offset, bottom: offset, right: offset))
//    }
//}
//
//class AKSettedLayoutItem: AKLayoutItem {
//    var constraints: [NSLayoutConstraint?]
//
//    init(_ view: UIView, constraints: [NSLayoutConstraint?]) {
//        self.constraints = constraints
//        super.init(view)
//    }
//
//    func withOffset(_ offset: CGFloat) -> AKSettedLayoutItem {
//        view.updateConstraints(constraints, offset: offset, multiplier: nil, relation: nil)
//        return self
//    }
//
//    func withMultiplier(_ multiplier: CGFloat) -> AKSettedLayoutItem {
//        view.updateConstraints(constraints, offset: nil, multiplier: multiplier, relation: nil)
//        return self
//    }
//}
