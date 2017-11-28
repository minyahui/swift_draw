//
//  UIImageView+Create.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/25.
//  Copyright © 2017年 MYH. All rights reserved.
//

import UIKit
extension UIImageView {
    
    convenience init(frame:CGRect,image:UIImage?){
        self.init(frame: frame)
        self.image = image
        self.isUserInteractionEnabled = true
    }
    
    convenience init(frame:CGRect,center: CGPoint,image:UIImage?){
        self.init(frame: frame)
        self.center = center
        self.image = image
        self.isUserInteractionEnabled = true
    }
    
    convenience init(width:CGFloat,center: CGPoint,image:UIImage){
        self.init()
        let size = CGSize.init(width: width, height: width * image.size.height / image.size.width)
        self.odev_size = size
        self.center = center
        self.image = image
        self.isUserInteractionEnabled = true
    }
    
    /// MARK 生成一个新的图片
    func cover(image:UIImage?,tintColor:UIColor!) -> UIImageView {
        var coverImage : UIImage?
        if let newImage = image {
            coverImage = newImage.withRenderingMode(.alwaysTemplate)
        }else {
            coverImage = self.image?.withRenderingMode(.alwaysTemplate)
        }
        self.image = coverImage
        self.tintColor = tintColor
        return self
    }
}
