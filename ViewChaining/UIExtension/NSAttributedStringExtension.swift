//
//  NSAttributedStringExtension.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 22/03/2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

public extension NSMutableAttributedString {
    func addImageToEnd(_ image: UIImage?, size: CGSize, tintColor: UIColor? = nil) {
        guard var image = image else { return }
        let attachment: NSTextAttachment = NSTextAttachment()
        if let color = tintColor {
            image = image.tint(with: color)
        }
        attachment.image = image
        attachment.bounds = CGRect(origin: CGPoint(x: 0, y: -(size.height / 4)), size: size)
        append(NSAttributedString(string: "\u{00A0}\u{00A0}"))
        append(NSAttributedString(attachment: attachment))
    }
    
    func addImageToStart(_ image: UIImage?, size: CGSize, tintColor: UIColor? = nil) {
        guard var image = image else { return }
        let attachment: NSTextAttachment = NSTextAttachment()
        if let color = tintColor {
            image = image.tint(with: color)
        }
        attachment.image = image
        attachment.bounds = CGRect(origin: CGPoint(x: 0, y: -(size.height / 4)), size: size)
        
        let tempString: NSMutableAttributedString = self
        replaceCharacters(in: NSRange(location: 0, length: length), with: NSAttributedString(string: ""))
        
        append(NSMutableAttributedString(attachment: attachment))
        append(NSAttributedString(string: "\u{00A0}\u{00A0}"))
        append(tempString)
    }
    
    static func createBulletList(_ stringList: [String],
                                 font: UIFont,
                                 bullet: String = "\u{2022}",
                                 indentation: CGFloat = 20,
                                 lineSpacing: CGFloat = 2,
                                 paragraphSpacing: CGFloat = 3,
                                 textColor: UIColor = .black,
                                 bulletColor: UIColor = .black) -> NSMutableAttributedString {
        
        let textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor]
        let bulletAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: bulletColor]
        
        let paragraphStyle = NSMutableParagraphStyle()
        let nonOptions = [NSTextTab.OptionKey: Any]()
        paragraphStyle.tabStops = [
            NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
        paragraphStyle.defaultTabInterval = indentation
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.headIndent = indentation
        
        let bulletList = NSMutableAttributedString()
        for i in 0..<stringList.count {
            var formattedString = "\(bullet)\t\(stringList[i])\n"
            if i == stringList.count - 1 {
                formattedString.removeLast()
            }
            let attributedString = NSMutableAttributedString(string: formattedString)
            
            attributedString.addAttributes(
                [NSAttributedString.Key.paragraphStyle : paragraphStyle],
                range: NSMakeRange(0, attributedString.length))
            
            attributedString.addAttributes(
                textAttributes,
                range: NSMakeRange(0, attributedString.length))
            
            let string:NSString = NSString(string: formattedString)
            let rangeForBullet:NSRange = string.range(of: bullet)
            attributedString.addAttributes(bulletAttributes, range: rangeForBullet)
            bulletList.append(attributedString)
        }
        
        return bulletList
    }
}

