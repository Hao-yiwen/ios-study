//
//  WKWebViewScreenController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/15.
//

import UIKit
import WebKit

@objc class WKWebViewScreenController:UIViewController, WKUIDelegate{
    var webView:WKWebView!
    @objc var urlString:String!
    
    override func loadView() {
        let webviewConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webviewConfig)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlString = urlString, let url = URL(string: urlString) else {
            // 如果 urlString 不存在或无法转换为 URL，则使用默认的 URL
            let defaultURL = URL(string: "http://www.baidu.com")!
            let myRequest = URLRequest(url: defaultURL)
            webView.load(myRequest)
            return
        }
        // 使用传递来的 URL
        let myRequest = URLRequest(url: url)
        webView.load(myRequest)
    }
}
