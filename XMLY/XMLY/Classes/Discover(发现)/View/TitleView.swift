//
//  TitleView.swift
//  XMLY
//
//  Created by Rochester on 18/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit
//typealias btnTag = (_ tag : Int) -> Void
typealias titleViewBtnBlock = (_ tag : CGFloat) -> Void
class TitleView: UIView {
    var titles : [String]
    var titleViewBtnClick : titleViewBtnBlock?
    var selectedBtn = UIButton(type: .custom)
    var bottomLine : UIView = UIView()
    init(frame : CGRect,titles : [String]) {
        self.titles = titles
        super.init(frame: frame)
        setUpUI()
//        self.backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func selectedButton(index : CGFloat){
        let btn : UIButton = self.subviews[Int(index) + 1] as! UIButton
        btnClick(btn)
        
    }
}
extension TitleView{
    
    fileprivate func setUpUI(){
        let lineView = UIView()
        lineView.backgroundColor = UIColor.orange
        let btnW : CGFloat = screenW / CGFloat(self.titles.count)
        for i in 0..<self.titles.count{
            let btn = UIButton(type: .custom)
            if i == 0 {
                btn.isSelected = true
                self.selectedBtn = btn
                lineView.frame = CGRect(x: 0, y: kViewH - klineH, width: btnW, height: 1)
                self.bottomLine = lineView
                self.addSubview(lineView)
            }
            btn.setTitleColor(UIColor.orange, for: .selected)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.tag = i
            btn.frame = CGRect(x:CGFloat(i) * btnW , y: 0, width: btnW, height: kViewH - klineH)
            btn.setTitle(self.titles[i], for: .normal)
            btn.setTitle(self.titles[i], for: .selected)
            btn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)
            self.addSubview(btn)
    }
    }
    @objc func btnClick(_ btn: UIButton){
        self.selectedBtn.isSelected = false
        btn.isSelected = true
        self.selectedBtn = btn
        // 监听按钮的点击
        if (titleViewBtnClick != nil){
            titleViewBtnClick!(CGFloat(btn.tag))
        }
        UIView.animate(withDuration: 0.25) {
            self.bottomLine.frame.origin.x = CGFloat(btn.tag) * (screenW / CGFloat(self.titles.count))
            
        }
        
    }
    
}
