//
//  ClassiftView.swift
//  XMLY
//
//  Created by Rochester on 18/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit
let kItemH : CGFloat = 60
fileprivate let cellId = "RemmendClassiftCell"
class ClassiftView: UIView {
    var recommendVM = RecommendVM()
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemH, height: 100)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = kMargin
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView : UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "RemmendClassiftCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        // 获取布局
        collectionView.frame = self.bounds
    }

    override init(frame : CGRect) {
        super.init(frame: frame)
        setUpUI()
        recommendVM.requestCirClePicData { 
            self.collectionView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension ClassiftView{
    fileprivate func setUpUI(){
        addCollectionView()
    }
}
extension ClassiftView{
    fileprivate func addCollectionView(){
        self.addSubview(collectionView)
    }
}
extension ClassiftView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendVM.classiftList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : RemmendClassiftCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RemmendClassiftCell
        let item : ClassiftItem = recommendVM.classiftList[indexPath.item]
        cell.item = item
        return cell
    }
}
extension ClassiftView : UICollectionViewDelegate{
    
}
