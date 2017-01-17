//
//  MainController.swift
//  XMLY
//
//  Created by Rochester on 16/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit

class MainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 添加所有的子控制器
        setUpAllController()
        // 设置自己的tabbar
        setUpTabBar()
    }

    
}
// 设置自己的tabbar
extension MainController{
    fileprivate func setUpTabBar(){
        let rrTabBar = RRTabBar()
        // rrTabBar的闭包回调
        rrTabBar.btntag = {(btnTag) in
            if btnTag == 2{
                let playVC = PlayVC()
                self.present(playVC, animated: true, completion: nil)
            }else{
                self.selectedIndex = btnTag
            }
        }
        self.setValue(rrTabBar, forKeyPath: "tabBar")
    }
}
// 添加所有子控件
extension MainController{
    fileprivate func setUpAllController(){
        // 发现
        let disImage = UIImage(named: "tabbar_find_n")
        let disSelectImage = UIImage(named: "tabbar_find_h")
        creatTabBar(name:nil, image: disImage, selectImage: disSelectImage, Storyboard: "DiscoverVC")
        // 订阅听
        let soundImage = UIImage(named: "tabbar_sound_n")
        let soundSelectImage = UIImage(named: "tabbar_sound_h")
        creatTabBar(name: nil, image: soundImage, selectImage: soundSelectImage, Storyboard: "SubscriptionVC")
        // 播放
        let listenImage = #imageLiteral(resourceName: "tabbar_np_playnon")
        creatTabBar(name: nil, image: listenImage, selectImage: nil, Storyboard: "PlayVC")
        // 下载听
        
        let selectDownLoadImage = #imageLiteral(resourceName: "tabbar_download_h")
        let downLoadImage = #imageLiteral(resourceName: "tabbar_download_n")
        creatTabBar(name: nil, image: downLoadImage, selectImage: selectDownLoadImage, Storyboard: "DownLoadListenVC")
        // 我
        let meImage = #imageLiteral(resourceName: "tabbar_me_n")
        let selectMeImage = #imageLiteral(resourceName: "tabbar_me_h")
        creatTabBar(name: nil, image: meImage, selectImage: selectMeImage, Storyboard: "MeVC")
        
        
    }
    fileprivate func creatTabBar(name: String?,image: UIImage?,selectImage: UIImage?,Storyboard: String!){
        let vc = UIStoryboard(name: Storyboard, bundle: nil).instantiateInitialViewController()
        guard let vc1 = vc else { return }
//        vc1.tabBarItem.selectedImage = selectImage
//        vc1.tabBarItem.image = image
        addChildViewController(vc1)
    }
    
}
