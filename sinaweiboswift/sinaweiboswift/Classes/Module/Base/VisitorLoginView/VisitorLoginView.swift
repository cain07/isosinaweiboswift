//
//  VisitorLoginView.swift
//  sinaweiboswift
//
//  Created by cain on 16/8/11.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit

//// 访客登录视图代理
@objc protocol VisitorLoginViewDelegate :NSObjectProtocol {
    /// 访客视图注册
   optional func visitorLoginViewDidRegister();
    /// 访客视图登录
    func visitorLoginViewDidLogin();
}

class VisitorLoginView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    weak var delegate :VisitorLoginViewDelegate?
    
    @objc private func login(){
        delegate?.visitorLoginViewDidLogin()
    }
    
    @objc private func  rigster(){
        delegate?.visitorLoginViewDidRegister!()
    }
    
    func setViewImageTip(imageName:String?,tip:String){
        
        iconView.hidden = false
    
        tipLabel.text = tip
        if imageName != nil{
            imgCircle.image = UIImage(named: imageName!)
            iconView.hidden = true
        }else{
            startAnimation()
        }
        
    }
    //动画效果
    private func startAnimation(){
        let ani = CABasicAnimation(keyPath: "transform.rotation")
        ani.duration = 20
        ani.toValue = 2 * M_PI
        ani.repeatCount = MAXFLOAT
        ani.removedOnCompletion = false
        imgCircle.layer.addAnimation(ani, forKey: nil)
    }

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
        addSubview(imgBack)
        
        addSubview(iconView)
        addSubview(tipLabel)
        addSubview(rigistBtn)
        addSubview(loginBtn)
        
        
        
        //addSubview(laowang)
        
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }

        
        addConstraint( NSLayoutConstraint(item: imgCircle, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint( NSLayoutConstraint(item: imgCircle, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: 0))
        
        addConstraint( NSLayoutConstraint(item: iconView, attribute: .CenterX, relatedBy: .Equal, toItem: imgCircle, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint( NSLayoutConstraint(item: iconView, attribute: .CenterY, relatedBy: .Equal, toItem: imgCircle, attribute: .CenterY, multiplier: 1.0, constant: 0))
        
        addConstraint( NSLayoutConstraint(item: tipLabel, attribute: .CenterX, relatedBy: .Equal, toItem: iconView, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint( NSLayoutConstraint(item: tipLabel, attribute: .CenterY, relatedBy: .Equal, toItem: iconView, attribute: .Bottom, multiplier: 1.0, constant: 86))
        
        //文本宽
        addConstraint( NSLayoutConstraint(item: tipLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 323))
        //文本的高
        addConstraint( NSLayoutConstraint(item: tipLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 52))
        
        //左边按钮
        addConstraint( NSLayoutConstraint(item: loginBtn, attribute: .Left, relatedBy: .Equal, toItem: tipLabel, attribute: .Left, multiplier: 1.0, constant: 0))
        addConstraint( NSLayoutConstraint(item: loginBtn, attribute: .Top, relatedBy: .Equal, toItem: tipLabel, attribute: .CenterY, multiplier: 1.0, constant: 26))
        
        //按钮宽 高
        addConstraint( NSLayoutConstraint(item: loginBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 150))
        
        addConstraint( NSLayoutConstraint(item: loginBtn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30))
        
        //右边按钮
        addConstraint( NSLayoutConstraint(item: rigistBtn, attribute: .Right, relatedBy: .Equal, toItem: tipLabel, attribute: .Right, multiplier: 1.0, constant: 0))
        addConstraint( NSLayoutConstraint(item: rigistBtn, attribute: .Top, relatedBy: .Equal, toItem: tipLabel, attribute: .CenterY, multiplier: 1.0, constant: 26))
        
        //按钮宽 高
        addConstraint( NSLayoutConstraint(item: rigistBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 150))
        
        addConstraint( NSLayoutConstraint(item: rigistBtn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30))
        
        
        
        //遮盖层
//        addConstraint( NSLayoutConstraint(item: imgBack, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0))
//        addConstraint( NSLayoutConstraint(item: imgBack, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: 0))
        
        addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[imgBack]-0-|", options: [], metrics: nil, views: ["imgBack":imgBack]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[imgBack]-(-30)-[rigistBtn]", options: [], metrics: nil, views: ["imgBack":imgBack,"rigistBtn":rigistBtn]))
        
        backgroundColor = UIColor(white: 0.93, alpha: 1)
        
        loginBtn.addTarget(self, action: "login", forControlEvents: .TouchUpInside)
        rigistBtn.addTarget(self, action: "rigster", forControlEvents: .TouchUpInside)
        
    }
    
    private lazy var imgCircle:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    private lazy var imgBack:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))

    
    //private lazy var laowang:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_image_profile"))
    
    
    private lazy var iconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    private lazy var tipLabel:UILabel = {
        let l = UILabel()
        l.text = "关注一些人的 关注一些士气，你说呢的撒 打了多少放假啊上岛咖啡"
        l.textAlignment = NSTextAlignment.Center
        l.textColor = UIColor.orangeColor()
        l.sizeToFit()
        l.numberOfLines = 0
        return l
    }()
    
    
    private lazy var loginBtn:UIButton = {
       let btn = UIButton()
        btn.setTitle("登陆", forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        return btn
    }()
    
    private lazy var rigistBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        return btn
    }()
    
    
    
    
}
