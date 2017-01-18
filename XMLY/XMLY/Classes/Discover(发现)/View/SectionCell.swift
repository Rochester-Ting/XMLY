//
//  SectionCell.swift
//  XMLY
//
//  Created by Rochester on 18/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit

class SectionCell: UICollectionReusableView {
    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var sectionModel : sectionItem?{
        didSet {
            guard let sectionModel = sectionModel else {
                return
            }
            title.text = sectionModel.title
            
        }
    }
    
}
