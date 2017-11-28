//
//  UIFont+MYHExtension.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/31.
//  Copyright © 2017年 MYH. All rights reserved.
//

import UIKit
extension UIFont {
    open class func odev_systemFont(ofSize fontSize: CGFloat) -> UIFont{
//        if LanguageHelper.isChinese() {
//            if let font = UIFont.init(name: "Avenir-Black", size: fontSize) {
//                return font
//            }
//        } else {
//            if let font = UIFont.init(name: "AvenirNextCondensed-Heavy", size: fontSize) {
//                return font
//            }
//        }
        return UIFont.systemFont(ofSize: fontSize)
    }
    
    
    
    open class func odev_boldSystemFont(ofSize fontSize: CGFloat) -> UIFont{
//        if LanguageHelper.isChinese() {
//            if let font = UIFont.init(name: "Avenir-Black", size: fontSize) {
//                return font
//            }
//        } else {
//            if let font = UIFont.init(name: "AvenirNextCondensed-Heavy", size: fontSize) {
//                return font
//            }
//        }
        return UIFont.boldSystemFont(ofSize: fontSize)
    }

}
