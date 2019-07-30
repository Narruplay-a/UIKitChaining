//
//  StringExtension.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 19.06.2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

public extension String {
    static let strings: [String: [String]] = [:]
    
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    func getFirstLetter(_ capitalized: Bool = false) -> String {
        guard let letter = first else { return "" }
        if capitalized {
            return String(letter).uppercased()
        } else {
            return String(letter)
        }
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    static func plurarizedString(_ string: String, count: Int)-> String{
        guard let strings = strings[string], strings.count == 3 else { return "" }
        if count % 10 == 1 && count != 11{
            return strings[0]
        }else{
            if (count % 10 == 2 || count % 10 == 3 || count % 10 == 4) && (count < 10 || count > 15) {
                return strings[1]
            }else{
                return strings[2]
            }
        }
    }
    
    static func local(_ key: String, values: [String: String] = [:])-> String {
        var rawString = NSLocalizedString(key, comment: "")
        for (k, v) in values {
            rawString = rawString.replacingOccurrences(of: "#{\(k)}", with: v)
        }
        return rawString
    }
    
    func getWord(_ index: Int, separator: String = " ")-> String? {
        var array: [String] = self.components(separatedBy: separator)
        guard index < array.count else { return nil }
        return array[index]
    }

    func date(with format: String) -> Date? {
        let dateFormatter = Foundation.DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: self)
    }
}
