//
//  File.swift
//  ios-study
//
//  Created by yw.hao on 2024/6/13.
//

import UIKit
import React

class RNScreenController: UIViewController, UIGestureRecognizerDelegate{
    var popRecognizer: InteractivePopRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
            let jsCodeLocation: URL
//            if let debugURL = URL(string: "http://192.168.1.7:8081/index.bundle?platform=ios") {
            if let debugURL = URL(string: "http://127.0.0.1:8081/index.bundle?platform=ios") {
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
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setInteractiveRecognizer()
    }
    
    private func setInteractiveRecognizer() {
        guard let controller = navigationController else { return }
        popRecognizer = InteractivePopRecognizer(controller: controller)
        controller.interactivePopGestureRecognizer?.delegate = popRecognizer
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
