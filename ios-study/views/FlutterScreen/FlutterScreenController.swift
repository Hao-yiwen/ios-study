//
//  FlutterScreenController.swift
//  ios-study
//
//  Created by yw.hao on 2024/6/14.
//

import UIKit
import Flutter
import Toast_Swift

@objc
class FlutterScreenController: ViewBaseController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isShowHeader = false
        // flutter引擎无预热情况
        let flutterViewController = FlutterViewController(project: nil, nibName: nil, bundle: nil)
        
        addChild(flutterViewController)
        flutterViewController.view.frame = view.bounds
        view.addSubview(flutterViewController.view)
        flutterViewController.didMove(toParent: self)
    }
}
