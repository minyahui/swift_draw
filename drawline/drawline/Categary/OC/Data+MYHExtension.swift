//
//  Data+MYHExtension.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/24.
//  Copyright © 2017年 MYH. All rights reserved.
//

import Foundation
extension Data {
    /// JSONData转字典
    ///
    /// - Returns: 字典
    func dictionary() -> [String : Any] {
        let dict = try? JSONSerialization.jsonObject(with: self, options: [.mutableContainers,.mutableLeaves,.allowFragments])
        if dict != nil {
            return dict as! [String : Any]
        }
        return [String : Any]()
    }
}
