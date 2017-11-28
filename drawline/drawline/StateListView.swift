//
//  StateListView.swift
//  drawline
//
//  Created by MYH on 2017/11/28.
//  Copyright © 2017年 MYH. All rights reserved.
//

import UIKit

class StateListView: UIView,UIScrollViewDelegate,UIGestureRecognizerDelegate {
    /*
     1.通过一个模型数组来创建状态机列表
     2.列表上应该有一个可以滑动的view（UIScrollView、UITableView、UICollectionView任选）
     */
    let backImageV = UIImageView.init()// 背景图片
    let scrollView = UIScrollView.init()// 列表
    var selectTouch : UITouch?
    var selectButton : UIButton? // 当前选择的button
    private var rect : CGRect = CGRect.zero
    private let stateViewTitleLabel : UILabel = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.createUI()
    }
    private func createUI() {
        backImageV.frame = self.bounds
        backImageV.image = UIImage.init(named: "programme2_2.png")
        backImageV.isUserInteractionEnabled = true
        self.addSubview(backImageV)
        
        rect = CGRect.init(x: self.odev_width * 170 / 1578, y: self.odev_height * 78 / 380, width: self.odev_width * 1240 / 1578, height: self.odev_width * 166 / 380)
        // scrollView.frame的frame会根据上面的控件个数来改变
        scrollView.frame = rect
        scrollView.alwaysBounceVertical = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize.init(width: scrollView.odev_width, height: scrollView.odev_height)
        scrollView.delegate = self
        scrollView.layer.masksToBounds = true
        backImageV.addSubview(scrollView)
    }
    //MARK:创建默认的状态机选择列表（一级列表）
    func createDefaultStateViews() {
        let array = ["移动","语音","LED屏幕","音乐","特殊","动作"]
        self.create(firstList : array, 0)
    }
    
    //MARK: 通过数组和默认选择的下标创建状态机选择列表（一级列表）
    ///
    /// - Parameters:
    ///   - buttons: 状态机数组
    ///   - selectedIndex: 默认选择的下标
    func create(firstList buttons : [String],_ selectedIndex : Int) {
        if buttons.count == 0 {
            return
        }
        if selectedIndex >= buttons.count {
            return
        }
        let w : CGFloat = self.odev_width * 1244 / 1578
        let jw : CGFloat = w / CGFloat(buttons.count)
        var bh : CGFloat = self.odev_height * 65 / 380
        var bw : CGFloat = bh * 242 / 116
        if (bw > jw) {
            bw = jw
            bh = bw * 116 / 242
        }
        for i in 0..<buttons.count {
            let centerX  : CGFloat = self.odev_width * 164 / 1578 + jw / 2 + jw * CGFloat(i)
            let centerY : CGFloat = self.odev_height * 330 / 380
            
            
            let button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: bw, height: bh), center: CGPoint.init(x: centerX, y: centerY), target: self, sel: #selector(pressAddBtn(_:)), backgroundColor: nil, title: LanguageHelper.get(key: buttons[i]), titleColor: UIColor.init(red: 0.4, green: 0.02, blue: 0, alpha: 1))
            button.setTitleColor(UIColor.white, for: .selected)
            button.setBackgroundImage(UIImage.init(named: "programme2_5_1.png"), for: .selected)
            button.tag = 1000 + i
            self.addSubview(button)
            if i == selectedIndex {
                self.selectButton = button
                self.pressAddBtn(button)
            }
        }
    }
    
    //MARK: 创建二级列表
    ///
    /// - Parameter models: 二级列表模型数组
    func create(modelArray models : [StateModel]) {
        let w1 : CGFloat = rect.size.width
        let h1 : CGFloat = rect.size.height
        let w2 : CGFloat = (h1) * CGFloat(models.count)
        let W : CGFloat = w1 > w2 ? w2 : w1
        scrollView.frame = CGRect.init(x: rect.origin.x + (w1 - W) / 2, y: rect.origin.y, width: W, height: h1)
        if (w1 > w2) {
            scrollView.alwaysBounceHorizontal = false
            scrollView.layer.cornerRadius = 0
        }else{
            scrollView.alwaysBounceHorizontal = true
            scrollView.layer.cornerRadius = scrollView.odev_height / 2
        }
        scrollView.contentSize = CGSize.init(width: CGFloat(models.count) * h1, height: h1)
        let svH : CGFloat = rect.size.height - 10
        var i : CGFloat = 0
        
        for model in models {
            model.s_px = Float(h1 / 2 + i * h1)
            model.s_py = Float(h1 / 2)
            let sv = StateView.create(CGRect.init(x: 0, y: 0, width: svH, height: svH), model)
            sv.isUserInteractionEnabled = true
            // 给每一个sv添加一个拖动的手势
            let pan = UIPanGestureRecognizer.init(target: self, action: #selector(pan(_:)))
            pan.delegate = self
            sv.addGestureRecognizer(pan)
            scrollView.addSubview(sv)
            i = i + 1
        }
    }
    //MARK: 点选了一级列表的按钮
    ///
    /// - Parameter sender: 一级列表的按钮
    @objc func pressAddBtn(_ sender : UIButton) {
        // 先让其归位
        if backImageV.odev_y != 0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.backImageV.odev_y = 0
            })
        }
        //
        if sender.isSelected || self.selectTouch != nil {
            return
        }
        // 先移除所有的状态机
        for view in self.scrollView.subviews {
            if view.isKind(of: StateView.classForCoder()) {
                view.removeFromSuperview()
            }
        }
        self.selectButton?.isSelected = false
        sender.isSelected = true
        self.selectButton = sender
        if let title = sender.titleLabel?.text {
            let modelArray = StateContentModel.models(title)
            self.create(modelArray: modelArray)
        }
    }
    //MARK:处理手势
    @objc func pan(_ pan : UIPanGestureRecognizer) {
        if pan.state == .began {
            
        } else if (pan.state == .changed) {
            
        } else if (pan.state == .ended) {
            
        } else {
            
        }
    }
    //MARK:手势的代理
    // 手势传递()
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if let view = otherGestureRecognizer.view {
            if view == scrollView {
                return true
            }
        }
        return false
    }
    // 解决多手势bug
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if self.selectTouch == nil {
            self.selectTouch = touch
        }
        if self.selectTouch != touch {
            return false
        }
        let p = touch.location(in: scrollView)
        for v in scrollView.subviews {
            if let sv = v as? StateView {
                if sv.frame.contains(p) {// 如果手势的点在状态机里面
                    if self.stateViewTitleLabel.isHidden == true {
                        self.stateViewTitleLabel.isHidden = false
                        let cp = self.convert(sv.center, from: scrollView)
                        self.stateViewTitleLabel.odev_centerX = cp.x
                        self.stateViewTitleLabel.text = sv.stateTitle()
                    }
                }
            }
        }
        return true
    }
    // 主要是因为隐藏的时候，方便处理这一块的响应
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if backImageV.odev_y != 0 && point.y < self.odev_height * 0.75 {
            return false
        }
        return super.point(inside: point, with: event)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

/// 这个类主要是通过状态机的一级列表获取二级列表
class StateContentModel: NSObject {
    class func models(_ title : String) -> [StateModel] {
        var array : [StateModel] = [StateModel]()
        var stateType : StateModel.StateType = .move
        var count : Int = 0
        if title == LanguageHelper.get(key: "移动") {
            count = 5
            stateType = .move
        } else if title == LanguageHelper.get(key: "语音") {
            count = 12
            stateType = .voice
        } else if title == LanguageHelper.get(key: "LED屏幕") {
            count = 12
            stateType = .LED
        } else if title == LanguageHelper.get(key: "音乐") {
            count = 15
            stateType = .music
        } else if title == LanguageHelper.get(key: "特殊") {
            count = 3
            stateType = .special
        } else if title == LanguageHelper.get(key: "动作") {
            count = 11
            stateType = .act
        } else {
            count = 1
            stateType = .empty
        }
        for i in 0..<count {
            let model = StateModel.init()
            model.s_flag = i
            model.s_stateType = stateType
            array.append(model)
        }
        return array
    }
}
