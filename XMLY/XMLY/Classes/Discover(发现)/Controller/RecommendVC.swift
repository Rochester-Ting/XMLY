//
//  RecommendVC.swift
//  XMLY
//
//  Created by Rochester on 18/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit
let kMargin : CGFloat = 10
let kItemMargin : CGFloat = 30
let recommandCellId = "recommandCell"
let kTabBarH : CGFloat = 50
let kCircleViewH : CGFloat = 180
let kClassiftViewH : CGFloat = 100
let kHeader : CGFloat = 50
let kHeaderId : String = "headCell"
class RecommendVC: UIViewController {
    let recommendVM : RecommendVM = RecommendVM()
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: kMargin, bottom: 0, right: kMargin)
        let itemWH = (screenW - (2 * kMargin + 2 * kItemMargin)) / 3
        layout.itemSize = CGSize(width: itemWH, height: itemWH + itemWH * 2.0 / 3.0)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = kItemMargin
        layout.minimumLineSpacing = kMargin
        layout.headerReferenceSize = CGSize(width: screenW, height: kHeader)
        let collectionView : UICollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "DetailCell", bundle: nil), forCellWithReuseIdentifier: recommandCellId)
        collectionView.backgroundColor = UIColor.white
        collectionView.contentInset = UIEdgeInsets(top: kCircleViewH + kClassiftViewH, left: 0, bottom: kStatusH + kNavH + kViewH + kTabBarH, right: 0)
        collectionView.register(UINib(nibName: "SectionCell", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderId)
        return collectionView
    }()
    lazy var circleView : CycleView = {
        let cycelView = CycleView.cycleView()
        cycelView.frame = CGRect(x: 0, y: -(kCircleViewH + kClassiftViewH), width: kScreenW, height: kCircleViewH)
        
        return cycelView
        
    }()
    lazy var classiftView : ClassiftView = {
        let classiftView : ClassiftView = ClassiftView()
        classiftView.frame = CGRect(x: 0, y: -(kClassiftViewH), width: screenW, height: kClassiftViewH)
        classiftView.backgroundColor = UIColor.red
        return classiftView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        setUpUI()
        recommendVM.requestCirClePicData{
            self.collectionView.reloadData()
        }
    }

}
extension RecommendVC{
    fileprivate func setUpUI(){
        addCollectionView()
        addCycleView()
        addClassiftView()
    }
}
extension RecommendVC{
    fileprivate func addCollectionView(){
        view.addSubview(collectionView)
    }
    fileprivate func addCycleView(){
        collectionView.addSubview(circleView)
    }
    fileprivate func addClassiftView(){
        collectionView.addSubview(classiftView)
    }
}
extension RecommendVC : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.sectionList.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionItem = recommendVM.sectionList[section]
        let num : [DetailItem] =  sectionItem.detailItems
        return num.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recommandCellId, for: indexPath) as! DetailCell
        let sectionItem = recommendVM.sectionList[indexPath.section]
        let num : [DetailItem] =  sectionItem.detailItems
        cell.detailItem = num[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView { // UICollectionReusableView
        let sectionHeadCell  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderId, for: indexPath) as! SectionCell
        sectionHeadCell.sectionModel = recommendVM.sectionList[indexPath.section]
        return sectionHeadCell
    }
}
