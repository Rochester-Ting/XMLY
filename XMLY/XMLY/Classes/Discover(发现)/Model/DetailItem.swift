//
//  DetailItem.swift
//  XMLY
//
//  Created by Rochester on 18/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit

class DetailItem: NSObject {
    var title : String = ""
    var albumCoverUrl290 : String = ""
    var intro : String = ""
    
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
