//
//  sectionItem.swift
//  XMLY
//
//  Created by Rochester on 18/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit

class sectionItem: NSObject {
    var title : String = ""
    var detailItems : [DetailItem] = [DetailItem]()
    var list : [[String : NSObject]]?{
        didSet {
            guard let list = list else {return}
            for dict in list {
                detailItems.append(DetailItem(dict: dict))
            }
        }
    }
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
