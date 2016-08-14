//
//  OAuthViewController.swift
//  sinaweiboswift
//
//  Created by mac on 16/8/14.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController {
    
    let webview = UIWebView()
    
    func close(){

        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func loadView() {
        view = webview
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        // Do any additional setup after loading the view.
    }

    
    func setUpUI(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: "close")
    }
    

}
