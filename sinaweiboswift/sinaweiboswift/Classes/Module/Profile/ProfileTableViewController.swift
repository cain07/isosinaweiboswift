//
//  ProfileTableViewController.swift
//  sinaweiboswift
//
//  Created by cain on 16/8/10.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

class ProfileTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView?.setViewImageTip("visitordiscover_image_profile", tip: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人");

    }
   
}
