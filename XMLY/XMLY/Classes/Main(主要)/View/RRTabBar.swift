//
//  RRTabBar.swift
//  XMLY
//
//  Created by Rochester on 17/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit
let kScreenW : CGFloat = UIScreen.main.bounds.width
// 定义一个闭包
typealias btnTag = (_ tag : Int) -> Void
class RRTabBar: UITabBar {
    lazy var selectedBtn = UIButton(type:.custom)
    var btntag : btnTag?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // tabBar的width
        let kWidth = self.frame.size.width
        // tabBar的height
        let kHeight = self.frame.size.height
        // 设置索引
        var index : CGFloat = 0
        // 获取每个tabbar的宽度
        let tabBarW : CGFloat = kWidth / 5
        let tabBarH : CGFloat = kHeight
        let ImageArr = [#imageLiteral(resourceName: "tabbar_find_n"),#imageLiteral(resourceName: "tabbar_sound_n"),#imageLiteral(resourceName: "tabbar_np_playnon"),#imageLiteral(resourceName: "tabbar_download_n"),#imageLiteral(resourceName: "tabbar_me_n")]
        let selectImage = [#imageLiteral(resourceName: "tabbar_find_h"),#imageLiteral(resourceName: "tabbar_sound_h"),#imageLiteral(resourceName: "tabbar_np_playnon"),#imageLiteral(resourceName: "tabbar_download_h"),#imageLiteral(resourceName: "tabbar_me_h")]
        for i in 0..<5{
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: CGFloat(i) + (index * tabBarW), y: 0, width: tabBarW, height: tabBarH)
            btn.setImage(ImageArr[i], for: .normal)
            btn.setImage(selectImage[i], for: .selected)
            btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
            btn.tag = i
            if i == 0{
                btn.isSelected = true
                selectedBtn = btn
            }
            self.addSubview(btn)
            index += 1
        }
        
    }
    @objc func btnClick(_ btn : UIButton){
        if btn.tag == 2{
            
        }else{
            btn.isSelected = true
            selectedBtn.isSelected = false
            selectedBtn = btn
        }
        
        if (btntag != nil) {
            btntag!(btn.tag)
        }
    }
}
