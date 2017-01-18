//
//  RemmendClassiftCell.swift
//  XMLY
//
//  Created by Rochester on 18/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit
import Kingfisher
class RemmendClassiftCell: UICollectionViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    var item : ClassiftItem?{
        didSet {
            guard let item : ClassiftItem = item else{return}
            name.text = item.title
            guard let url = URL(string: item.coverPath) else{return}
            icon.kf.setImage(with: url)
            
        }
    }
    

}
