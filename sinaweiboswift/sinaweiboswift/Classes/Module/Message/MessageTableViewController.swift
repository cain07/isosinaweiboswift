//
//  MessageTableViewController.swift
//  sinaweiboswift
//
//  Created by cain on 16/8/10.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

class MessageTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        visitorView?.setViewImageTip("visitordiscover_image_message", tip: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知");

          }

   
}
