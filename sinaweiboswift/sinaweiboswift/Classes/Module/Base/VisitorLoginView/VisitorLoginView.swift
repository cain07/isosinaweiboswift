//
//  VisitorLoginView.swift
//  sinaweiboswift
//
//  Created by cain on 16/8/11.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

class VisitorLoginView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    init() {
       super.init(frame: CGRectZero)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
       // backgroundColor = UIColor.redColor()
        addSubview(imgCircle)
        addSubview(tipLabel)
        //addSubview(laowang)
    }
    
    private lazy var imgCircle:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    //private lazy var laowang:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_image_profile"))
    
    
    private lazy var iconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    private lazy var tipLabel:UILabel = {
        let l = UILabel()
        l.text = "关注一些人的 关注一些士气，你说呢的撒 打了多少放假啊上岛咖啡"
        l.textAlignment = NSTextAlignment.Center
        l.textColor = UIColor.orangeColor()
        l.sizeToFit()
        return l
    }()
    
    
    
    
    
    
    
}
