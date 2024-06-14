//
//  WKWebViewScreenController.swift
//  ios-study
//
//  Created by 郝宜文 on 2024/6/15.
//

import UIKit
import WebKit

class WKWebViewScreenController:ViewController, WKUIDelegate{
    var webView:WKWebView!
    
    override func loadView() {
        let webviewConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webviewConfig)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://www.baidu.com")!
        let myRequest = URLRequest(url: url)
        webView.load(myRequest)
    }
    
    
}
