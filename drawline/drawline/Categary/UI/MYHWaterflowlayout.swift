//
//  MYHWaterflowlayout.swift
//  Odev-Swift
//
//  Created by MYH on 2017/8/24.
//  Copyright © 2017年 MYH. All rights reserved.
//

import UIKit
class MyTest: UICollectionViewFlowLayout {
    
}

class MYWaterflowlayout : UICollectionViewFlowLayout {
    weak var delegate : MYHWaterflowlayoutDelegate?
    /// 默认的列数
    private var MYHDefaultColumnCount : Int = 3
    /// 每一列之间的间距
    private var MYHDefaultColumnMargin : CGFloat = 10.0
    /// 每一行之间的间距
    private var MYHDefaultRowMargin : CGFloat = 10.0
    /// 边沿之间的间距
    private var MYHDefaultEdgeInsets : UIEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    /// 存放所有的布局属性
    private var attrsArray : [UICollectionViewLayoutAttributes]? = []
    /// 用来存放所有列的高度
    private var columnHeights : [CGFloat]? = []
    private var isHaha : Bool = false
//    override init() {
//        super.init()
//    }
//    
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    override open var collectionViewContentSize: CGSize {
//        get{
//            self.doDelegate()
//            var maxColumnHeight : CGFloat = 0
//            for i in 0..<self.columnHeights!.count {
//                let columnHeight = self.columnHeights![i]
//                if maxColumnHeight < columnHeight {
//                    maxColumnHeight = columnHeight
//                }
//            }
//            print(self.columnHeights,maxColumnHeight,maxColumnHeight + MYHDefaultEdgeInsets.bottom)
//            return CGSize.init(width: 0, height: maxColumnHeight + MYHDefaultEdgeInsets.bottom)
//        }
//    }
    
    override var collectionViewContentSize:  CGSize {
        self.doDelegate()
        var maxColumnHeight : CGFloat = 0
        for i in 0..<self.columnHeights!.count {
            let columnHeight = self.columnHeights![i]
            if maxColumnHeight < columnHeight {
                maxColumnHeight = columnHeight
            }
        }
        return CGSize.init(width: 0, height: maxColumnHeight + MYHDefaultEdgeInsets.bottom)
    }
    /// 初始化
    func doDelegate() -> Void {
        if let colu = delegate?.MYHWaterflowlayout!(columnCountWaterflowlayout: self) {
            MYHDefaultColumnCount = colu
        }
        if let colu = delegate?.MYHWaterflowlayout!(columnMarginWaterflowlayout: self) {
            MYHDefaultColumnMargin = colu
        }
        if let colu = delegate?.MYHWaterflowlayout!(rowMarginWaterflowlayout: self) {
            MYHDefaultRowMargin = colu
        }
        if let colu = delegate?.MYHWaterflowlayout!(edgeInsetsWaterflowlayout: self) {
            MYHDefaultEdgeInsets = colu
        }
    }
    override open func prepare() -> Void {
        super.prepare()
        //先清除以前计算的所有高度
        self.doDelegate()
        columnHeights = []
        for _ in 0..<MYHDefaultColumnCount {
            columnHeights?.append(MYHDefaultEdgeInsets.top)
        }
        //清楚之前所有的布局属性
        attrsArray = []
        if let count = self.collectionView?.numberOfItems(inSection: 0) {
            for i in 0..<count {
                let indexPath = IndexPath.init(row: i, section: 0)
                if let attrs = self.layoutAttributesForItem(at: indexPath) {
                    attrsArray?.append(attrs)
                }
            }
        }
    }
    
    /// 决定cell的排布

    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        self.isHaha = true
        return self.attrsArray
    }
    /// 返回indexPath位置cell对应的布局属性
    ///
    /// - Parameter indexPath: <#indexPath description#>
    /// - Returns: <#return value description#>
    override open func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        self.doDelegate()
        let attrs : UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        let collectionViewW = self.collectionView?.frame.size.width
        if self.delegate != nil {
            let w : CGFloat = (collectionViewW! - MYHDefaultEdgeInsets.left - MYHDefaultEdgeInsets.right - (CGFloat(MYHDefaultColumnCount - 1)) * MYHDefaultColumnMargin) / CGFloat(MYHDefaultColumnCount)
            let h : CGFloat = self.delegate!.MYHWaterflowlayout(self, heightForItem: indexPath.item, itemWidth: w)
            var destColumn = 0
            var minColumnHeight : CGFloat = CGFloat(MAXFLOAT)
            
            //找出高度最短的那一列
            if self.columnHeights != nil {
                for i in 0..<self.columnHeights!.count {
                    let columnHeight = self.columnHeights![i]
                    if columnHeight < minColumnHeight {
                        minColumnHeight = columnHeight
                        destColumn = i
                    }
                }
            }
            let x = MYHDefaultEdgeInsets.left + CGFloat(destColumn) * (w + MYHDefaultColumnMargin)
            var y = minColumnHeight
            if y != MYHDefaultEdgeInsets.top {
                y = y + MYHDefaultRowMargin
            }
            attrs.frame = CGRect.init(x: x, y: y, width: w, height: h)
            self.columnHeights?[destColumn] = attrs.frame.origin.y + attrs.frame.size.height
//            print(destColumn,minColumnHeight,collectionViewW,attrs)
        }
        return attrs
    }
    
}

@objc protocol MYHWaterflowlayoutDelegate {
    
    /// 获得高度
    ///
    /// - Parameters:
    ///   - waterflowlayout: <#waterflowlayout description#>
    ///   - index: <#index description#>
    ///   - width: <#width description#>
    /// - Returns: <#return value description#>
    @objc func MYHWaterflowlayout(_ waterflowlayout : MYWaterflowlayout, heightForItem index: Int, itemWidth width: CGFloat) -> CGFloat
    
    /// 列数
    ///
    /// - Parameter waterflowlayout: <#waterflowlayout description#>
    /// - Returns: <#return value description#>
    @objc optional func MYHWaterflowlayout(columnCountWaterflowlayout waterflowlayout : MYWaterflowlayout) -> Int
    
    /// 每一列之间的间距，默认为10
    ///
    /// - Parameter waterflowlayout: <#waterflowlayout description#>
    /// - Returns: <#return value description#>
    @objc optional func MYHWaterflowlayout(columnMarginWaterflowlayout waterflowlayout : MYWaterflowlayout) -> CGFloat
    
    /// 每一行之间的间距,默认为10
    ///
    /// - Parameter waterflowlayout: <#waterflowlayout description#>
    /// - Returns: <#return value description#>
    @objc optional func MYHWaterflowlayout(rowMarginWaterflowlayout waterflowlayout : MYWaterflowlayout) -> CGFloat
    
    /// 边沿之间的间距，默认为{10,10,10,10} 上 左 下 右
    ///
    /// - Parameter waterflowlayout: <#waterflowlayout description#>
    /// - Returns: <#return value description#>
    @objc optional func MYHWaterflowlayout(edgeInsetsWaterflowlayout waterflowlayout : MYWaterflowlayout) -> UIEdgeInsets

}
