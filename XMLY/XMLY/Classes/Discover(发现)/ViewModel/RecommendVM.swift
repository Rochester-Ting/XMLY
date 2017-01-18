//
//  RecommendVM.swift
//  XMLY
//
//  Created by Rochester on 18/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit
import SwiftyJSON
// 轮播图的Api
fileprivate let kCircleUrlString = "http://mobile.ximalaya.com/mobile/discovery/v4/recommends?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.21"
/// 分类 - 猜你喜欢 - 听北京 - 热门推荐
fileprivate let kHotAndGuessAPI = "http://mobile.ximalaya.com/mobile/discovery/v2/recommend/hotAndGuess?code=43_110000_1100&device=iPhone&version=5.4.21"
/// 现场直播
fileprivate let kLiveRecommendAPI = "http://live.ximalaya.com/live-activity-web/v3/activity/recommend"
/// FooterAd
fileprivate let kRecomBannerAPI = "http://adse.ximalaya.com/ting?appid=0&device=iPhone&name=find_banner&network=WIFI&operator=3&scale=2&version=5.4.21"
class RecommendVM: NSObject {
    // 轮播图
    var cycleArr : [CircleItem] = [CircleItem]()
    // 分类
    var classiftList : [ClassiftItem] = [ClassiftItem]()
    // 小编推荐
    var sectionList : [sectionItem] = [sectionItem]()
}
extension RecommendVM{
    func requestCirClePicData(finishedCallBack:@escaping ()->()){
        // 轮播图
        NetworkTools.requestData(type: .GET, urlString: kCircleUrlString) { (responseObject) in
            
            // 获取轮播图的数组
            guard let responseObjectDict = responseObject as? [String : NSObject] else {return}
            guard let circlePicDict = responseObjectDict["focusImages"] as? [String : NSObject] else {return}
            guard let circlePicList = circlePicDict["list"] as? [[String : NSObject]] else {return}
            for dict in circlePicList{
                self.cycleArr.append(CircleItem(dict: dict))
            }
            guard let editorRecommendAlbums = responseObjectDict["editorRecommendAlbums"] as? [String : NSObject] else {return}
            self.sectionList.append(sectionItem(dict:editorRecommendAlbums))
            
//            finishedCallBack()
            NetworkTools.requestData(type: .GET, urlString: kHotAndGuessAPI) { (responseObject) in
                guard let responseDict = responseObject as? [String : NSObject] else{return}
                guard let discoveryColumns = responseDict["discoveryColumns"] as? [String : NSObject] else {return}
                guard let classiftList = discoveryColumns["list"] as? [[String : NSObject]] else {return}
                for dict in classiftList{
                    self.classiftList.append(ClassiftItem(dict: dict))
                }
                guard let cityColumn = responseDict["cityColumn"] as? [String : NSObject] else {return}
                self.sectionList.append(sectionItem(dict: cityColumn))
                guard let hotRecommends = responseDict["hotRecommends"] as? [String : NSObject] else {return}
                guard let list = hotRecommends["list"] as? [[String : NSObject]] else {return}
                for dict in list{
                    self.sectionList.append(sectionItem(dict: dict))
                }
                finishedCallBack()
            }
        }
    }
    // 获取剩余内容
    
}
