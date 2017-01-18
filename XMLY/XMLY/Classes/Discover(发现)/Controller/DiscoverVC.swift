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
let kViewH : CGFloat = 49
let klineH : CGFloat = 1
class DiscoverVC: UIViewController {
    let titles = ["推荐","分类","广播","榜单","主播"]
    var childVCs : [UIViewController] = [UIViewController]()
    lazy var pageView : PageView = {
        self.childVCs.append(RecommendVC())
        self.childVCs.append(ClassifyVC())
        self.childVCs.append(BroadcastVC())
        self.childVCs.append(ListVC())
        self.childVCs.append(AnchorVC())
        let kContentH = screenH - kViewH - kNavH - kStatusH
        let pageView : PageView = PageView(frame: CGRect(x: 0, y: kStatusH + kNavH + kViewH, width: screenW, height: kContentH), childVCs: self.childVCs, parentVC: self)
        return pageView
    }()
    lazy var titleView : TitleView = {
        let titleView = TitleView(frame: CGRect(x: 0, y: kStatusH + kNavH, width: screenW, height: kViewH), titles: self.titles)
        return titleView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        title = "发现"
    }
    
}
extension DiscoverVC{
    fileprivate func setUpUI(){
        addTitleView()
        addPageView()
    }
}
extension DiscoverVC{
    fileprivate func addTitleView(){
        view.addSubview(titleView)
        // 按钮的点击
        titleView.titleViewBtnClick = { (btnTag) in
            self.pageView.scrollCollectionView(index: btnTag)
        }
    }
    fileprivate func addPageView(){
        view.addSubview(pageView)
        // collectionView滚动
        pageView.collectionItem = {(index) in
            self.titleView.selectedButton(index: index)
        }
    }
}
