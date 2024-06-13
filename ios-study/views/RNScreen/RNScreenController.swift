//
//  File.swift
//  ios-study
//
//  Created by yw.hao on 2024/6/13.
//

import UIKit
import React

class RNScreenController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
            let jsCodeLocation: URL
            if let debugURL = URL(string: "http://localhost:8081/index.bundle?platform=ios") {
                jsCodeLocation = debugURL
            } else {
                jsCodeLocation = Bundle.main.url(forResource: "main", withExtension: "jsbundle")!
            }
        #else
            let jsCodeLocation = Bundle.main.url(forResource: "main", withExtension: "jsbundle")!
        #endif
                
        let mockData: NSDictionary = ["scores": ["test": 1]]
        
        // 如果是debug环境就用url 但是有静态文件兜底
        
        // 如果是生产环境 则用静态文件
        
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "rnDemo0742",
            initialProperties: mockData as? [AnyHashable: Any],
            launchOptions: nil
        )
        
        self.view = rootView
    }
}
