//
//  UIView+Create.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/25.
//  Copyright © 2017 MYH. All rights reserved.
//

import UIKit
extension UIView {
    
    var odev_size : CGSize {
        get {
            return self.frame.size
        }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    var odev_width : CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    var odev_height : CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    var odev_x : CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    var odev_y : CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    var odev_centerX : CGFloat {
        get {
            return self.center.x
        }
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    var odev_centerY : CGFloat {
        get {
            return self.center.y
        }
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    var odev_maxX : CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.width
            self.frame = frame
        }
    }
    var odev_maxY : CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.height
            self.frame = frame
        }
    }
    
    func capture() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.odev_size, false, 1.0)//NO，YES 控制是否透明
        if UIGraphicsGetCurrentContext() == nil {
            return UIImage.init(named: "ditu")!
        }
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if image == nil {
            return UIImage.init(named: "ditu")!
        }
        return image!
    }
    
    convenience init(frame:CGRect,center : CGPoint,backgroundColor : UIColor?){
        self.init()
        self.frame = frame
        self.center = center
        self.backgroundColor = backgroundColor
    }
    
    convenience init(size:CGSize,center : CGPoint,backgroundColor : UIColor?){
        self.init()
        self.frame = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        self.center = center
        self.backgroundColor = backgroundColor
    }
    
    convenience init(frame:CGRect,backgroundColor : UIColor?){
        self.init()
        self.frame = frame
        self.backgroundColor = backgroundColor
    }
}
