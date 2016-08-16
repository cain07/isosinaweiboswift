//
//  UserAccount.swift
//  sinaweiboswift
//
//  Created by mac on 16/8/15.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

class UserAccount: NSObject,NSCoding{
    
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
    
    //归档
    func saveAccount(){
        let path =   (NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last! as NSString).stringByAppendingPathComponent("account.plist")
        NSKeyedArchiver.archiveRootObject(self, toFile: path)
        print(path)
    }
    
    
    //解档
    class func loadAccount()->UserAccount?{
        let path =   (NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last! as NSString).stringByAppendingPathComponent("account.plist")
        
       if let account =  NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? UserAccount{
            return account
        }
        return nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        expires_in = aDecoder.decodeDoubleForKey("expires_in")
        uid = aDecoder.decodeObjectForKey("uid") as? String
        avatar_large = aDecoder.decodeObjectForKey("avatar_large") as? String
        name = aDecoder.decodeObjectForKey("avatar_large") as? String
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeDouble(expires_in, forKey: "expires_in")
        aCoder.encodeObject(uid, forKey: "uid")
        aCoder.encodeObject(avatar_large, forKey: "avatar_large")
        aCoder.encodeObject(name, forKey: "name")
        
    }
    
}
