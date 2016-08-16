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
    
    // MARK: - 应用程序信息
    private let appKey      = "1951394302"
    private let appSecret   = "57aa44f17fd6a2d37cacf5ff74efc8a4"
    private let redirectUri = "http://news.baidu.com/"
    
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
        
        getAccessToken(code)
        
        return false
    }
    
    private func getAccessToken(code:String){
        
        let urlString = "https://api.weibo.com/oauth2/access_token"
        let afh = AFHTTPSessionManager()
        let params = ["client_id": appKey,
            "client_secret": appSecret,
            "grant_type": "authorization_code",
            "code": code,
            "redirect_uri": redirectUri]
        afh.responseSerializer.acceptableContentTypes?.insert("text/plain")
        afh.POST(urlString, parameters: params, success: { (_, result) -> Void in
            print(result)
            if let resultobj = result as?  [String:AnyObject]{
                
                let accout = UserAccount.init(dict: resultobj)
                
                self.getUseInfo(accout)
//                print(accout)
//                
//                let access_token =  resultobj["access_token"] as? String
//                let uid = resultobj["uid"] as? String
//                self.getUseInfo(access_token!, uid: uid!)
            }
            
            }) { (_, error) -> Void in
              print(error)
        }
    }
    
    private func getUseInfo(accout:UserAccount){
        let url = "https://api.weibo.com/2/users/show.json"
        let afh = AFHTTPSessionManager()
        let params = ["access_token":accout.access_token!,"uid":accout.uid!]
        afh.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        afh.GET(url, parameters: params, success: { (_, result) -> Void in
            print(result)
            if let resultAny = result as? [String:AnyObject]{
             accout.avatar_large =  resultAny["avatar_large"] as? String
             accout.name = resultAny["name"] as? String
                print(accout)
                
                accout.saveAccount()
            }
            
            
            
            }) { (_, error) -> Void in
                print(error)
        }
    }
    
    
}
