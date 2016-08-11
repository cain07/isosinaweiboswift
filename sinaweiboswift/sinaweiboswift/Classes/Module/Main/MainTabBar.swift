//
//  MainTabBar.swift
//  sinaweiboswift
//
//  Created by cain on 16/8/11.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI(){
        addSubview(composeBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let w = self.bounds.width/5
        let h = self.bounds.height
        let rect = CGRect(x: 0, y: 0, width: w, height: h)
        
        
        var index:CGFloat  = 0
        
        for subView in subviews{
            if subView.isKindOfClass(NSClassFromString("UITabBarButton")!){
                print(subView)
                subView.frame = CGRectOffset(rect, w * index, 0)
//                
//                if index == 1{
//                    index++
//                }
//                
//                index++
                index += index == 1 ? 2 :1
                
            }
            
            composeBtn.frame = CGRectOffset(rect, w*2, -20)
            bringSubviewToFront(composeBtn)
        }

    }
    
    lazy var composeBtn: UIButton = {
        let btn = UIButton()

        
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        btn.sizeToFit()
        return btn
    }()
}
