//
//  StateModel.swift
//  drawline
//
//  Created by MYH on 2017/11/28.
//  Copyright © 2017年 MYH. All rights reserved.
//

import UIKit

class StateModel: BaseModel {
    /*
     通过一个模型，可以创建一个状态机，状态机的属性应该有这些
     1.是哪一个状态机
     2.状态机的值
     3.状态机和哪些东西连接着
     4.状态机的坐标
     */
    enum StateType : Int {
        case move = 0   //移动
        case voice      //语音
        case LED        //LED
        case music      //音乐
        case special    //特殊
        case act        //动作
        case start      //开始
        case empty      //空状态机
    }
    
    var s_name : String?/**<  状态机的名称，类似于ID */
    var s_px : Float = 0
    var s_py : Float = 0
    var s_stateType : StateType = .move
    var s_flag : Int? /**< 这个值相当的重要，当s_stateType不同时有不同的含义,下面是详细的解释
     move：自由移动、转弯
     */
    var s_conditionArray : [StateConditionModel]? /**< 条件数组*/
    var s_second_flag : Int?      /**<  选择声音状态机标签 */
    var s_valueTime : Float?/**<  运行时间 */
    var s_valueSpeed : Float?/**<  前进后退速度 */
    var s_valueLeft : Float?/**<  左轮速度 */
    var s_valueRight : Float?/**<  右轮速度 */
    var s_valueAngle : Float?/**<  角度 */
    var s_valueMusic : Int?/**<  音符 ,语言 */
    var s_valueLightArray : String?/**< LED的数目 */
    
    
    
}
