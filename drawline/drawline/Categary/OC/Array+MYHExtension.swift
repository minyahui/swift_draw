//
//  Array+MYHExtension.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/24.
//  Copyright © 2017年 MYH. All rights reserved.
//

import Foundation
extension Array {
    /// 数组转JSON
    ///
    /// - Returns: 字符串
    func string() -> String {
        if (!JSONSerialization.isValidJSONObject(self)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: self, options: []) as NSData!
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
}
