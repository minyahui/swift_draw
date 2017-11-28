//
//  String+MYHExtension.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/23.
//  Copyright © 2017年 MYH. All rights reserved.
//

import Foundation
import SwiftyJSON
extension String {
    var length : Int{
        get{
            return (self as NSString).length
        }
    }
    
    /// 将一定格式的字符串转换成（类似这样： XXXX年XX月XX日---》XXXX-XX-XX）
    ///
    /// - Parameters:
    ///   - formatter: 旧的时间的格式
    ///   - oldFormatter: 新的时间的格式
    /// - Returns: 新的时间字符串
    public func string(formatter : String,oldFormatter : String)->String{
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = oldFormatter
        inputFormatter.locale = Locale.init(identifier: "en_US")
        let inputDate = inputFormatter.date(from: self)
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = formatter
        if inputDate != nil {
            return dateformatter.string(from: inputDate!)
        }
        return ""
    }
    
    /// JSON字符串转字典
    ///
    /// - Returns: 字典
    func dictionary() -> [String : Any] {
        let jsonData:Data = self.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: [.mutableContainers,.mutableLeaves,.allowFragments])
        if dict != nil && ((dict as? [String : Any]) != nil) {
            return dict as! [String : Any]
        }
        return [String : Any]()
    }
    
    /// JSON字符串转数组
    ///
    /// - Returns: 数组
    func array() -> [Any] {
        let jsonData:Data = self.data(using: .utf8)!
        
        let arr = try? JSONSerialization.jsonObject(with: jsonData, options: [.mutableContainers,.mutableLeaves,.allowFragments])
        if arr != nil && ((arr as? [Any]) != nil) {
            return arr as! [Any]
        }
        return [Any]()
    }
    
    /// 验证是否是邮箱
    ///
    /// - Returns: 返回是否是邮箱
    func checkEmail() -> Bool {
        let regex = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$"
//        "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
//        "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: self)
        return isValid
    }
}
