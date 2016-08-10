//
//  MainViewController.swift
//  sinaweiboswift
//
//  Created by cain on 16/8/10.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers()
        // Do any additional setup after loading the view.
    }

    private func addChildViewControllers(){
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(ProfileTableViewController(), title: "我", imageName: "tabbar_profile")
            }
    
    private func addChildViewController(uv: UIViewController,title:String,imageName:String) {
        
        let nav = UINavigationController(rootViewController: uv)
        self.tabBar.tintColor = UIColor.orangeColor()
        
        //nav.title = "home"
        uv.title = title
        uv.tabBarItem.image = UIImage(named: imageName)
//        uv.tabBarItem.selectedImage = UIImage(named: imageName+"_highlighted")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
//        
//        uv.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName :UIColor.orangeColor()],forState:UIControlState.Selected)
        addChildViewController(nav)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
