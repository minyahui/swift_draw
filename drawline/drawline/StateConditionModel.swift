//
//  StateConditionModel.swift
//  drawline
//
//  Created by MYH on 2017/11/28.
//  Copyright © 2017年 MYH. All rights reserved.
//

import UIKit

class StateConditionModel: BaseModel {
    var c_type : Int? /**<   条件类型（立即、随后） */
    var c_flay : Int? /**<   条件序号（多个条件的时候的区分） */
    var c_startName : String?
    var c_nextName : String?
    var c_WaitTime : Float = 3.0
    var c_Time : Float = 3.0
    var c_if : Int? /**<   如果  （有很多选择）（障碍） */
    var c_go : Int?  /**<   就  （有很多选择）（障碍）*/
    var c_lineIf0 : Bool?// 四个寻线灯
    var c_lineIf1 : Bool?
    var c_lineIf2 : Bool?
    var c_lineIf3 : Bool?
    var c_lineGo : Int? /**<   巡线就 （下面有很多条件） */
    
    class func createModel(_ model : StateConditionModel) -> StateConditionModel {
        let newModel = StateConditionModel.init()
        newModel.c_type = model.c_type
        newModel.c_flay = model.c_flay
        newModel.c_startName = model.c_startName
        newModel.c_nextName = model.c_nextName
        newModel.c_WaitTime = model.c_WaitTime
        newModel.c_Time = model.c_Time
        newModel.c_if = model.c_if
        newModel.c_go = model.c_go
        newModel.c_lineIf0 = model.c_lineIf0
        newModel.c_lineIf1 = model.c_lineIf1
        newModel.c_lineIf2 = model.c_lineIf2
        newModel.c_lineIf3 = model.c_lineIf3
        newModel.c_lineGo = model.c_lineGo
        return newModel
    }
}
