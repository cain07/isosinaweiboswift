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
        backgroundColor = UIColor.redColor()
    }
}
