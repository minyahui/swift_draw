//
//  UITableView+Create.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/25.
//  Copyright © 2017年 MYH. All rights reserved.
//

import UIKit
extension UITableView {
    convenience init(frame: CGRect,style: UITableViewStyle, delegate:Any?){
        self.init(frame: frame, style: style)
        self.backgroundColor = UIColor.clear
        self.delegate = delegate as? UITableViewDelegate
        self.dataSource = delegate as? UITableViewDataSource
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.tableFooterView = UIView.init(frame: CGRect.zero)
        self.tableHeaderView = UIView.init(frame: CGRect.zero)
        self.separatorStyle = .none
    }
}
