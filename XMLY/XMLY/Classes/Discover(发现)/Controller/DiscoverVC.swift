//
//  DiscoverVC.swift
//  XMLY
//
//  Created by Rochester on 17/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit
let screenW : CGFloat = UIScreen.main.bounds.size.width
let screenH : CGFloat = UIScreen.main.bounds.size.height
let kStatusH : CGFloat = 20
let kNavH : CGFloat = 44
class DiscoverVC: UIViewController {
    let titles = ["推荐","分类","广播","榜单","主播"]
    lazy var titleView : UIView = {[weak self] in
        let view = UIView()
        view.frame = CGRect(x: 0, y: kStatusH + kNavH, width: screenW, height: 49)
        
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
}
extension DiscoverVC{
    fileprivate func setUpUI(){
        view.addSubview(titleView)
    }
}
