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
    
    override func loadView() {
        //super.loadView()
        
        loginflag ? super.loadView():visitormode()
        
    }
    
    func visitormode(){
        view = VisitorLoginView()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

   

}
