//
//  DetailCell.swift
//  XMLY
//
//  Created by Rochester on 18/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit
import Kingfisher
class DetailCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var intro: UILabel!
    @IBOutlet weak var imagev: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var detailItem : DetailItem?{
        didSet {
            guard let detailItem = detailItem else{return}
            name.text = detailItem.title
            intro.text = detailItem.intro
            guard let url = URL(string: detailItem.albumCoverUrl290) else {return}
            imagev.kf.setImage(with: url)
        }
    }

}
