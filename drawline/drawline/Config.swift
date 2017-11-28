//
//  Config.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/25.
//  Copyright © 2017年 MYH. All rights reserved.
//

import Foundation
import UIKit

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let kUserDefaults = UserDefaults.standard
let Adapt_w = (kScreenWidth/750.0)
let Adapt_h = (kScreenHeight/1334.0)
let kAppdelegate = UIApplication.shared.delegate as? AppDelegate
let kProduct = false


/// MARK 文件加载的方式，耗CPU，但是会释放
func ImageNamed(imageName: String) -> UIImage? {
    return UIImage.init(named: imageName)
}
/// MARK 文件加载的方式，节省CPU，但是不会释放
func ImageFileNamed(imageName: String) -> UIImage? {
    if let path = Bundle.main.path(forResource: imageName, ofType: "png") {
        return UIImage.init(contentsOfFile: path)
    }
    return nil
}
//封装的日志输出功能（T表示不指定日志信息参数类型）
//func DeBugLog<T>(_ message:T) {
//    #if DEBUG
//        print("[\(Date().string(formatter: "YYYY年MM月DD日HH:mm:ss.SSS"))].\((#file as NSString).lastPathComponent).\(#line) | \(message)")
//    #endif
//}
func DeBugLog(_ items: Any...) {
    #if DEBUG
        print("[\(Date().string(formatter: "YYYY年MM月DD日HH:mm:ss.SSS"))].\((#file as NSString).lastPathComponent).\(#line) | \(items)")
    #endif
}
// 精简的输出
//func DeBugLogJJ<T>(_ message:T) {
//    #if DEBUG
//        print("[\(Date().string(formatter: "YYYY年MM月DD日HH:mm:ss.SSS"))] | \(message)")
//    #endif
//}
func DeBugLogJJ(_ items: Any...) {
    #if DEBUG
        print("[\(Date().string(formatter: "YYYY年MM月DD日HH:mm:ss.SSS"))] | \(items)")
    #endif
}

// 只输出方法
func DeBugLogFunc(file:String = #file, function:String = #function,
                  line:Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("[\(Date().string(formatter: "YYYY年MM月DD日HH:mm:ss.SSS"))].\(fileName).\(line) : \(function)")
    #endif
}
// 输出方法加一些基本信息
func DeBugLogFunc(_ items: Any...) {
    #if DEBUG
        print("[\(Date().string(formatter: "YYYY年MM月DD日HH:mm:ss.SSS"))].\((#file as NSString).lastPathComponent).\(#line) : \(#function) | \(items)")
    #endif
}
//func DeBugLogFunc<T>(_ message:T) {
//    #if DEBUG
//        print("[\(Date().string(formatter: "YYYY年MM月DD日HH:mm:ss.SSS"))].\((#file as NSString).lastPathComponent).\(#line) : \(#function) | \(message)")
//    #endif
//}
