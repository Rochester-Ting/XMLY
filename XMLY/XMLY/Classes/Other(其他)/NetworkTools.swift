//
//  NetworkTools.swift
//  XMLY
//
//  Created by Rochester on 17/1/17.
//  Copyright © 2017年 Rochester. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
enum MethodType{
    case GET
    case POST
}
class NetworkTools: NSObject {
    class func requestData(type : MethodType,urlString : String,parameters:[String : NSString]? = nil,finished:@escaping (_ responseObject:AnyObject)->()){
        let methodType = type == .GET ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(urlString, method: methodType, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard let result = response.result.value else{
                print(response.result.error ?? "未知错误")
                return
            }
            finished(result as AnyObject)
        }
    }
}
