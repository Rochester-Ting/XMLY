//
//  PageView.swift
//  XMLY
//
//  Created by Rochester on 18/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit
let contentCellId = "contentICellId"
typealias CollectionItemBlock = (_ item : CGFloat)->Void
class PageView: UIView {
    var childVCs : [UIViewController]
    var parentVC : UIViewController
    var collectionItem : CollectionItemBlock?
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentCellId)
        return collectionView
    }()
    init(frame : CGRect ,childVCs : [UIViewController], parentVC : UIViewController) {
        self.childVCs = childVCs
        self.parentVC = parentVC
        super.init(frame : frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func scrollCollectionView(index : CGFloat) {
        collectionView.setContentOffset(CGPoint(x:index * screenW,y:0), animated: true)
    }
}
extension PageView{
    fileprivate func setUpUI(){
        addCollectionView()
    }
}
extension PageView{
    fileprivate func addCollectionView(){
        self.addSubview(collectionView)
        collectionView.frame = self.bounds
    }
}
// mark # collectionviewDataSource和delegate
extension PageView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVCs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellId, for: indexPath)
        for childVC in cell.contentView.subviews{
            childVC.removeFromSuperview()
        }
        let vc  = childVCs[indexPath.item]
        vc.view.frame = cell.bounds
        cell.contentView.addSubview(vc.view)
        let r = arc4random_uniform(256)
        let g = arc4random_uniform(256)
        let b = arc4random_uniform(256)
        vc.view.backgroundColor = UIColor(red: CGFloat(r) / 256.0, green: CGFloat(g) / 256.0, blue: CGFloat(b) / 256.0, alpha: 1.0)
        return cell
    }
}

extension PageView : UICollectionViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / screenW
        if (collectionItem != nil){
            collectionItem!(index)
        }
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
    }
}
