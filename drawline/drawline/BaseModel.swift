//
//  BaseModel.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/25.
//  Copyright © 2017年 MYH. All rights reserved.
//

import UIKit
import HandyJSON

class BaseModel: NSObject,NSCoding,HandyJSON {
    
    /// 归档
    func archiverWithRootObject(_ filePath : String){
        let systemFilePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let savePath = systemFilePath + "/" + filePath + ".plist"
        NSKeyedArchiver.archiveRootObject(self, toFile:savePath)
    }
    /// 解档出来的元素
    class func unarchiver(_ filePath : String)->Any?{
        let systemFilePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let savePath = systemFilePath + "/" + filePath + ".plist"
        return NSKeyedUnarchiver.unarchiveObject(withFile: savePath)
    }
    
    required override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //先初始化
        super.init()
        //获取当前类的所有属性名
        let nameList = getPropertyNameList()
        //进行解档
        for key in nameList{
            //从aDecoder中取值
            let value = aDecoder.decodeObject(forKey: key)
            //赋值给自己
            setValue(value, forKey: key)
        }
    }
    
    func encode(with aCoder: NSCoder) {
        //获取当前类的所有属性名
        let nameList = getPropertyNameList()
        //进行归档
        for key in nameList{
            //KVC取值
            if let value = value(forKey: key){
                ////归档.此处注意归档的方法中要使用带 forKey参数的
                aCoder.encode(value, forKey: key)
            }
        }
    }
    /// 利用运行时解档文件
    private func getPropertyNameList () -> [String]{
        //保存属性的个数
        var outCount : UInt32 = 0
        //保存属性名称的数组
        var list : [String] = []
        //获取属性集合
        let property = class_copyPropertyList(type(of:self), &outCount)
        //解包
        guard let propertyList = property else {
            return list
        }
        for i in 0 ..< Int(outCount){
            //取出单个属性
            let property = propertyList[i]
            //获取属性的名字
//            guard let char_f = property_getName(property) else{
//                continue
//            }
            let char_f = property_getName(property)
            //转换为String
            if let key = NSString(cString: char_f, encoding: String.Encoding.utf8.rawValue) as String? {
                //添加到数组
                list.append(key)
            }
        }
        return list
    }
    /// 防止未完全赋值导致崩溃
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}

