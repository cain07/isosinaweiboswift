//
//  DiscoverTableViewController.swift
//  sinaweiboswift
//
//  Created by cain on 16/8/10.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

class DiscoverTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView?.setViewImageTip("visitordiscover_image_message", tip: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过");
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

   
}
