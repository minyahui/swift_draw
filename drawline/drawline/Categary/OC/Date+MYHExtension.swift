//
//  Date+MYHExtension.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/23.
//  Copyright © 2017年 MYH. All rights reserved.
//

import Foundation
extension Date {
    
    /// 将时间转换成一定格式的字符串
    ///
    /// - Parameter formatter: 格式
    /// - Returns: 要转的字符串
    public func string(formatter : String)->String{
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = formatter
        return dateformatter.string(from: self)
    }
    
}
