//
//  SupportClasses.swift
//  UIKitChaining
//
//  Created by Adel Khaziakhmetov on 26.06.2020.
//  Copyright © 2020 Uznat Shtrafy.ru. All rights reserved.
//

internal class TouchAction {
    private var touchAction: () -> Void = { }
    
    public init(_ callback: @escaping ()-> Void) {
        touchAction = callback
    }
    
    func proceedAction() {
        touchAction()
    }
}
