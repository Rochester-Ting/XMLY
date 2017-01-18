//
//  RandomColor.swift
//  XMLY
//
//  Created by Rochester on 18/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit

class RandomColor: NSObject {
    class func randomColor()->UIColor{
        let r = arc4random_uniform(256)
        let g = arc4random_uniform(256)
        let b = arc4random_uniform(256)
        return UIColor(red: CGFloat(r) / 256.0, green: CGFloat(g) / 256.0, blue: CGFloat(b) / 256.0, alpha: 1.0)
    }
}
