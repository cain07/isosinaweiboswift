//
//  HomeTableViewController.swift
//  sinaweiboswift
//
//  Created by cain on 16/8/10.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

import AFNetworking

import SVProgressHUD


class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView?.setViewImageTip(nil, tip: "关注一些人，回这里看看有什么惊喜")
        
           }

    
    func domo(){
        let afh =  AFHTTPSessionManager()
        afh.responseSerializer.acceptableContentTypes?.insert("text/html")
        
        SVProgressHUD.show()
        afh.GET("http://www.weather.com.cn/data/sk/101010100.html", parameters: nil, success: { (task, result) -> Void in
            SVProgressHUD.dismiss()
            print(result)
            }) { (_, error) -> Void in
                SVProgressHUD.showErrorWithStatus("程序出现错啊")
                print(error)
        }

    }
   
    

}
