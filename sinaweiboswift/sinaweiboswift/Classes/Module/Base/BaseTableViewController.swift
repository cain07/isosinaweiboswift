//
//  BaseTableViewController.swift
//  sinaweiboswift
//
//  Created by cain on 16/8/11.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController,VisitorLoginViewDelegate {
    
    var loginflag:Bool = false
    
    var visitorView :VisitorLoginView?
    
    override func loadView() {
        //super.loadView()
        
        loginflag ? super.loadView():visitormode()
        
    }
    
    func visitormode(){
        visitorView = VisitorLoginView()  
        view = visitorView
        visitorView?.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登陆", style: .Plain, target: self, action: "visitorLoginViewDidLogin")
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: "visitorLoginViewDidRegister")
        
        //UINavigationBar.appearance().tintColor = UIColor.orangeColor()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func visitorLoginViewDidRegister() {
        print("rigist")
    }
    
    func visitorLoginViewDidLogin() {
        print("login")
        
        let oauth = OAuthViewController()
        
        let nav = UINavigationController(rootViewController: oauth)
        presentViewController(nav, animated: true, completion: nil)
    }
    

   

}
