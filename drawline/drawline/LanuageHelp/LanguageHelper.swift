//
//  LanguageHelper.swift
//  OdevMBlocklySwift
//
//  Created by MYH on 2017/7/27.
//  Copyright © 2017年 MYH. All rights reserved.
//

import UIKit
private var bundle : Bundle?
class LanguageHelper: NSObject {
//    open override class func initialize(){
//        var current = ""
//        if kUserDefaults.object(forKey: "userLanguage") != nil {
//            current = kUserDefaults.object(forKey: "userLanguage") as! String
//        } else if (LanguageHelper.getCurrentLanguage().range(of: "en") != nil){
//            current = "en"
//        } else if (LanguageHelper.getCurrentLanguage().range(of: "zh") != nil){
//            current = "zh"
//        } else {
//            current = "en"
//        }
//        self.setLanguage(lan: current)
//    }
    override init() {
        super.init()
        var current = ""
        if kUserDefaults.object(forKey: "userLanguage") != nil {
            current = kUserDefaults.object(forKey: "userLanguage") as! String
        } else if (LanguageHelper.getCurrentLanguage().range(of: "en") != nil){
            current = "en"
        } else if (LanguageHelper.getCurrentLanguage().range(of: "zh") != nil){
            current = "zh"
        } else {
            current = "en"
        }
        
        self.setLanguage(lan: current)
    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    public class func isChinese() -> Bool{
        var current = ""
        
        if kUserDefaults.object(forKey: "userLanguage") != nil {
            current = kUserDefaults.object(forKey: "userLanguage") as! String
        } else if (LanguageHelper.getCurrentLanguage().range(of: "en") != nil){
            current = "en"
        } else if (LanguageHelper.getCurrentLanguage().range(of: "zh") != nil){
            current = "zh"
        } else {
            current = "en"
        }
        if current == "zh" {
            return true
        }
        return false
    }
    public class func get(key : String) -> String{
        return LanguageHelper.get(key: key, alternate: nil)
    }
    public class func get(key : String,alternate : String?) -> String{
//        open func localizedString(forKey key: String, value: String?, table tableName: String?) -> String
        return bundle!.localizedString(forKey: key, value: alternate,table: nil)
    }
    private class func getCurrentLanguage() -> String {
        let arr = NSLocale.preferredLanguages
        return arr[0]
    }
    
    private func setLanguage(lan : String){
        let path = Bundle.main.path(forResource: lan, ofType: "lproj")
        if path == nil {
            return;
        }
        kUserDefaults.set(lan, forKey: "userLanguage")
        kUserDefaults.synchronize()
        bundle = Bundle.init(path: path!)
    }
    
}
