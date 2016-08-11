//
//  BaseTableViewController.swift
//  sinaweiboswift
//
//  Created by cain on 16/8/11.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    var loginflag:Bool = true
    
    override func loadView() {
        //super.loadView()
        
        loginflag ? super.loadView():visitormode()
        
    }
    
    func visitormode(){
        let v = UIView()
        v.backgroundColor = UIColor.redColor()
        view = v
        //print(view)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

   

}
