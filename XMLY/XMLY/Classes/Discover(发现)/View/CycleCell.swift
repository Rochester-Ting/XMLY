//
//  CycleCell.swift
//  RRDouyuTV
//
//  Created by 丁瑞瑞 on 16/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

import UIKit
import Kingfisher
class CycleCell: UICollectionViewCell {
    // MARK:- 空间属性
    // 名字
    @IBOutlet weak var titleLabel: UILabel!
    // 图片
    @IBOutlet weak var iconImage: UIImageView!
    var cycelModel : CircleItem?{
        didSet {
            guard let cycelModel : CircleItem = cycelModel else {return}
            guard let url = URL(string: cycelModel.pic) else {return}
            iconImage.kf.setImage(with: url)
            titleLabel.text = cycelModel.shortTitle
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
