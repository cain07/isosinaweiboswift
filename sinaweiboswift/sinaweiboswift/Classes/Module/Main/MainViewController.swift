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
        let home = HomeTableViewController()
        let nav = UINavigationController(rootViewController: home)
        
        nav.title = "home"
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
