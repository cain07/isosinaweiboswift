//
//  UserAccountViewModel.swift
//  sinaweiboswift
//
//  Created by cain on 16/8/16.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit
import SVProgressHUD
import AFNetworking

class UserAccountViewModel: NSObject {

    private func getAccessToken(code:String){
        
        let urlString = "https://api.weibo.com/oauth2/access_token"
        let afh = AFHTTPSessionManager()
        let params = ["client_id": appKey,
            "client_secret": appSecret,
            "grant_type": "authorization_code",
            "code": code,
            "redirect_uri": redirectUri]
        afh.responseSerializer.acceptableContentTypes?.insert("text/plain")
        afh.POST(urlString, parameters: params, success: { (_, result) -> Void in
            print(result)
            if let resultobj = result as?  [String:AnyObject]{
                
                let accout = UserAccount.init(dict: resultobj)
                
                self.getUseInfo(accout)
            }
            
            }) { (_, error) -> Void in
                print(error)
        }
    }
    
    private func getUseInfo(accout:UserAccount){
        let url = "https://api.weibo.com/2/users/show.json"
        let afh = AFHTTPSessionManager()
        let params = ["access_token":accout.access_token!,"uid":accout.uid!]
        afh.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        afh.GET(url, parameters: params, success: { (_, result) -> Void in
            print(result)
            if let resultAny = result as? [String:AnyObject]{
                accout.avatar_large =  resultAny["avatar_large"] as? String
                accout.name = resultAny["name"] as? String
                print(accout)
                
                accout.saveAccount()
            }
            
            }) { (_, error) -> Void in
                print(error)
        }
    }
}
