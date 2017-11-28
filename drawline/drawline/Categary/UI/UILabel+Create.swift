//
//  UILabel+Create.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/25.
//  Copyright © 2017年 MYH. All rights reserved.
//

import UIKit
extension UILabel {
    convenience init(frame: CGRect,backGroundColor: UIColor?,textAlignment: NSTextAlignment,font: UIFont?,textColor: UIColor?,text: String?) {
        self.init(frame: frame)
        self.textAlignment = textAlignment
        self.backgroundColor = backgroundColor
        self.font = font
        self.textColor = textColor
        self.text = text
    }
    
    convenience init(frame: CGRect,center: CGPoint,backGroundColor: UIColor?,textAlignment: NSTextAlignment,font: UIFont?,textColor: UIColor?,text: String?) {
        self.init(frame: frame)
        self.center = center
        self.textAlignment = textAlignment
        self.backgroundColor = backgroundColor
        self.font = font
        self.textColor = textColor
        self.text = text
    }
    /// MARK 设置环绕的颜色
    func roundColor(roundColor: UIColor,textColor: UIColor,text: String) {
        let textDict = [NSAttributedStringKey.foregroundColor:textColor,
                        NSAttributedStringKey.font:self.font,
                        NSAttributedStringKey.strokeWidth:-3,
                        NSAttributedStringKey.strokeColor:roundColor] as [NSAttributedStringKey : Any]
        let strArr = NSAttributedString.init(string: text, attributes: textDict)
        self.attributedText = strArr
        
    }
}
