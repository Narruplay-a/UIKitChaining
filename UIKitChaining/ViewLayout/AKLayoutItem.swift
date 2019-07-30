//
//  AKLayoutItem.swift
//  UIKitChaining
//
//  Created by Adel Khaziakhmetov on 31.07.2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

class AKLayoutItem {
    var view: UIView
    
    init(_ view: UIView) {
        self.view = view
    }
}

class AKSizeLayoutItem: AKLayoutItem {
    func equalTo(_ item: AKSizeLayoutItem) -> AKSettedLayoutItem {
        let consts = [view.alignDimension(.height, toView: item.view, multiplier: 1, offset: 0),
                      view.alignDimension(.width, toView: item.view, multiplier: 1, offset: 0)]
        return AKSettedLayoutItem(view, constraints: consts)
    }
    
    func equalTo(_ size: CGFloat) {
        view.setDimension(.height, offset: size)
        view.setDimension(.width, offset: size)
    }
}

class AKEdgeLayoutItem: AKLayoutItem {
    
}

class AKVerticalLayoutItem: AKLayoutItem {
    
}

class AKHorizontalLayoutItem: AKLayoutItem {
    
}

class AKDimensionLayoutItem: AKLayoutItem { }

class AKHeightLayoutItem: AKDimensionLayoutItem {
    func equalTo(_ item: AKDimensionLayoutItem) -> AKSettedLayoutItem {
        let consts = [view.alignDimension(.height, toView: item.view, multiplier: 1, offset: 0)]
        return AKSettedLayoutItem(view, constraints: consts)
    }
    
    func equalTo(_ size: CGFloat) {
        view.setDimension(.height, offset: size)
    }
}

class AKWidthLayoutItem: AKDimensionLayoutItem {
    func equalTo(_ item: AKDimensionLayoutItem) -> AKSettedLayoutItem {
        let consts = [view.alignDimension(.width, toView: item.view, multiplier: 1, offset: 0)]
        return AKSettedLayoutItem(view, constraints: consts)
    }
    
    func equalTo(_ size: CGFloat) {
        view.setDimension(.width, offset: size)
    }
}

class AKEdgesLayoutItem: AKLayoutItem {
    
}

class AKSettedLayoutItem: AKLayoutItem {
    var constraints: [NSLayoutConstraint?]
    
    init(_ view: UIView, constraints: [NSLayoutConstraint?]) {
        self.constraints = constraints
        super.init(view)
    }
    
    func withOffset(_ offset: CGFloat) -> AKSettedLayoutItem {
        view.updateConstraints(constraints, offset: offset, multiplier: nil, relation: nil)
        return self
    }
    
    func withMultiplier(_ multiplier: CGFloat) -> AKSettedLayoutItem {
        view.updateConstraints(constraints, offset: nil, multiplier: multiplier, relation: nil)
        return self
    }
}
