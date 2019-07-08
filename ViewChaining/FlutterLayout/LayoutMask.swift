//
//  LayoutMask.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 13.06.2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

extension Array where Element: NSObject {
    func removeObject(_ object: NSObject) -> [NSObject] {
        var returnArray = self
        returnArray.removeAll { element -> Bool in
            return element == object
        }
        return returnArray
    }
}

extension NSObject {
    private struct AssociatedKeys {
        static var linkedObjects: [NSObject] = []
    }
    
    var listOfProperties: [String] {
        get {
            return Mirror(reflecting: self).children.flatMap { $0.label }
        }
    }
    
    private var linkedObjects: [NSObject] {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.linkedObjects) as! [NSObject]
        }
        set {
            for object in linkedObjects {
                object.linkedObjects = linkedObjects.removeObject(object)
            }
            objc_setAssociatedObject(self, &AssociatedKeys.linkedObjects, newValue.removeObject(self), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func updateLinkedValue(path: String, value: Any?, linkedValue: Any?) {
        guard hasValue(for: path) else { return }
        setValue(value, forKey: path)
        for object in linkedObjects {
            if hasValue(for: path) {
                object.setValue(linkedValue, forKey: path)
            }
        }
    }
    
    func linkObjects(with objects: [NSObject]) {
        linkedObjects = objects
    }
    
    func hasValue(for keyPath: String) -> Bool {
        if listOfProperties.contains(keyPath) {
            return true
        }
        return false
    }
    
    func setValue(_ value: Any?, forKey: String, isSave: Bool) {
        if isSave {
            if hasValue(for: forKey) {
                setValue(value, forKey: forKey)
            } else {
                print("Class \(self.classForCoder) property for key \(forKey) doesn't exist")
            }
        } else {
            setValue(value, forKey: forKey)
        }
    }
    
    func setValue(_ value: NSObject?, for objects: [NSObject?], keyPath: String) {
        for object in objects {
            if let object = object, object.hasValue(for: keyPath) {
                object.setValue(value, forKey: keyPath)
            }
        }
    }
}

