//
//  UserAccount.swift
//  sinaweiboswift
//
//  Created by mac on 16/8/15.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

class UserAccount: NSObject {
    
    //用于调用access_token，接口获取授权后的access token。
    var access_token: String?
    //access_token的生命周期，单位是秒数
    var expires_in: NSTimeInterval = 0
    //当前授权用户的UID
    var uid: String?
    
    //用户头像地址 String
    var avatar_large: String?
    //用户名
    var name: String?
    
    
    //KVC设置初始值
    init(dict: [String : AnyObject]) {
        //super 实例化
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) { }
    
    override var description: String {
        let keys = ["access_token","expires_in","uid","avatar_large","name"]
        return dictionaryWithValuesForKeys(keys).description
    }
    
    }
