//
//  UIButton+Create.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/25.
//  Copyright © 2017年 MYH. All rights reserved.
//

import UIKit
extension UIButton {
    // MARK:frame初始化(最基本)
    convenience init(frame:CGRect,center : CGPoint?,target : Any?,sel:Selector?,backgroundColor:UIColor?){
        self.init(type: .custom)
        self.frame = frame
        if center != nil {
            self.center = center!
        }
        self.backgroundColor = backgroundColor
        if sel != nil {
            self.addTarget(target, action: sel!, for: .touchUpInside)
        }
    }
    // MARK:frame(普通标题)
    convenience init(frame:CGRect,center : CGPoint?,target : Any?,sel:Selector?,backgroundColor:UIColor?,title:String?,titleColor:UIColor?){
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
    }
    // MARK:frame(普通标题+highlighted标题)
    convenience init(frame:CGRect,center : CGPoint?,target : Any?,sel:Selector?,backgroundColor:UIColor?,title:String?,titleColor:UIColor?,highlightedTitle:String?,highlightedTitleColor:UIColor?){
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, title: title, titleColor: titleColor)
        self.setTitle(highlightedTitle, for: .highlighted)
        self.setTitleColor(highlightedTitleColor, for: .highlighted)
    }
    // MARK:frame(普通标题+selected标题)
    convenience init(frame:CGRect,center : CGPoint?,target : Any?,sel:Selector?,backgroundColor:UIColor?,title:String?,titleColor:UIColor?,selectedTitle:String?,selectedTitleColor:UIColor?){
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, title: title, titleColor: titleColor)
        self.setTitle(selectedTitle, for: .selected)
        self.setTitleColor(selectedTitleColor, for: .selected)
    }
    // MARK:frame(普通标题+普通图片)
    convenience init(frame:CGRect,center : CGPoint?,target : Any?,sel:Selector?,backgroundColor:UIColor?,title:String?,titleColor:UIColor?,image:UIImage?){
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, title: title, titleColor: titleColor)
        self.setBackgroundImage(image, for: .normal)
    }
    // MARK:frame(普通标题+普通图片+selected图片)
    convenience init(frame:CGRect,center : CGPoint?,target : Any?,sel:Selector?,backgroundColor:UIColor?,title:String?,titleColor:UIColor?,image:UIImage?,selectedImage:UIImage?){
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, title: title, titleColor: titleColor, image: image)
        self.setBackgroundImage(selectedImage, for: .selected)
    }
    // MARK:frame(普通标题+普通图片+highlighted图片)
    convenience init(frame:CGRect,center : CGPoint?,target : Any?,sel:Selector?,backgroundColor:UIColor?,title:String?,titleColor:UIColor?,image:UIImage?,highlightedImage:UIImage?){
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, title: title, titleColor: titleColor, image: image)
        self.setBackgroundImage(highlightedImage, for: .selected)
    }
    // MARK:frame(普通标题+普通图片+highlighted图片+selected图片)
    convenience init(frame:CGRect,center : CGPoint?,target : Any?,sel:Selector?,backgroundColor:UIColor?,title:String?,titleColor:UIColor?,image:UIImage?,highlightedImage:UIImage?,selectedImage:UIImage?){
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, title: title, titleColor: titleColor, image: image)
        self.setBackgroundImage(highlightedImage, for: .selected)
        self.setBackgroundImage(selectedImage, for: .selected)
    }
    // MARK:frame(普通图片)
    convenience init(frame:CGRect,center : CGPoint?,target : Any?,sel:Selector?,backgroundColor:UIColor?,image:UIImage?){
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, title: nil, titleColor: nil, image: image)
    }
    // MARK:frame(普通图片+highlighted图片)
    convenience init(frame:CGRect,center : CGPoint?,target : Any?,sel:Selector?,backgroundColor:UIColor?,image:UIImage?,highlightedImage:UIImage?){
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, image: image)
        self.setBackgroundImage(highlightedImage, for: .highlighted)
    }
    // MARK:frame(普通图片+selected图片)
    convenience init(frame:CGRect,center : CGPoint?,target : Any?,sel:Selector?,backgroundColor:UIColor?,image:UIImage?,selectedImage:UIImage?){
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, image: image)
        self.setBackgroundImage(selectedImage, for: .selected)
    }
    // MARK:frame(普通图片+highlighted图片+selected图片)
    convenience init(frame:CGRect,center : CGPoint?,target : Any?,sel:Selector?,backgroundColor:UIColor?,image:UIImage?,highlightedImage:UIImage?,selectedImage:UIImage?){
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, image: image)
        self.setBackgroundImage(highlightedImage, for: .selected)
        self.setBackgroundImage(selectedImage, for: .selected)
    }
    // MARK:width(普通标题+普通图片)
    /* :width(普通标题+普通图片)*/
    convenience init(width:CGFloat,center : CGPoint,target : Any?,sel:Selector?,backgroundColor:UIColor?,title:String?,titleColor:UIColor?,image:UIImage!){
        let frame = CGRect.init(x: 0, y: 0, width: width, height: width*image.size.height/image.size.width)
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, title: title, titleColor: titleColor)
        self.setBackgroundImage(image, for: .normal)
    }
    // MARK:frame(普通图片)
    /// frame(普通图片)
    convenience init(width:CGFloat,center : CGPoint,target : Any?,sel:Selector?,backgroundColor:UIColor?,image:UIImage!){
        let frame = CGRect.init(x: 0, y: 0, width: width, height: width*image.size.height/image.size.width)
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, title: nil, titleColor: nil, image: image)
    }
    // MARK:frame(普通图片+highlighted图片)
    convenience init(width:CGFloat,center : CGPoint,target : Any?,sel:Selector?,backgroundColor:UIColor?,image:UIImage!,highlightedImage:UIImage?){
        let frame = CGRect.init(x: 0, y: 0, width: width, height: width*image.size.height/image.size.width)
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, image: image)
        self.setBackgroundImage(highlightedImage, for: .highlighted)
    }
    // MARK:frame(普通图片+selected图片)
    convenience init(width:CGFloat,center : CGPoint,target : Any?,sel:Selector?,backgroundColor:UIColor?,image:UIImage!,selectedImage:UIImage?){
        let frame = CGRect.init(x: 0, y: 0, width: width, height: width*image.size.height/image.size.width)
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, image: image)
        self.setBackgroundImage(selectedImage, for: .selected)
        self.setBackgroundImage(image, for: .highlighted)
    }
    // MARK:frame(普通图片+highlighted图片+selected图片)
    convenience init(width:CGFloat,center : CGPoint,target : Any?,sel:Selector?,backgroundColor:UIColor?,image:UIImage!,highlightedImage:UIImage?,selectedImage:UIImage?){
        let frame = CGRect.init(x: 0, y: 0, width: width, height: width*image.size.height/image.size.width)
        self.init(frame: frame, center: center, target: target, sel: sel, backgroundColor: backgroundColor, image: image)
        self.setBackgroundImage(highlightedImage, for: .highlighted)
        self.setBackgroundImage(selectedImage, for: .selected)
    }
    
}
