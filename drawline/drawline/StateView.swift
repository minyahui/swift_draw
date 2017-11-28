//
//  StateView.swift
//  drawline
//
//  Created by MYH on 2017/11/28.
//  Copyright © 2017年 MYH. All rights reserved.
//

import UIKit

class StateView: UIView {
    var model : StateModel?
    
    class func create(_ frame : CGRect, _ model : StateModel) -> StateView {
        let sv = StateView.init(frame: frame)
        sv.backgroundColor = UIColor.clear
        sv.center = CGPoint.init(x: CGFloat(model.s_px), y: CGFloat(model.s_py))
        sv.model = model
        return sv
    }
    func stateTitle() -> String {
        if model != nil {
            
        }
        return ""
    }
}
