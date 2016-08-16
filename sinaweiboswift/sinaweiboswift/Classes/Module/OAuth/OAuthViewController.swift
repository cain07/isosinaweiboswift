//
//  OAuthViewController.swift
//  sinaweiboswift
//
//  Created by mac on 16/8/14.
//  Copyright © 2016年 cain. All rights reserved.
//

import UIKit
import SVProgressHUD
import AFNetworking

class OAuthViewController: UIViewController {
    
       
    let webview = UIWebView()
    
    func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func fullUser(){
        
        let js = "document.getElementById('userId').value = '15659391237';" +
        "document.getElementById('passwd').value = '321333asdf';"
        webview.stringByEvaluatingJavaScriptFromString(js)
    }
    
    override func loadView() {
        view = webview
        webview.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
        loadAuthPage()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        SVProgressHUD.dismiss()
        
    }
    
    func loadAuthPage(){
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(appKey)&redirect_uri=\(redirectUri)"
        let urlauth = NSURL(string:urlString)
        let requesturl = NSURLRequest(URL: urlauth!)
        webview.loadRequest(requesturl)
    }

    
    func setUpUI(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: "close")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: .Plain, target: self, action: "fullUser")
    }
    

}

extension OAuthViewController :UIWebViewDelegate{
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request.URL)
        
        guard let urlStr = request.URL?.absoluteString else{
            return false
        }
        
        if urlStr.hasPrefix("https://api.weibo.com") {
            return true
        }
        
        if !urlStr.hasPrefix(redirectUri) {
            return false
        }
        
        print(urlStr)
        
        guard let query = request.URL?.query else {
            return false
        }
        
        print(query)
        
        let codeStr = "code="
        
        let code = query.substringFromIndex(codeStr.endIndex)
        
        print(code)
        
        //getAccessToken(code)
        UserAccountViewModel().getAccessToken(code){(error) ->() in
            print("come here")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
        
        return false
    }
    
    
    
    
}
