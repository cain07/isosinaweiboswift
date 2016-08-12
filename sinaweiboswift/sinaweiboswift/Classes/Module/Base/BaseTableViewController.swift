//
//  BaseTableViewController.swift
//  sinaweiboswift
//
//  Created by cain on 16/8/11.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    var loginflag:Bool = false
    
    var visitorView :VisitorLoginView?
    
    override func loadView() {
        //super.loadView()
        
        loginflag ? super.loadView():visitormode()
        
    }
    
    func visitormode(){
        visitorView = VisitorLoginView()  
        view = visitorView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

   

}
